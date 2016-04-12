transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work




####

#init pll board
vlog ../../src/megafunctions/pll/board/pll_board.v




vlog -sv -work work ../../src/interface.v
vlog -sv -work work ../../src/mult.v
vlog -sv -work work ../../src/receiver.v
vlog -sv -work work ../../src/uart.v
vlog -sv -work work ../../src/reset_state.v
vlog -sv -work work ../../src/cordic.v

vlog -sv -work work ./raw_sine_tb.v
vsim -t 10ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work work.raw_sine_tb

add wave *

