/*
    sysctrl.v
 
    generic system control interface fro/via the MCU

    TODO: This is currently very core specific. This needs to be
    generic for all cores.
*/

module sysctrl (
  input		        clk,
  input		        reset,

  input		        data_in_strobe,
  input		        data_in_start,
  input [7:0]	    data_in,
  output reg [7:0]  data_out,

  // interrupt interface
  output	        int_out_n,
  input [7:0]	    int_in,
  output [7:0]      int_ack,

  input [1:0]	    buttons, // S0 and S1 buttons on Tang Nano 20k

  output reg [1:0]  leds, // two leds can be controlled from the MCU
  output     [23:0] color, // a 24bit color to e.g. be used to drive the ws2812

  // values that can be configured by the user
  output     [1:0]  system_reset,
  output reg [1:0]  system_scanlines,
  output reg [1:0]  system_volume,
  output reg	    system_wide_screen,
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
  output reg        system_joyswap,
  output reg        cold_boot
);

reg [3:0] state;
reg [7:0] command;
reg [7:0] id;
   
// reverse data byte for rgb   
wire [7:0] data_in_rev = { data_in[0], data_in[1], data_in[2], data_in[3], 
                           data_in[4], data_in[5], data_in[6], data_in[7] };

reg coldboot = 1'b1;
reg sys_int = 1'b1;
// the system control interrupt or any other interrupt (e,g sdc, hid, ...)
// activates the interrupt line to the MCU by pulling it low
assign int_out_n = (int_in != 8'h00 || sys_int)?1'b0:1'b1;

// by default system is in reset
reg [1:0] main_reset = 2'd3;
reg [31:0] main_reset_timeout = 32'd80_000_000;
reg [23:0] color_i = 24'h000000;
reg [7:0] int_ack_i = 8'h00;
assign system_reset = main_reset;
assign cold_boot = coldboot;
assign color = color_i;
assign int_ack = int_ack_i;

// process mouse events
always @(posedge clk) begin
   if(reset) begin
      state <= 4'd0;      
      leds <= 2'b00;        // after reset leds are off
      color_i <= 24'h000000;  // color black -> rgb led off

      // stay in reset for about 3 seconds or until MCU releases reset
      main_reset <= 2'd3;
      main_reset_timeout <= 32'd80_000_000;

      int_ack_i <= 8'h00;
      coldboot = 1'b1;      // reset is actually the power-on-reset
      sys_int = 1'b1;       // coldboot interrupt

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
        // BRG LED yellow if no MCU has responded
        color_i <= 24'h000202;
        end
      end

      int_ack_i <= 8'h00;

      // iack bit 0 acknowledges the coldboot notification
      if(int_ack_i[0]) sys_int <= 1'b0;
      
      if(data_in_strobe) begin
        if(data_in_start) begin
            state <= 4'd1;
            command <= data_in;
        end else if(state != 4'd0) begin
            if(state != 4'd15) state <= state + 4'd1;
	    
            // CMD 0: status data
            if(command == 8'd0) begin
                // return some pattern that would not appear randomly
	            // on e.g. an unprogrammed device
                if(state == 4'd1) data_out <= 8'h5c;
                if(state == 4'd2) data_out <= 8'h42;
                if(state == 4'd3) data_out <= 8'h05; // core id 5 = Atari 2600 
            end
	   
            // CMD 1: there are two MCU controlled LEDs
            if(command == 8'd1) begin
                if(state == 4'd1) leds <= data_in[1:0];
            end

            // CMD 2: a 24 color value to be mapped e.g. onto the ws2812
            if(command == 8'd2) begin
                if(state == 4'd1) color_i[15: 8] <= data_in_rev;
                if(state == 4'd2) color_i[ 7: 0] <= data_in_rev;
                if(state == 4'd3) color_i[23:16] <= data_in_rev;
            end

            // CMD 3: return button state
            if(command == 8'd3) begin
                data_out <= { 6'b000000, buttons };;
            end

            // CMD 4: config values (e.g. set by user via OSD)
            if(command == 8'd4) begin
                // second byte can be any character which identifies the variable to set 
                if(state == 4'd1) id <= data_in;

                if(state == 4'd2) begin
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
                if(state == 4'd1) int_ack_i <= data_in;

            // interrupt[0] notifies the MCU of a FPGA cold boot e.g. if
                // the FPGA has been loaded via USB
                data_out <= { int_in[7:1], sys_int };
            end

            // CMD 6: read system interrupt source
            if(command == 8'd6) begin
                // bit[0]: coldboot flag
                // bit[1]: port data is available
                data_out <= { 7'b0000000, coldboot };
                // reading the interrupt source acknowledges the coldboot notification
                if(state == 4'd1) coldboot <= 1'b0;
            end
         end
      end
   end
end

endmodule
