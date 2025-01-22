//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10.03 (64-bit) 
//Created Time: 2024-11-15 19:21:10
create_clock -name ds2_clk -period 8000 -waveform {0 4000} [get_nets {gamepad_p2/clk_spi}]
create_clock -name clk_50mhz -period 20 -waveform {0 10} [get_ports {clk_50mhz}]
create_clock -name ds_clk -period 8000 -waveform {0 4000} [get_nets {gamepad_p1/clk_spi}]
create_clock -name clk_cpu -period 279 -waveform {0 140} [get_nets {clk_cpu}]
create_clock -name clk_14 -period 70 -waveform {0 35} [get_nets {clk_14}]
create_clock -name clk -period 34.921 -waveform {0 17} [get_nets {clk}]
create_clock -name m0s[3] -period 50 -waveform {0 25} [get_ports {m0s[3]}] -add
create_clock -name clk_pixel_x5 -period 6.984 -waveform {0 1} [get_nets {clk_pixel_x5}] -add
create_clock -name i2s_clk -period 616 -waveform {0 313} [get_nets {video_inst/i2s_clk}] -add
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
