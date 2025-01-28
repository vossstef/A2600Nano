// video.v

module video
#(
    parameter bit STEREO = 1'b0
)
 (
   input    clk,
   input    pll_lock,

   input   ntscmode,

   input   vb_in,
   input   hb_in,
   input   vs_in_n,
   input   hs_in_n,

   input [3:0]  r_in,
   input [3:0]  g_in,
   input [3:0]  b_in,

   input [14:0] audio_l,
   input [14:0] audio_r,

   input vblank_regenerate,
   output osd_status,
   output paldetect,

   // (spi) interface from MCU
   input   mcu_start,
   input   mcu_osd_strobe,
   input [7:0]  mcu_data,

   // values that can be configure by the user via osd          
   input [1:0]  system_scanlines,
   input [1:0]  system_volume,
   input     system_wide_screen,

   // digital video out for lcd
   output lcd_clk,
   output lcd_hs_n,
   output lcd_vs_n,
   output lcd_de,
   output [5:0] lcd_r,
   output [5:0] lcd_g,
   output [5:0] lcd_b,
   output lcd_bl,

   // audio
   output hp_bck,
   output hp_ws,
   output hp_din,
   output pa_en,
   output [15:0] dac

);

assign lcd_bl = pll_lock;
wire vs_stab,vb_stab,pal;
wire sd_hs_n, sd_vs_n;
wire [8:0] total_lines;
assign paldetect = pal;

video_stabilize video_stabilize
(
	.clk(clk),          // system clock
	.reset(!pll_lock),  // System reset
	.oclk(clk),         // Oscillator clock aka pixel clock or color clock
	.mode(2'b00),       // 00 = smart, 01 = fixed, 10 = none
	.vsync_in(vs_in_n), // Unmodified vsync signal
	.vblank_in(vb_in),  // Umodified vblank signal
	.hsync_in(hs_in_n), // Unmodified hsync signal
	.hblank_in(hb_in),  // Hblank signal with applicable system delays

	.vsync(vs_stab),
	.vblank(vb_stab),
	.auto_pal(pal),
	.f1(),
    .tlines(total_lines)
);

/* ------------ expand audio to 16 bits and apply volume adjustment ------------ */
wire [15:0] audio16_l = { audio_l[14], audio_l };
wire [15:0] audio16_r = { audio_r[14], audio_r };

// scale audio for valume by signed division
wire [15:0] audio_vol_l = 
    (system_volume == 2'd0)?16'd0:
    (system_volume == 2'd1)?{ {2{audio16_l[15]}}, audio16_l[15:2] }:
    (system_volume == 2'd2)?{ audio16_l[15], audio16_l[15:1] }:
    audio16_l;

wire [15:0] audio_vol_r = 
    (system_volume == 2'd0)?16'd0:
    (system_volume == 2'd1)?{ {2{audio16_r[15]}}, audio16_r[15:2] }:
    (system_volume == 2'd2)?{ audio16_r[15], audio16_r[15:1] }:
    audio16_r;

wire vreset;
reg  HSync, VSync, vbl_gen;

wire VBlank = vblank_regenerate ? vbl_gen:vb_stab;
reg [7:0] adaptive_ary = 8'd108;
wire [7:0] vertical_ar_lut[256] = '{
	8'h00, 8'h01, 8'h01, 8'h02, 8'h02, 8'h03, 8'h03, 8'h04,
	8'h05, 8'h05, 8'h06, 8'h06, 8'h07, 8'h07, 8'h08, 8'h08,
	8'h09, 8'h0A, 8'h0A, 8'h0B, 8'h0B, 8'h0C, 8'h0C, 8'h0D,
	8'h0E, 8'h0E, 8'h0F, 8'h0F, 8'h10, 8'h10, 8'h11, 8'h11,
	8'h12, 8'h13, 8'h13, 8'h14, 8'h14, 8'h15, 8'h15, 8'h16,
	8'h17, 8'h17, 8'h18, 8'h18, 8'h19, 8'h19, 8'h1A, 8'h1A,
	8'h1B, 8'h1C, 8'h1C, 8'h1D, 8'h1D, 8'h1E, 8'h1E, 8'h1F,
	8'h1F, 8'h20, 8'h21, 8'h21, 8'h22, 8'h22, 8'h23, 8'h23,
	8'h24, 8'h25, 8'h25, 8'h26, 8'h26, 8'h27, 8'h27, 8'h28,
	8'h28, 8'h29, 8'h2A, 8'h2A, 8'h2B, 8'h2B, 8'h2C, 8'h2C,
	8'h2D, 8'h2E, 8'h2E, 8'h2F, 8'h2F, 8'h30, 8'h30, 8'h31,
	8'h31, 8'h32, 8'h33, 8'h33, 8'h34, 8'h34, 8'h35, 8'h35,
	8'h36, 8'h37, 8'h37, 8'h38, 8'h38, 8'h39, 8'h39, 8'h3A,
	8'h3B, 8'h3B, 8'h3C, 8'h3C, 8'h3D, 8'h3D, 8'h3E, 8'h3E,
	8'h3F, 8'h40, 8'h40, 8'h41, 8'h41, 8'h42, 8'h42, 8'h43,
	8'h44, 8'h44, 8'h45, 8'h45, 8'h46, 8'h46, 8'h47, 8'h47,
	8'h48, 8'h49, 8'h49, 8'h4A, 8'h4A, 8'h4B, 8'h4B, 8'h4C,
	8'h4D, 8'h4D, 8'h4E, 8'h4E, 8'h4F, 8'h4F, 8'h50, 8'h50,
	8'h51, 8'h52, 8'h52, 8'h53, 8'h53, 8'h54, 8'h54, 8'h55,
	8'h56, 8'h56, 8'h57, 8'h57, 8'h58, 8'h58, 8'h59, 8'h59,
	8'h5A, 8'h5B, 8'h5B, 8'h5C, 8'h5C, 8'h5D, 8'h5D, 8'h5E,
	8'h5E, 8'h5F, 8'h60, 8'h60, 8'h61, 8'h61, 8'h62, 8'h62,
	8'h63, 8'h64, 8'h64, 8'h65, 8'h65, 8'h66, 8'h66, 8'h67,
	8'h68, 8'h68, 8'h69, 8'h69, 8'h6A, 8'h6A, 8'h6B, 8'h6B,
	8'h6C, 8'h6D, 8'h6D, 8'h6E, 8'h6E, 8'h6F, 8'h6F, 8'h70,
	8'h71, 8'h71, 8'h72, 8'h72, 8'h73, 8'h73, 8'h74, 8'h74,
	8'h75, 8'h76, 8'h76, 8'h77, 8'h77, 8'h78, 8'h78, 8'h79,
	8'h7A, 8'h7A, 8'h7B, 8'h7B, 8'h7C, 8'h7C, 8'h7D, 8'h7D,
	8'h7E, 8'h7F, 8'h7F, 8'h80, 8'h80, 8'h81, 8'h81, 8'h82,
	8'h83, 8'h83, 8'h84, 8'h84, 8'h85, 8'h85, 8'h86, 8'h86,
	8'h87, 8'h88, 8'h88, 8'h89, 8'h89, 8'h8A, 8'h8A, 8'h8B,
	8'h8C, 8'h8C, 8'h8D, 8'h8D, 8'h8E, 8'h8E, 8'h8F, 8'h8F
};

always @(posedge clk) begin
	reg [8:0] line_cnt, vblank_start, visible_cnt;

	HSync <= hs_in_n;
	if(~HSync & hs_in_n) begin
		VSync <= vs_stab;
		line_cnt <= line_cnt + 1'b1;
		if (~VBlank)
			visible_cnt <= visible_cnt + 1'b1;

		if (~VSync & vs_stab) begin
			line_cnt <= 0;
			visible_cnt <= 0;
			if (visible_cnt < 255)
				adaptive_ary <= vertical_ar_lut[visible_cnt[7:0]];
			else
				adaptive_ary <= vertical_ar_lut[255];

			vblank_start <= line_cnt - 9'd25;
		end

		if (line_cnt == vblank_start) begin
			vbl_gen <= 1'b1;
		end

		if (line_cnt == 9'd34) begin
			vbl_gen <= 0;
		end
	end
end


wire [5:0] sd_r;
wire [5:0] sd_g;
wire [5:0] sd_b;

scandoubler #(10) scandoubler (
        // system interface
        .clk_sys(clk),
        .bypass(1'b0),
        .ce_divider(3'b1),
        .pixel_ena(),

        // scanlines (00-none 01-25% 10-50% 11-75%)
        .scanlines(system_scanlines),

        // shifter video interface
        .hb_in(hb_in),
	    .vb_in(VBlank), // vb_in),
        .hs_in(hs_in_n),
        .vs_in(vs_stab),
        .r_in( r_in ),
        .g_in( g_in ),
        .b_in( b_in ),

        // output interface
        .hb_out(),
        .vb_out(),
        .hs_out(sd_hs_n),
        .vs_out(sd_vs_n),
        .r_out(sd_r),
        .g_out(sd_g),
        .b_out(sd_b)
);

osd_u8g2 osd_u8g2 (
        .clk(clk),
        .reset(!pll_lock),

        .data_in_strobe(mcu_osd_strobe),
        .data_in_start(mcu_start),
        .data_in(mcu_data),

        .hs(sd_hs_n),
        .vs(sd_vs_n),
		     
        .r_in(sd_r),
        .g_in(sd_g),
        .b_in(sd_b),
		     
        .r_out(lcd_r),
        .g_out(lcd_g),
        .b_out(lcd_b),
        .osd_status(osd_status)
);   

/* ------------------- audio processing --------------- */

assign pa_en = (STEREO)?~pll_lock:pll_lock; // TM138/60k enable amplifier 0=on and 1= off, TN20k vice versa

reg i2s_clk;
reg [7:0] i2s_clk_cnt;
always @(posedge clk or negedge pll_lock) begin
    if (~pll_lock) begin
        i2s_clk_cnt <= 8'd0;
        i2s_clk <= 1'b0;
        end
    else begin
       if(i2s_clk_cnt < (ntscmode?28542800:28542800) / (24000*32) / 2 - 1)
            i2s_clk_cnt <= i2s_clk_cnt + 8'd1;
        else begin
            i2s_clk_cnt <= 8'd0;
            i2s_clk <= ~i2s_clk;
        end
    end
end

// sign expand and add both channels
wire [15:0] audio_mix = { audio_vol_l[14], audio_vol_l} + { audio_vol_r[14], audio_vol_r };
assign dac = audio_mix;

// shift audio down to reduce amp output volume to a sane range
localparam AUDIO_SHIFT = (STEREO)?2:3;   // 2 TM138k / TM60k and 3 // TN20k
wire [15:0] audio_scaled = { { AUDIO_SHIFT+1{audio_mix[15]}}, audio_mix[14:AUDIO_SHIFT] };
 
// count 32 bits, 16 left and 16 right channel. MAX samples
// on rising edge
reg [15:0] audio;
reg [4:0] audio_bit_cnt;
always @(posedge i2s_clk) begin
   if(!pll_lock) audio_bit_cnt <= 5'd0;
   else          audio_bit_cnt <= audio_bit_cnt + 5'd1;

    // latch data so it's stable during transmission
    if(audio_bit_cnt == 5'd31)
     audio <= audio_scaled;
end

// generate i2s signals
assign hp_bck = !i2s_clk;
assign hp_ws = !pll_lock?1'b0:audio_bit_cnt[4];
assign hp_din = !pll_lock?1'b0:audio[15-audio_bit_cnt[3:0]];

assign lcd_clk = clk;
assign lcd_hs_n = sd_hs_n;
assign lcd_vs_n = sd_vs_n;

reg [10:0] hcnt; // max 912
reg [9:0] vcnt;  // max 524

// generate lcd de signal
localparam XNTSC = 11'd1980;
localparam YNTSC = 10'd990;
localparam XPAL  = 11'd1980;
localparam YPAL  = 10'd990;

assign lcd_de = (hcnt < 11'd800) && (vcnt < 10'd480);

// after scandoubler (with dim lines), ste video is 3*6 bits
// lcd r and b are only 5 bits, so there may be some color
// offset

always @(posedge clk) begin
   reg last_vs_n, last_hs_n;

   last_hs_n <= lcd_hs_n;

   // rising edge/end of hsync
   if(lcd_hs_n && !last_hs_n) begin
      hcnt <= (ntscmode)?XNTSC:XPAL;
      
      last_vs_n <= lcd_vs_n;
      if(lcd_vs_n && !last_vs_n) begin
        vcnt <= (ntscmode)?YNTSC:YPAL;
      end else
	vcnt <= vcnt + 10'd1;
   end else
      hcnt <= hcnt + 11'd1;
end

endmodule
