transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work ../../src/goertzel.v
vlog -sv -work work ../../src/megafunc/fpmult.v
vlog -sv -work work ../../src/megafunc/fpadd.v
vlog -sv -work work ../../src/megafunc/fpsub.v
vlog -sv -work work ../../src/megafunc/fp64int64conv.v
vlog -sv -work work ../../src/megafunc/fp64int32conv.v

vlog -sv -work work fp_test.v


vsim -L rtl_work -L work -L lpm_ver work.fp_test_tb

add wave -hex memory
add wave clock
add wave clock_sample
add wave -unsigned i
add wave -decimal -analog -min -1e5 -max 1e5 -height 200 wave
add wave -hex a
add wave -hex b
add wave -hex c
add wave -signed _32
add wave -signed _64
add wave clr

run 3us

