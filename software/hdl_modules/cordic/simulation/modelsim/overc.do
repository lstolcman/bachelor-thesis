# speedup modelsim simulation - no log file is written
# source: http://www.ht-lab.com/howto/modelsim/Modelsim_tips.html
nolog -all

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work ../../src/cordic.v
vlog -sv -work work overc.v

vsim -L rtl_work -L work work.overc_tb

add wave clk
add wave delta
add wave wr
add wave -unsigned inc
add wave -analog -height 100 -min -1e6 -max 1e6 re
add wave -analog -height 100 -min -1e6 -max 1e6 im
add wave -analog -unsigned -height 80 -min -5e5 -max 5e5 re_u
add wave -analog -unsigned -height 80 -min -5e5 -max 5e5 im_u
add wave -analog -unsigned -height 80 -min -5e5 -max 5e5 s
add wave -analog -unsigned -height 80 -min -10 -max 50 s2
add wave -analog -unsigned -height 80 -min -10 -max 50 s3
add wave -analog -unsigned -height 80 -min -10 -max 50 s4

