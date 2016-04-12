transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work ../../src/dds.v
vlog -sv -work work dds_over.v


vsim -L rtl_work -L work work.dds_over_tb

add wave *


