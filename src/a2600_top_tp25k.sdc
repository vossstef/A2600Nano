//Copyright (C)2014-2024 GOWIN Semiconductor Corporation.
//All rights reserved.
//File Title: Timing Constraints file
//Tool Version: V1.9.10.02 
//Created Time: 2024-10-25 21:55:12
create_clock -name clk_cpu -period 279.408 -waveform {0 5} [get_nets {clk_cpu}]
create_clock -name clk -period 34.921 -waveform {0 5} [get_nets {clk}]
create_clock -name clk_50mhz -period 20 -waveform {0 5} [get_ports {clk_50mhz}]
create_clock -name clk_pixel_x5 -period 6.984 -waveform {0 1} [get_nets {clk_pixel_x5}] -add
create_clock -name clk_audio -period 20833 -waveform {0 5} [get_nets {video_inst/clk_audio}] -add
create_clock -name m0s[3] -period 40 -waveform {0 5} [get_ports {m0s[3]}] -add
report_timing -hold -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
report_timing -setup -from_clock [get_clocks {clk*}] -to_clock [get_clocks {clk*}] -max_paths 25 -max_common_paths 1
