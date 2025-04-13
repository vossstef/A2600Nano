/*
    sysctrl.v
 
    generic system control interface fro/via the MCU

    TODO: This is currently very core specific. This needs to be
    generic for all cores.
*/

module sysctrl (
  input             clk,
  input             reset,

  input             data_in_strobe,
  input             data_in_start,
  input [7:0]       data_in,
  output reg [7:0]  data_out,

  // interrupt interface
  output            int_out_n,
  input [7:0]       int_in,
  output reg [7:0]  int_ack,

  input [1:0]       buttons, // S0 and S1 buttons on Tang Nano 20k

  output reg [1:0]  leds,  // two leds can be controlled from the MCU
  output reg [23:0] color, // a 24bit color to e.g. be used to drive the ws2812
  // IO port interface
  input	[31:0]     port_status,         // status bits to report additional info about the port
  input	[7:0]      port_out_available,  // number of bytes available for transmission to MCU
  output reg       port_out_strobe,
  input [7:0]      port_out_data,
  input	[7:0]      port_in_available,   // number of unused bytes in the input buffer
  output reg	     port_in_strobe,
  output reg [7:0] port_in_data,

  // values that can be configured by the user
  output reg [1:0]  system_reset,
  output reg [1:0]  system_scanlines,
  output reg [1:0]  system_volume,
  output reg        system_wide_screen,
  output reg [3:0]  system_port_1,
  output reg [3:0]  system_port_2,
  output reg [1:0]  system_video_std,
  output reg        system_paddle,
  output reg        system_diff_p1,
  output reg        system_diff_p2,
  output reg        system_decomb,
  output reg        system_vblank,
  output reg        system_vm,
  output reg [1:0]  system_sc,
  output reg        system_joyswap
);

reg [3:0] state;
reg [7:0] command;
reg [7:0] id;
   
// reverse data byte for rgb   
wire [7:0] data_in_rev = { data_in[0], data_in[1], data_in[2], data_in[3], 
                           data_in[4], data_in[5], data_in[6], data_in[7] };

// coldboot flash and system interrupt   
reg coldboot = 1'b1;   
reg sys_int = 1'b1;

// the system cobtrol interrupt or any other interrupt (e,g sdc, hid, ...)
// activates the interrupt line to the MCU by pulling it low
assign int_out_n = (int_in != 8'h00 || sys_int)?1'b0:1'b1;
   
reg       port_out_availableD;
reg [7:0] port_cmd;   
reg [7:0] port_index;

// include the menu rom derived from atarist.xml
reg [11:0] menu_rom_addr;
reg [7:0]  menu_rom_data;

// generate hex e.g.:
// gzip -n vic20.xml
// xxd -c1 -p vic20.xml.gz > vic20_xml.hex
reg [7:0] vic20_xml[2048];
initial $readmemh("vic20_xml.hex", vic20_xml);

always @(posedge clk)
  menu_rom_data <= vic20_xml[menu_rom_addr];

// by default system is in reset
reg [1:0] main_reset = 2'd3;
reg [31:0] main_reset_timeout = 32'd80_000_000;
assign system_reset = main_reset;

// process mouse events
always @(posedge clk) begin
   if(reset) begin
      state <= 4'd0;      
      leds <= 2'b00;        // after reset leds are off
      color <= 24'h000000;  // color black -> rgb led off
      // stay in reset for about 3 seconds or until MCU releases reset
      main_reset <= 2'd3;
      main_reset_timeout <= 32'd80_000_000;
      int_ack <= 8'h00;
      coldboot = 1'b1;      // reset is actually the power-on-reset
      sys_int = 1'b1;       // coldboot interrupt
      port_out_strobe <= 1'b0;
      port_in_strobe <= 1'b0;

      // OSD value defaults. These should be sane defaults, but the MCU
      // will very likely override these early
      system_scanlines <= 2'b00;
      system_volume <= 2'b10;
      system_wide_screen <= 1'b0;
      system_port_1 <= 4'b0000;
      system_port_2 <= 4'b0000;
      system_video_std <= 1'b0;
      system_paddle <= 1'b0;
      system_diff_p1 <= 1'b0;
      system_diff_p2 <= 1'b0;
      system_decomb <= 1'b0;
      system_vblank <= 1'b0;
      system_vm <= 1'b0;
      system_sc <= 2'b11;
      system_joyswap <= 1'b0;

   end else begin

      // release main reset after timeout
      if(main_reset_timeout) begin
        main_reset_timeout <= main_reset_timeout - 32'd1;

        if(main_reset_timeout == 32'd1) begin
          main_reset <= 2'd0;
          end
      end

      int_ack <= 8'h00;
      port_out_strobe <= 1'b0;
      port_in_strobe <= 1'b0;

      // iack bit 0 acknowledges the system control interrupt
      if(int_ack[0]) sys_int <= 1'b0;      
            
      // (further) data has just become available, so raise interrupt
      port_out_availableD <= (port_out_available != 8'd0);
      if(port_out_available && !port_out_availableD)
        sys_int <= 1'b1;
      
      if(data_in_strobe) begin
        if(data_in_start) begin
           state <= 4'd0;
           command <= data_in;
           menu_rom_addr <= 12'd0;
           data_out <= 8'h00;
        end else begin
            if(state != 4'd15) state <= state + 4'd1;
	    
            // CMD 0: status data
            if(command == 8'd0) begin
                // return some pattern that would not appear randomly
	        // on e.g. an unprogrammed device
                if(state == 4'd0) data_out <= 8'h5c;
                if(state == 4'd1) data_out <= 8'h42;
                if(state == 4'd2) data_out <= 8'h00; // core id 5 = Atari 2600 
            end
	   
            // CMD 1: there are two MCU controlled LEDs
            if(command == 8'd1) begin
                if(state == 4'd0) leds <= data_in[1:0];
            end

            // CMD 2: a 24 color value to be mapped e.g. onto the ws2812
            if(command == 8'd2) begin
                if(state == 4'd0) color[15: 8] <= data_in_rev;
                if(state == 4'd1) color[ 7: 0] <= data_in_rev;
                if(state == 4'd2) color[23:16] <= data_in_rev;
            end

            // CMD 3: return button state
            if(command == 8'd3) begin
                data_out <= { 6'b000000, buttons };;
            end

            // CMD 4: config values (e.g. set by user via OSD)
            if(command == 8'd4) begin
                // second byte can be any character which identifies the variable to set 
                if(state == 4'd0) id <= data_in;

                if(state == 4'd1) begin
                    // Joystick port 1 input device selection
                    if(id == "Q") system_port_1 <= data_in[3:0];
                    // Joystick port 2 input device selection
                    if(id == "J") system_port_2 <= data_in[3:0];
                    // Joystick swap port
                    if(id == "&") system_joyswap <= data_in[0];
                    // invert paddle
                    if(id == "V") system_paddle <= data_in[0];
                    // Difficulty P1
                    if(id == "X") system_diff_p1 <= data_in[0];
                    // Difficulty P2
                    if(id == "Y") system_diff_p2 <= data_in[0];
                    // De-comb
                    if(id == "C") system_decomb <= data_in[0]; 
                    // VBlank
                    if(id == "M") system_vblank <= data_in[0];
                    // video mode black&while
                    if(id == "O") system_vm <= data_in[0];
                    // superchip auto / off / on
                    if(id == "U") system_sc <= data_in[1:0];
                    // auto/pal / ntsc
                    if(id == "E") system_video_std <= data_in[1:0];
                    // reset(1) or reset(0)
                    if(id == "R") begin
                      main_reset <= data_in[1:0];
                      // cancel out-timeout if MCU is active
                      main_reset_timeout <= 32'd0;
                    end
                    // Value "S": scanlines none(0), 25%(1), 50%(2) or 75%(3)
                    if(id == "S") system_scanlines <= data_in[1:0];
                    // Value "A": volume mute(0), 33%(1), 66%(2) or 100%(3)
                    if(id == "A") system_volume <= data_in[1:0];
                    // Value "W": normal 4:3 screen (0), wide 16:9 screen (1)
                    if(id == "W") system_wide_screen <= data_in[0];
                end
            end

            // CMD 5: interrupt control
            if(command == 8'd5) begin
                // second byte acknowleges the interrupts
                if(state == 4'd0) int_ack <= data_in;

	        // interrupt[0] notifies the MCU of a FPGA cold boot e.g. if
                // the FPGA has been loaded via USB
                data_out <= { int_in[7:1], sys_int };
            end
	   
            // CMD 6: read system interrupt source
            if(command == 8'd6) begin
	        // bit[0]: coldboot flag
	        // bit[1]: port data is available
                data_out <= { 6'b000000, (port_out_available != 8'd0), coldboot };
	        // reading the interrupt source acknowledges the coldboot notification
	        if(state == 4'd0) coldboot <= 1'b0;            
	    end

            // CMD 7: port command (e.g. rs232)
            if(command == 8'd7) begin

	       // the first two bytes of a port command always have the same meaning ...
               if(state == 4'd0) begin
		  // first byte is the subcommand
		  port_cmd <= data_in;
		  // return the number of ports implemented in this core
		  data_out <= 8'd1;
	       end else if(state == 4'd1) begin
		  // second byte is the port index (if several ports are supported)
		  port_index <= data_in;
		  // return port type (currently supports only 0=serial)
		  data_out <= 8'd0;
	       end else begin
		  // ... further bytes are subcommand specific

		  // port subcommand 0: get status
		  if(port_cmd == 8'd0 && port_index == 8'd0) begin
		     if(state == 4'd2)       data_out <= port_out_available;
		     else if(state == 4'd3)  data_out <= port_in_available;
		     // port status for type 0 (serial) is still close to the format
		     // that was introduced with the first MiST
		     else if(state == 4'd4)  data_out <= port_status[31:24];  // bitrate[7:0]
		     else if(state == 4'd5)  data_out <= port_status[23:16];  // bitrate[15:8]
		     else if(state == 4'd6)  data_out <= port_status[15:8];   // bitrate[23:16]
		     else if(state == 4'd7)  data_out <= port_status[7:0];    // databits, parity and stopbits
		     else                    data_out <= 8'h00;
		  end
		  
		  // port subcommand 1: read port data
		  else if(port_cmd == 8'd1 && port_index == 8'd0) begin
		     data_out <= port_out_data;

		     // reading the byte ack's the mfp's fifo. Since the
		     // data arrives with one byte delay at the MCU we need
		     // to make sure that the last read will not trigger
		     // another fifo read. The MCU will thus not set bit[0] for
		     // the last read to suppress the fifo read
		     port_out_strobe <= data_in[0];
		  end
		  
		  // port subcommand 2: write port data
		  else if(port_cmd == 8'd2 && port_index == 8'd0) begin
		     port_in_data <= data_in;
		     port_in_strobe <= 1'b1;
		  end
		  
	       end
            end // if (command == 8'd7)
	   
            // CMD 8: read (menu) config
            if(command == 8'd8) begin
	       data_out <= menu_rom_data;
	       menu_rom_addr <= menu_rom_addr + 12'd1;
	    end
	   
	end
      end // if (data_in_strobe)
   end
end
    
endmodule
