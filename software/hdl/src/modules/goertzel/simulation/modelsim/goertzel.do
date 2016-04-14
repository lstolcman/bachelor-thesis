
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work ../../src/megafunc/fpmult.v
vlog -sv -work work ../../src/megafunc/fpadd.v
vlog -sv -work work ../../src/megafunc/fpsub.v
vlog -sv -work work ../../src/megafunc/fp64int64conv.v
vlog -sv -work work ../../src/megafunc/fp64int32conv.v
vlog -sv -work work ../../src/megafunc/int32fp64conv.v


vlog -sv -work work ../../src/goertzel.v
vlog -sv -work work goertzel_tb.v


vsim -L rtl_work -L work -L lpm_ver work.goertzel_tb

# speedup modelsim simulation - no log file is written
# source: http://www.ht-lab.com/howto/modelsim/Modelsim_tips.html
nolog -all


add wave clock
add wave clock_sample
add wave -signed -analog -min -1e5 -max 1e5 -height 100 sample
add wave ready
add wave -decimal power
add wave -decimal power_div
add wave -binary power
add wave -binary power_div


