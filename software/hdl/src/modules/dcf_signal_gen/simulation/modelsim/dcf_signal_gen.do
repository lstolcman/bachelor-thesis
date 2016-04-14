
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


vlog -sv -work work ../../../cordic/src/cordic.v
vlog -sv -work work ../../../dcf_pulses_gen/src/dcf_pulses_gen.v
vlog -sv -work work ../../src/dcf_signal_gen.v
vlog -sv -work work dcf_signal_gen_tb.v

vsim -L rtl_work -L work work.dcf_signal_gen_tb

# speedup modelsim simulation - no log file is written
# source: http://www.ht-lab.com/howto/modelsim/Modelsim_tips.html
nolog -all


add wave *
add wave dcf_signal_gen_i1/*
add wave -analog -max 3e4 -min -3e4 -height 300 dcf_signal_gen_i1/signal


