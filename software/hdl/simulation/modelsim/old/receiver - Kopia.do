transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work





####
#init fir first files
set QSYS_SIMDIR "../../src/megafunctions/fir_ii/first/fir_first_sim"
do "$QSYS_SIMDIR/mentor/msim_setup.tcl"
file_copy

#com
vcom "$QSYS_SIMDIR/dspba_library_package.vhd"
vcom "$QSYS_SIMDIR/dspba_library.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_math_pkg_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_lib_pkg_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_avalon_streaming_sink_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_avalon_streaming_source_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_roundsat_hpfir.vhd"
vlog "$QSYS_SIMDIR/altera_avalon_sc_fifo.v"
vcom "$QSYS_SIMDIR/fir_first_rtl.vhd"
vcom "$QSYS_SIMDIR/fir_first_ast.vhd"
#vcom "$QSYS_SIMDIR/fir_first.vhd"


####

#init fir second files
set QSYS_SIMDIR "../../src/megafunctions/fir_ii/second/fir_second_sim"
do "$QSYS_SIMDIR/mentor/msim_setup.tcl"
file_copy

#com
vcom "$QSYS_SIMDIR/dspba_library_package.vhd"
vcom "$QSYS_SIMDIR/dspba_library.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_math_pkg_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_lib_pkg_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_avalon_streaming_sink_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_avalon_streaming_source_hpfir.vhd"
vcom "$QSYS_SIMDIR/auk_dspip_roundsat_hpfir.vhd"
vlog "$QSYS_SIMDIR/altera_avalon_sc_fifo.v"
vcom "$QSYS_SIMDIR/fir_second_rtl.vhd"
vcom "$QSYS_SIMDIR/fir_second_ast.vhd"
#vcom "$QSYS_SIMDIR/fir_second.vhd"

####

#init pll board
vlog ../../src/megafunctions/pll/board/pll_board.v


####

#init pll uart
vlog -sv ../../src/megafunctions/pll/uart/pll_uart.v



vlog -sv -work work ../../src/interface.v
vlog -sv -work work ../../src/mult.v
vlog -sv -work work ../../src/receiver.v
vlog -sv -work work ../../src/uart.v
vlog -sv -work work ../../src/reset_state.v
vlog -sv -work work ../../src/cordic.v

vlog -sv -work work ./receiver_tb.v
vsim -t 10ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work work.receiver_tb

add wave *

