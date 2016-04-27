
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


vlog -sv -work work ../../src/modules/dcf_pulses_gen/src/dcf_pulses_gen.v
vlog -sv -work work goertzel_analyze_fast_tb.v

vsim -L rtl_work -L work work.goertzel_analyze_fast_tb

# speedup modelsim simulation - no log file is written
# source: http://www.ht-lab.com/howto/modelsim/Modelsim_tips.html
nolog -all


add wave clock
add wave clock2k5
add wave pulse
add wave time_data
add wave pulse
add wave -unsigned i

run 72000ms

