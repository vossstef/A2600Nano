module video_stabilize
(
	input           clk,        // system clock
	input           reset,      // System reset
	input           oclk,       // Oscillator clock aka pixel clock or color clock
	input [1:0]     mode,       // 00 = smart, 01 = fixed, 10 = none
	input           vsync_in,   // Unmodified vsync signal
	input           vblank_in,  // Umodified vblank signal
	input           hsync_in,   // Unmodified hsync signal
	input           hblank_in,  // Hblank signal with applicable system delays
	output          vsync,
	output          vblank,
	output          auto_pal,
	output          f1,           // Indicates Odd field of interlaced video
    output [8:0]    tlines
);
	localparam ntsc_vb_end = 9'd19; // 19
	localparam pal_vb_end = 9'd23; // 23
	localparam ntsc_vb_start = 9'd240 + ntsc_vb_end; //9'd262;//9'd243;
	localparam pal_vb_start = 9'd288 + pal_vb_end; //9'd312;//9'd288;


	logic [8:0] v_count, total_lines, vsync_line, vsync_end_line;
	logic [7:0] h_count;
	logic old_hblank, old_vblank, old_hsync, old_vsync;
	logic vsync_en, vsync_set, vblank_en, midline_sync, vsync_override, set_end;
	logic [7:0] vsync_count, vblank_count, lines_from_vs;
	logic [7:0] dot_count = 0;
	logic vsync_emulate;

//	wire vblank_start = ~old_vblank && vblank_in;
//	wire vblank_end   = old_vblank && ~vblank_in;
	wire hblank_start = ~old_hblank && hblank_in;
	wire hblank_end   = old_hblank && ~hblank_in;
	wire vsync_start  = ~old_vsync && vsync_in;
//	wire vsync_end    = old_vsync && ~vsync_in;
//	wire hsync_start  = ~old_hsync && hsync_in;
//	wire hsync_end    = old_hsync && ~hsync_in;

	assign vblank = |mode ? vblank_in : vblank_en;
	assign vsync = |mode ? vsync_in : vsync_en;
	assign f1 = 1'b0; // |mode ? 1'b0 : midline_sync; // I could never make this work productively
	assign auto_pal = |mode ? 1'b0 : total_lines >= 290;
    assign tlines = total_lines;

	always_ff @(posedge clk) begin
		old_hblank <= hblank_in;
		old_vsync <= vsync_in;
		if (&v_count) begin // Something is whack, emulate a signal
			total_lines <= 9'd262;
			vsync_override <= 1'd1;
			vsync_emulate <= 1'd1;
		end

		// Base new lines on the horizontal LFSR reset
		if (hblank_start) begin
			v_count <= v_count + 1'd1;
			if (v_count == (auto_pal ? pal_vb_end : ntsc_vb_end))
				vblank_en <= 0;
			if (v_count == (auto_pal ? pal_vb_start : ntsc_vb_start) || v_count == ((vsync_override ? vsync_line : total_lines) - 4'd4))
				vblank_en <= 1;

			if ((vsync_override && v_count == (vsync_line - 1'd1)) || vsync_set) begin
				if (vsync_emulate)
					v_count <= 0;
				vsync_en <= 1;
				vsync_set <= 0;
				vblank_en <= 1;
				if (~|vsync_count)
					vsync_count <= 3'd3;
			end
			if (|vsync_count) begin
				vsync_count <= vsync_count - 1'd1;
				if (vsync_count == 1)
					vsync_en <= 0;
			end
		end

		if (oclk)
			dot_count <= dot_count + 1'd1;
		if (hblank_end)
			dot_count <= 0;

		if (vsync_start) begin
			vsync_emulate <= 0;
			if (v_count != total_lines) begin
				vsync_set <= 1;
				if (total_lines - v_count < 3'd4) begin
					vsync_override <= 1;
					vsync_line <= v_count;
				end else if (v_count - total_lines < 3'd4) begin
					vsync_override <= 1;
					vsync_line <= total_lines;
				end else begin
					vsync_override <= 0;
				end
			end
			if (~vsync_override) begin
				vsync_set <= 1;
			end
			v_count <= 0;
			total_lines <= v_count;

			// if (dot_count > 15 && dot_count < 145) // Vsync outside of hblank can be considered invoking interlaced resolutions
			// 	midline_sync <= 1;
			// else
			// 	midline_sync <= 0;
		end

		if (reset) begin
			vsync_emulate <= 0;
			dot_count <= 0;
			vsync_set <= 0;
			vsync_line <= 0;
			vsync_override <= 0;
			total_lines <= 9'd262;
			v_count <= 0;
			vblank_en <= 1;
			vsync_en <= 0;
		end

	end
endmodule