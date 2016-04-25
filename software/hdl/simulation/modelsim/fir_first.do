
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# compile fir first libraries
set QSYS_SIMDIR ./../../src/megafunctions/fir_ii/first/fir_first_sim
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
vcom "$QSYS_SIMDIR/fir_first_rtl.vhd"
vcom "$QSYS_SIMDIR/fir_first_ast.vhd"
vcom "$QSYS_SIMDIR/fir_first.vhd"


vlog -sv -work work ../../src/modules/cordic/src/cordic.v
vlog -sv -work work fir_first_tb.v

vsim -L rtl_work -L work work.fir_first_tb

nolog -all


add wave -analog -height 50 -max 5e5 -min -5e5 f77k5
add wave -analog -height 50 -max 5e5 -min -5e5 f700k
add wave -analog -height 80 -max 3e4 -min -3e4 sum
add wave -analog -height 80 -max 1e6 -min -1e6 out_data
add wave out_valid
add wave -analog -height 80 -max 1e4 -min -1e4 out

set StdArithNoWarnings 1 
run 0 ns 
set StdArithNoWarnings 0 
run 100us

