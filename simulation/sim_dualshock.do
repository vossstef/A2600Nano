quit -sim

cd ./sim
if ![file exists "./sim.mpf"] {
project new "." sim
project addfile "./../../tb/ds_tb.vhd"
project addfile "./../../src/dualshock2.v"

 if [file exists work] {
    vdel -lib work -all
   }

vlib work
vmap work work

vlog -work work -sv -mixedsvvh "./../../src/dualshock2.v"

vcom -work work -2008 \
"./../../tb/ds_tb.vhd" \

} else {
 project open "./sim"
 project compileoutofdate
}

vsim -voptargs=+acc -gui -t ps -L work work.ds_tb
view wave

add wave -divider "Input Signals"
add wave -noupdate /ds_tb/clk
add wave -noupdate /ds_tb/reset
add wave -noupdate /ds_tb/vsync

add wave -divider "Result Interface"
#add wave -noupdate /ds_tb/ds2_cmd
#add wave -noupdate /ds_tb/ds2_att
#add wave -noupdate /ds_tb/ds2_clk
#add wave -noupdate /ds_tb/tb_stat

#add wave -divider "Result Block"
#add wave -noupdate /ds_tb/u0/ds2_dat
#add wave -noupdate /ds_tb/u0/ds2_ack
#add wave -noupdate /ds_tb/u0/clk_spi
#add wave -noupdate /ds_tb/u0/clk_cnt
#add wave -noupdate /ds_tb/u0/rst
#add wave -noupdate /ds_tb/u0/state

add wave -r /*

onerror {resume}
quietly WaveActivateNextPane {} 0

configure wave -namecolwidth 420
configure wave -valuecolwidth 110
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns

configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0ns} {2000ns}

quietly set StdArithNoWarnings 1
quietly set NumericStdNoWarnings 1

run 50 ms