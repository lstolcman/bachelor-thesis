
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# compile fir second libraries
set QSYS_SIMDIR ./../../src/megafunctions/fir_ii/second/fir_second_sim
do "$QSYS_SIMDIR/mentor/msim_setup.tcl"
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
vcom "$QSYS_SIMDIR/fir_second.vhd"


vlog -sv -work work ../../src/modules/cordic/src/cordic.v
vlog -sv -work work fir_second_tb.v

vsim -L rtl_work -L work work.fir_second_tb

nolog -all


add wave clock130
add wave clock1_3
add wave reset_n
add wave -analog -height 80 -max 3e4 -min -3e4 datain
add wave -analog -height 80 -max 1e7 -min -1e7 out_data
add wave out_valid
add wave -analog -height 80 -max 1e7 -min -1e7 out
add wave out_error

set StdArithNoWarnings 1 
run 0 ns 
set StdArithNoWarnings 0 
run 100us

