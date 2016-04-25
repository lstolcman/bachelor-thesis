
transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work


# compile fir first libraries
set QSYS_SIMDIR ./../../src/megafunctions/cic/cic/simulation
do "$QSYS_SIMDIR/mentor/msim_setup.tcl"
com


vlog -sv -work work ../../src/modules/cordic/src/cordic.v
vlog -sv -work work cic_tb.v

vsim -L rtl_work -L work -L work_lib -L cic_ii_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver work.cic_tb

nolog -all


add wave -analog -height 50 -max 5e5 -min -5e5 f77k5
add wave -analog -height 50 -max 5e5 -min -5e5 f700k
add wave -analog -height 80 -max 5e5 -min -5e5 sum
add wave -analog -height 80 -max 3e15 -min -3e15 out_data
add wave out_valid
add wave -analog -height 80 -max 1e4 -min -1e4 out
add wave memory


set StdArithNoWarnings 1 
run 0ns 
set StdArithNoWarnings 0 

