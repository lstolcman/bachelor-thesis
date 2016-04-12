
vlog -sv -work work goertzel_tb.v
vlog -sv -work work goertzel.v

vsim -L rtl_work -L work -L lpm_ver work.goertzel_tb


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



