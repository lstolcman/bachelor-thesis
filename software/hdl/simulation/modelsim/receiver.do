transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


####

#init fir first files
set QSYS_SIMDIR ../../src/megafunctions/fir_ii/first/fir_first_sim
do "$QSYS_SIMDIR/mentor/msim_setup.tcl"

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
vcom "$QSYS_SIMDIR/fir_first.vhd"
#vcom "$QSYS_SIMDIR/fir_first.vhd"


####

#init fir second files
set QSYS_SIMDIR ../../src/megafunctions/fir_ii/second/fir_second_sim
do "$QSYS_SIMDIR/mentor/msim_setup.tcl"

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
vcom "$QSYS_SIMDIR/fir_second.vhd"
#vcom "$QSYS_SIMDIR/fir_second.vhd"



####

#init pll board
vlog ../../src/megafunctions/pll/board/pll_board.v

#init pll uart
vlog ../../src/megafunctions/pll/uart/pll_uart.v


####



# goertzel module 
vlog -sv -work work ../../src/modules/goertzel/src/megafunc/fpmult.v
vlog -sv -work work ../../src/modules/goertzel/src/megafunc/fpadd.v
vlog -sv -work work ../../src/modules/goertzel/src/megafunc/fpsub.v
vlog -sv -work work ../../src/modules/goertzel/src/megafunc/fp64int64conv.v
vlog -sv -work work ../../src/modules/goertzel/src/megafunc/fp64int32conv.v
vlog -sv -work work ../../src/modules/goertzel/src/megafunc/int32fp64conv.v
vlog -sv -work work ../../src/modules/goertzel/src/goertzel.v
#-----------------


vlog -sv -work work ../../src/modules/cordic/src/cordic.v

vlog -sv -work work ../../src/modules/uart/src/uart.v





vlog -sv -work work ../../src/receiver.v
vlog -sv -work work ../../src/reset_state.v

vlog -sv -work work receiver_tb.v
vsim -L lpm_ver -L altera_mf_ver -L rtl_work -L work work.receiver_tb

# speedup modelsim simulation - no log file is written
# source: http://www.ht-lab.com/howto/modelsim/Modelsim_tips.html
nolog -all


add wave CLOCK_50
add wave CLOCK_130
add wave CLOCK_1_3
add wave CLOCK_115200
add wave CLKOUTA
add wave -analog -height 100 -max 32768 -min -32768 DA
add wave receiver_i1/reset_n
add wave -binary ready
add wave -unsigned power
add wave -binary TX
add wave -unsigned i
add wave memory


set StdArithNoWarnings 1
run 0 ns
set StdArithNoWarnings 0


