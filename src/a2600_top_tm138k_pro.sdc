create_clock -name clk_50mhz -period 37.037 -waveform {0 5} [get_ports {clk_50mhz}]
create_clock -name ds2_clk -period 8000 -waveform {0 5} [get_nets {gamepad/clk_spi}]
create_clock -name joymiso -period 8000 -waveform {0 20} [get_ports {joystick_miso}]
create_clock -name clk -period 34.722 -waveform {0 5} [get_nets {clk}]
create_clock -name clk_14 -period 70 -waveform {0 5} [get_nets {clk_14}]
create_clock -name clk_pixel_x5 -period 6.944 -waveform {0 1.25} [get_nets {clk_pixel_x5}] -add
create_clock -name clk_audio -period 20833.332 -waveform {0 5} [get_nets {video_inst/clk_audio}] -add
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
