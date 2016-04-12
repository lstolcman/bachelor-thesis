transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work dds.v


vsim -L rtl_work -L work work.dds_tb

add wave *


