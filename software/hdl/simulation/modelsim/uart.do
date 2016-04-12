transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work




vlog -sv ../../src/megafunctions/pll/board/pll_board.v
vlog -sv ../../src/megafunctions/pll/uart/pll_uart.v

vlog -sv ../../src/reset_state.v

vlog -sv -work work ../../src/uart.v
vlog -sv -work work uart.v

vsim -L altera_mf_ver -L rtl_work -L work work.uart_tb

add wave *



