set_device GW2A-LV18PG256C8/I7 -name GW2A-18C

add_file src/dualshock2.v
add_file src/gowin_dpb/gowin_dpb_track_buffer_b.v
add_file src/gowin_dpb/sector_dpram.v
add_file src/hdmi/audio_clock_regeneration_packet.sv
add_file src/hdmi/audio_info_frame.sv
add_file src/hdmi/audio_sample_packet.sv
add_file src/hdmi/auxiliary_video_information_info_frame.sv
add_file src/hdmi/hdmi.sv
add_file src/hdmi/packet_assembler.sv
add_file src/hdmi/packet_picker.sv
add_file src/hdmi/serializer.sv
add_file src/hdmi/source_product_description_info_frame.sv
add_file src/hdmi/tmds_channel.sv
add_file src/misc/hid.v
add_file src/misc/mcu_spi.v
add_file src/misc/osd_u8g2.v
add_file src/misc/scandoubler.v
add_file src/misc/sd_card.v
add_file src/misc/sd_rw.v
add_file src/misc/sdcmd_ctrl.v
add_file src/misc/sysctrl.v
add_file src/misc/video.v
add_file src/misc/video_analyzer.v
add_file src/misc/ws2812.v
add_file src/t65/T65.vhd
add_file src/t65/T65_ALU.vhd
add_file src/t65/T65_MCode.vhd
add_file src/t65/T65_Pack.vhd
add_file src/loader_sd_card.sv
add_file src/A2601Core.vhd
add_file src/A2601top.vhd
add_file src/A6507.vhd
add_file src/A6532.vhd
add_file src/TIA/Common.vhd
add_file src/TIA/NTSCLookups.vhd
add_file src/TIA/TIA.vhd
add_file src/TIA/VGAColorTable.vhd
add_file src/TIA/audio_argh2600.vhd
add_file src/gowin_sdpb/gowin_sdpb.vhd
add_file src/a2600_top_tp20k.vhd
add_file src/a2600_top_tp20k.cst
add_file src/a2600_top_tp20k.sdc
add_file src/video_stabilize.sv
add_file src/detect2600.sv

set_option -synthesis_tool gowinsynthesis
set_option -output_base_name a2600nano_tp20k
set_option -verilog_std sysv2017
set_option -vhdl_std vhd2008
set_option -top_module A2600_top
set_option -use_mspi_as_gpio 1
set_option -use_sspi_as_gpio 1
set_option -use_ready_as_gpio 1
set_option -use_done_as_gpio 1
set_option -print_all_synthesis_warning 1
set_option -rw_check_on_ram 0
set_option -user_code 00000001
set_option -bit_security 0
set_option -multi_boot 1
# for special ESP32 Programmer
#set_option -mspi_jump 100000

#run syn
run all
