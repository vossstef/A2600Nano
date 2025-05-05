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
  output reg btn_select,// F1 Select
  output reg btn_start, // F2 Start/Reset
  output reg btn_b_w,   // F3 B/W toggle switch 
  output reg btn_diff_l,// F4 Difficulty Left toggle switch A/B  0
  output reg btn_diff_r,// F5 Difficulty Right toggle switch A/B 1
  output reg btn_pause, // F6 Pause
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
  output reg [7:0]  extra_button1,
 // sysctrl inputs
  input p_dif1,
  input p_dif2,
  input p_color
);

reg [7:0] usb_kbd;
reg [7:0] keys;

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

assign btn_select = keys[0]; // F1 Select
assign btn_start  = keys[1]; // F2 Start/Reset
//assign btn_b_w    = keys[2]; // F3 B/W toggle switch 
//assign btn_diff_l = keys[3]; // F4 Difficulty Left toggle switch A/B
//assign btn_diff_r = keys[4]; // F5 Difficulty Right toggle switch A/B
//assign btn_pause  = keys[5]; // F6 Pause

always @(posedge clk) begin
   if(reset) begin
        numpad <= 8'h00;
        keys <= 8'h00;
   end else begin
        if (usb_kbd[7]) begin
            numpad <= 8'h00;
            keys <= 8'h00;
        end else begin
            numpad <=
            (usb_kbd[6:0] == 7'h5e)?numpad | 8'h01:
            (usb_kbd[6:0] == 7'h5c)?numpad | 8'h02:
            (usb_kbd[6:0] == 7'h5a)?numpad | 8'h04:
            (usb_kbd[6:0] == 7'h60)?numpad | 8'h08:
            (usb_kbd[6:0] == 7'h62)?numpad | 8'h10:
            (usb_kbd[6:0] == 7'h63)?numpad | 8'h20:
            (usb_kbd[6:0] == 7'h44)?numpad | 8'h40:
            (usb_kbd[6:0] == 7'h4b)?numpad | 8'h80:numpad;

            keys <=
            (usb_kbd[6:0] == 7'h3a)?keys | 8'h01: // F1 Select
            (usb_kbd[6:0] == 7'h3b)?keys | 8'h02: // F2 Start/Reset
            (usb_kbd[6:0] == 7'h3c)?keys | 8'h04: // F3 B/W toggle switch 
            (usb_kbd[6:0] == 7'h3d)?keys | 8'h08: // F4 Difficulty Left toggle switch A/B
            (usb_kbd[6:0] == 7'h3e)?keys | 8'h10: // F5 Difficulty Right toggle switch A/B
            (usb_kbd[6:0] == 7'h3f)?keys | 8'h20:keys; // F6 Pause
        end
    end
end

reg [7:0] keys_d;
reg b_w, diff_r, diff_l;

always @(posedge clk) begin
    if(reset) begin
        keys_d <= 8'h00;
        btn_pause <= 1'b0;
        b_w <= 1'b0;
        diff_r <= 1'b0;
        diff_l <= 1'b0;
    end else begin
        keys_d <= keys;
        if(~keys_d[2] & keys[2]) b_w <= ~b_w;
        if(~keys_d[3] & keys[3]) diff_l <= ~diff_l;
        if(~keys_d[4] & keys[4]) diff_r <= ~diff_r;
        if(~keys_d[5] & keys[5]) btn_pause <= ~btn_pause;
    end
end

assign btn_b_w = p_color ? ~b_w : b_w;
assign btn_diff_l = p_dif1 ? ~diff_l : diff_l;
assign btn_diff_r = p_dif2 ? ~diff_r : diff_r;

// process mouse events
always @(posedge clk) begin
   if(reset) begin
      state <= 4'd0;
      mouse_strobe <=1'b0;
      irq <= 1'b0;
      irq_enable <= 1'b0;
      joystick_strobe <= 1'b0; 
      usb_kbd <= 8'h00;
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
              if(state == 4'd0) 
                usb_kbd <= data_in;
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
