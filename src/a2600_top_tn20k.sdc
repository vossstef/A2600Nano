create_clock -name clk_27mhz -period 37.037 -waveform {0 5} [get_ports {clk_27mhz}]
create_clock -name ds_clk -period 8000 -waveform {0 5} [get_nets {gamepad_p1/clk_spi}]
create_clock -name ds2_clk_ms20k -period 8000 -waveform {0 5} [get_nets {gamepad_p2/clk_spi}]
create_clock -name clk -period 34.722 -waveform {0 5} [get_nets {clk}]
create_clock -name clk_14 -period 70 -waveform {0 5} [get_nets {clk_14}]
create_clock -name clk_cpu -period 279.408 -waveform {0 5} [get_nets {clk_cpu}]
create_clock -name m0s[3] -period 40 -waveform {0 5} [get_ports {m0s[3]}] -add
create_clock -name clk_pixel_x5 -period 6.944 -waveform {0 1.25} [get_nets {clk_pixel_x5}] -add
create_clock -name clk_audio -period 20833.332 -waveform {0 5} [get_nets {video_inst/clk_audio}] -add
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
