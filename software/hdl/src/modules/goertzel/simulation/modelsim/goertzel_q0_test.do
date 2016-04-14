
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
vlog -sv -work work goertzel_q0_test_tb.v


vsim -L rtl_work -L work -L lpm_ver work.goertzel_q0_test_tb

# speedup modelsim simulation - no log file is written
# source: http://www.ht-lab.com/howto/modelsim/Modelsim_tips.html
nolog -all


add wave clock
add wave clock_sample
add wave reset_n
add wave -signed -analog -min -1e5 -max 1e5 -height 100 sample
add wave -unsigned i
add wave ready
add wave -signed -analog power


add wave -hex i1/int32fp64conv_i1_result
add wave -hex i1/int32fp64conv_i1_aclr
add wave -unsigned i1/i
add wave -hex i1/fpmult_i1_aclr
add wave -hex i1/fpsub_i1_aclr
add wave -hex i1/fpadd_i1_aclr
add wave -hex i1/fpmult_i1_result
add wave -hex i1/fpsub_i1_result
add wave -hex i1/fpadd_i1_result
add wave -hex i1/q0
add wave -hex i1/q1
add wave -hex i1/q2
add wave -decimal q0int
add wave -decimal q1int
add wave -decimal q2int
add wave -hex i1/fpsub_i2_result
add wave -decimal i1/sample_counter
add wave -decimal q0int_tmp
add wave -decimal q1int_tmp
add wave -decimal q2int_tmp
add wave -decimal i1/fp64int64conv_i1_result



