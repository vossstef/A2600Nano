/*
    hid.v
 
    hid (keyboard, mouse etc) interface to the IO MCU
    A2600 specific
  */

module hid (
  input             clk,
  input             reset,

  input             data_in_strobe,
  input             data_in_start,
  input [7:0]       data_in,
  output reg [7:0]  data_out,

  // input local db9 port events to be sent to MCU
  input  [5:0]      db9_port,
  output reg        irq,
  input             iack,

  // output HID data received from USB
  output reg [7:0]  joystick0,
  output reg [7:0]  joystick1,
  output reg [7:0]  numpad,
  input  [7:0]      keyboard_matrix_out,
  output [7:0]      keyboard_matrix_in,
  output reg        key_restore,
  output reg        tape_play,
  output reg        mod_key,
  output reg [1:0]  mouse_btns,
  output reg [7:0]  mouse_x,
  output reg [7:0]  mouse_y,
  output reg        mouse_strobe,
  output reg [7:0]  joystick0ax,
  output reg [7:0]  joystick0ay,
  output reg [7:0]  joystick1ax,
  output reg [7:0]  joystick1ay,
  output reg        joystick_strobe,
  output reg [7:0]  extra_button0,
  output reg [7:0]  extra_button1
);

reg [7:0] keyboard[7:0]; // array of 8 elements of width 8bit

//keyboard 
assign keyboard_matrix_in =
	      (!keyboard_matrix_out[0]?keyboard[0]:8'hff)&
	      (!keyboard_matrix_out[1]?keyboard[1]:8'hff)&
	      (!keyboard_matrix_out[2]?keyboard[2]:8'hff)&
	      (!keyboard_matrix_out[3]?keyboard[3]:8'hff)&
	      (!keyboard_matrix_out[4]?keyboard[4]:8'hff)&
	      (!keyboard_matrix_out[5]?keyboard[5]:8'hff)&
	      (!keyboard_matrix_out[6]?keyboard[6]:8'hff)&
	      (!keyboard_matrix_out[7]?keyboard[7]:8'hff);

assign mouse_x = mouse_x_cnt;
assign mouse_y = mouse_y_cnt;
reg [14:0] mouse_div;
reg [3:0] state;
reg [7:0] command;  
reg [7:0] device;   // used for joystick
reg [7:0] mouse_x_cnt;
reg [7:0] mouse_y_cnt;
reg irq_enable;
reg [5:0] db9_portD;
reg [5:0] db9_portD2;

// translate incoming HID key codes into
// VIC key matrix positions
wire [2:0] kbd_row;
wire [2:0] kbd_column;   
keymap keymap (
       .code   ( data_in[6:0] ),
       .row    ( kbd_row      ),
       .column ( kbd_column   )
);  
   
// process mouse events
always @(posedge clk) begin
   if(reset) begin
      state <= 4'd0;
      mouse_strobe <=1'b0;
      irq <= 1'b0;
      irq_enable <= 1'b0;
      key_restore <= 1'b0;
      tape_play  <= 1'b0;
      mod_key  <= 1'b0;
      joystick_strobe <= 1'b0; 

      // reset entire keyboard to 1's
      keyboard[ 0] <= 8'hff; keyboard[ 1] <= 8'hff; keyboard[ 2] <= 8'hff;
      keyboard[ 3] <= 8'hff; keyboard[ 4] <= 8'hff; keyboard[ 5] <= 8'hff;
      keyboard[ 6] <= 8'hff; keyboard[ 7] <= 8'hff; 

   end else begin
      db9_portD <= db9_port;
      db9_portD2 <= db9_portD;
      
      // monitor db9 port for changes and raise interrupt
      if(irq_enable) begin
        if(db9_portD2 != db9_portD) begin
            // irq_enable prevents further interrupts until
            // the db9 state has actually been read by the MCU
            irq <= 1'b1;
            irq_enable <= 1'b0;
        end
      end

      if(iack) irq <= 1'b0;      // iack clears interrupt

      mouse_strobe <=1'b0;
      joystick_strobe <=1'b0; 
      if(data_in_strobe) begin      
        if(data_in_start) begin
            state <= 4'd0;
            command <= data_in;
        end else begin
            if(state != 4'd15) state <= state + 4'd1;
	    
            // CMD 0: status data
            if(command == 8'd0) begin
                if(state == 4'd0) data_out <= 8'h01;
                if(state == 4'd1) data_out <= 8'h00;
            end
	   
            // CMD 1: keyboard data
            if(command == 8'd1) begin
	       // kbd_column and kbd_row are derived from data_in
               if(state == 4'd0) keyboard[kbd_row][kbd_column] <= data_in[7]; // row / colum !
            end
	       
            // CMD 2: mouse data
            if(command == 8'd2) begin
                if(state == 4'd0) mouse_btns <= data_in[1:0];
                if(state == 4'd1) mouse_x_cnt <= mouse_x_cnt + data_in;
                if(state == 4'd2) begin 
                    mouse_y_cnt <= mouse_y_cnt + data_in;
                    mouse_strobe <=1'b1;
                end
            end

            // CMD 3: receive digital joystick data
            if(command == 8'd3) begin
                if(state == 4'd0) device <= data_in;
                if(state == 4'd1) begin
                    if(device == 8'd0) joystick0 <= data_in;
                    if(device == 8'd1) joystick1 <= data_in;
                    if(device == 8'h80) begin // 0, 0, KP * button2, KP0 trigger, KP 8 up, KP 2 down, KP 4 left, KP 6 right
                        numpad <= data_in;
                        mod_key <= data_in[5];
                        key_restore <= data_in[6]; 
                        tape_play <= data_in[7];
                     end
                end
                if(state == 4'd2) begin
                        if(device == 8'd0) joystick0ax <= data_in;
                        if(device == 8'd1) joystick1ax <= data_in;
                end
                if(state == 4'd3) begin
                        if(device == 8'd0) joystick0ay <= data_in;
                        if(device == 8'd1) joystick1ay <= data_in;
                end
                if(state == 4'd4) begin
                        if(device == 8'd0) extra_button0 <= data_in;
                        if(device == 8'd1) extra_button1 <= data_in;
                        joystick_strobe <= 1'b1;
                end
            end

            // CMD 4: send digital joystick data to MCU
            if(command == 8'd4) begin
                if(state == 4'd0) irq_enable <= 1'b1;    // (re-)enable interrupt
                data_out <= {2'b00, db9_portD };               
            end

        end
      end else begin // if (data_in_strobe)
        mouse_div <= mouse_div + 15'd1;      
        if(mouse_div == 15'd0) begin
            if(mouse_x_cnt != 8'd0) begin
                if(mouse_x_cnt[7]) begin
                    mouse_x_cnt <= mouse_x_cnt + 8'd1;
                end else begin
                    mouse_x_cnt <= mouse_x_cnt - 8'd1;
                end	    
            end // if (mouse_x_cnt != 8'd0)
	    
            if(mouse_y_cnt != 8'd0) begin
                if(mouse_y_cnt[7]) begin
                    mouse_y_cnt <= mouse_y_cnt + 8'd1;
                end else begin
                    mouse_y_cnt <= mouse_y_cnt - 8'd1;
                end	    
            end
        end
      end
   end
end
    
endmodule
