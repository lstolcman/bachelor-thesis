-- ------------------------------------------------------------------------- 
-- Altera DSP Builder Advanced Flow Tools Release Version 15.1
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2015 Altera Corporation.  All rights reserved.
-- Your use of  Altera  Corporation's design tools,  logic functions and other
-- software and tools,  and its AMPP  partner logic functions, and  any output
-- files  any of the  foregoing  device programming or simulation files),  and
-- any associated  documentation or information are expressly subject  to  the
-- terms and conditions  of the Altera Program License Subscription Agreement,
-- Altera  MegaCore  Function  License  Agreement, or other applicable license
-- agreement,  including,  without limitation,  that your use  is for the sole
-- purpose of  programming  logic  devices  manufactured by Altera and sold by
-- Altera or its authorized  distributors.  Please  refer  to  the  applicable
-- agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from fir_first_0002_rtl
-- VHDL created on Wed Apr 06 13:56:31 2016


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity fir_first_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(34 downto 0);  -- sfix35
        clk : in std_logic;
        areset : in std_logic
    );
end fir_first_0002_rtl;

architecture normal of fir_first_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id0_q_17_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_21_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count0_i : UNSIGNED (8 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra4_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra4_count0_sc : SIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra4_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra4_count1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count1_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra4_count1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra4_count1_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra4_count1_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra4_count1_lutreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_add_0_0_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_add_0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_add_0_0_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_add_0_0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal d_u0_m0_wo0_wi0_r0_ra4_resize_b_17_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count0_i : UNSIGNED (9 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra6_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra6_count0_sc : SIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra6_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra6_count1_lutreg_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_add_0_0_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_add_0_0_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_add_0_0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_add_0_0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_count1_lutreg_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_add_0_0_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_add_0_0_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_add_0_0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_add_0_0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count0_i : UNSIGNED (10 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra13_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra13_count0_sc : SIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra13_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra13_count1_lutreg_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_add_0_0_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_add_0_0_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_add_0_0_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_add_0_0_q : STD_LOGIC_VECTOR (12 downto 0);
    signal d_u0_m0_wo0_wi0_r0_ra13_resize_b_17_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_wa2_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_wa2_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa2_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_wa3_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa3_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa4_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_wa4_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa4_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa5_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_wa5_i : UNSIGNED (9 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa5_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa6_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_wa6_i : UNSIGNED (9 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa6_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa7_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_wa7_i : UNSIGNED (9 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa7_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa8_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_wa8_i : UNSIGNED (9 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa8_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa9_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_wa9_i : UNSIGNED (10 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa9_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa10_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_wa10_i : UNSIGNED (10 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa10_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa11_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_wa11_i : UNSIGNED (10 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa11_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr2_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr2_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr3_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr4_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr4_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr4_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr4_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr4_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr5_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr6_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr7_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr8_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr8_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr8_aa : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr8_ab : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_memr8_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr9_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr10_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr10_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr10_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_memr10_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_memr10_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr11_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_aa : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_ab : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_ca6_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_ca6_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_ca6_i : signal is true;
    signal u0_m0_wo0_ca6_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca6_eq : signal is true;
    signal d_u0_m0_wo0_ca6_q_16_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_sym_add2_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add2_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add4_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add5_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add6_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (34 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_ia : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_ir : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_r : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_ia : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_ir : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_r : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_ia : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_ir : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_r : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_cm2_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm2_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm2_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm2_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm2_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm2_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm3_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm3_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm3_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm3_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm3_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm3_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm4_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm4_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm4_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm4_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm4_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm4_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm5_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm5_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm5_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm5_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm5_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm5_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm6_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm6_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm6_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm6_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_oseq_gated_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_resize_in : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra4_resize_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_resize_in : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra6_resize_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_resize_in : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra8_resize_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_resize_in : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra13_resize_b : STD_LOGIC_VECTOR (10 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- xIn(PORTIN,2)@10

    -- u0_m0_wo0_run(ENABLEGENERATOR,9)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(7 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(92, 8);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "000000000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(7) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-93);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(7 downto 7));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "000000000";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "111111111";
                WHEN "100" => u0_m0_wo0_run_inc := "000000000";
                WHEN "101" => u0_m0_wo0_run_inc := "001100100";
                WHEN "110" => u0_m0_wo0_run_inc := "111111111";
                WHEN "111" => u0_m0_wo0_run_inc := "001100011";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(8 downto 8);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q and VCC_q;

    -- u0_m0_wo0_memread(DELAY,10)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_14(DELAY,129)@12
    d_u0_m0_wo0_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,11)@14
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_14_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_20(DELAY,130)@14
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,102)@20
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "000000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "000000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 93;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(8 downto 8));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_21(DELAY,131)@20
    d_u0_m0_wo0_compute_q_21 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_20_q, xout => d_u0_m0_wo0_compute_q_21_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra4_count1(COUNTER,23)@12
    -- every=1, low=0, high=93, step=1, init=1
    u0_m0_wo0_wi0_r0_ra4_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra4_count1_i <= TO_UNSIGNED(1, 7);
            u0_m0_wo0_wi0_r0_ra4_count1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra4_count1_i = TO_UNSIGNED(92, 7)) THEN
                    u0_m0_wo0_wi0_r0_ra4_count1_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra4_count1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra4_count1_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra4_count1_i <= u0_m0_wo0_wi0_r0_ra4_count1_i - 93;
                ELSE
                    u0_m0_wo0_wi0_r0_ra4_count1_i <= u0_m0_wo0_wi0_r0_ra4_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra4_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra4_count1_i, 7)));

    -- u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem(DUALMEM,119)@12
    u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra4_count1_q;
    u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 12,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_ir(11 downto 0);

    -- u0_m0_wo0_wi0_r0_ra13_count1_lutreg(REG,43)@14
    u0_m0_wo0_wi0_r0_ra13_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra13_count1_lutreg_q <= "011010011000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra13_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra13_count1_lut_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra13_count0(COUNTER,40)@14
    -- every=94, low=0, high=2047, step=100, init=0
    u0_m0_wo0_wi0_r0_ra13_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra13_count0_i <= TO_UNSIGNED(0, 11);
            u0_m0_wo0_wi0_r0_ra13_count0_sc <= TO_SIGNED(92, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra13_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra13_count0_sc <= u0_m0_wo0_wi0_r0_ra13_count0_sc - (-93);
                ELSE
                    u0_m0_wo0_wi0_r0_ra13_count0_sc <= u0_m0_wo0_wi0_r0_ra13_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra13_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra13_count0_i <= u0_m0_wo0_wi0_r0_ra13_count0_i + 100;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra13_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra13_count0_i, 12)));

    -- u0_m0_wo0_wi0_r0_ra13_add_0_0(ADD,44)@14
    u0_m0_wo0_wi0_r0_ra13_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra13_count0_q);
    u0_m0_wo0_wi0_r0_ra13_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra13_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra13_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra13_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra13_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra13_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra13_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra13_add_0_0_q <= u0_m0_wo0_wi0_r0_ra13_add_0_0_o(12 downto 0);

    -- u0_m0_wo0_wi0_r0_ra13_resize(BITSELECT,45)@15
    u0_m0_wo0_wi0_r0_ra13_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra13_add_0_0_q(10 downto 0));
    u0_m0_wo0_wi0_r0_ra13_resize_b <= u0_m0_wo0_wi0_r0_ra13_resize_in(10 downto 0);

    -- d_u0_m0_wo0_wi0_r0_ra13_resize_b_17(DELAY,133)@15
    d_u0_m0_wo0_wi0_r0_ra13_resize_b_17 : dspba_delay
    GENERIC MAP ( width => 11, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_ra13_resize_b, xout => d_u0_m0_wo0_wi0_r0_ra13_resize_b_17_q, clk => clk, aclr => areset );

    -- d_xIn_0_15(DELAY,125)@10
    d_xIn_0_15 : dspba_delay
    GENERIC MAP ( width => 16, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_15_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id0_q_17(DELAY,126)@15
    d_in0_m0_wi0_wo0_assign_id0_q_17 : dspba_delay
    GENERIC MAP ( width => 16, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_xIn_0_15_q, xout => d_in0_m0_wi0_wo0_assign_id0_q_17_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,127)@10
    d_in0_m0_wi0_wo0_assign_id1_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_15_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_17(DELAY,128)@15
    d_in0_m0_wi0_wo0_assign_id1_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_in0_m0_wi0_wo0_assign_id1_q_15_q, xout => d_in0_m0_wi0_wo0_assign_id1_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa11(COUNTER,57)@17
    -- every=1, low=0, high=2047, step=1, init=664
    u0_m0_wo0_wi0_r0_wa11: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa11_i <= TO_UNSIGNED(664, 11);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_17_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa11_i <= u0_m0_wo0_wi0_r0_wa11_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa11_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa11_i, 11)));

    -- u0_m0_wo0_wi0_r0_memr11(DUALMEM,71)@17
    u0_m0_wo0_wi0_r0_memr11_ia <= STD_LOGIC_VECTOR(d_in0_m0_wi0_wo0_assign_id0_q_17_q);
    u0_m0_wo0_wi0_r0_memr11_aa <= u0_m0_wo0_wi0_r0_wa11_q;
    u0_m0_wo0_wi0_r0_memr11_ab <= d_u0_m0_wo0_wi0_r0_ra13_resize_b_17_q;
    u0_m0_wo0_wi0_r0_memr11_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 16,
        widthad_b => 11,
        numwords_b => 2048,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr11_aa,
        data_a => u0_m0_wo0_wi0_r0_memr11_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_17_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr11_ab,
        q_b => u0_m0_wo0_wi0_r0_memr11_iq
    );
    u0_m0_wo0_wi0_r0_memr11_q <= u0_m0_wo0_wi0_r0_memr11_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem(DUALMEM,116)@12
    u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra4_count1_q;
    u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_wi0_r0_ra4_count1_lutreg(REG,25)@14
    u0_m0_wo0_wi0_r0_ra4_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra4_count1_lutreg_q <= "00010011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra4_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra4_count1_lut_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra4_count0(COUNTER,22)@14
    -- every=94, low=0, high=511, step=100, init=0
    u0_m0_wo0_wi0_r0_ra4_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra4_count0_i <= TO_UNSIGNED(0, 9);
            u0_m0_wo0_wi0_r0_ra4_count0_sc <= TO_SIGNED(92, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra4_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra4_count0_sc <= u0_m0_wo0_wi0_r0_ra4_count0_sc - (-93);
                ELSE
                    u0_m0_wo0_wi0_r0_ra4_count0_sc <= u0_m0_wo0_wi0_r0_ra4_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra4_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra4_count0_i <= u0_m0_wo0_wi0_r0_ra4_count0_i + 100;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra4_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra4_count0_i, 10)));

    -- u0_m0_wo0_wi0_r0_ra4_add_0_0(ADD,26)@14
    u0_m0_wo0_wi0_r0_ra4_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra4_count0_q);
    u0_m0_wo0_wi0_r0_ra4_add_0_0_b <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_wi0_r0_ra4_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra4_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra4_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra4_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra4_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra4_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra4_add_0_0_q <= u0_m0_wo0_wi0_r0_ra4_add_0_0_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_ra4_resize(BITSELECT,27)@15
    u0_m0_wo0_wi0_r0_ra4_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra4_add_0_0_q(8 downto 0));
    u0_m0_wo0_wi0_r0_ra4_resize_b <= u0_m0_wo0_wi0_r0_ra4_resize_in(8 downto 0);

    -- d_u0_m0_wo0_wi0_r0_ra4_resize_b_17(DELAY,132)@15
    d_u0_m0_wo0_wi0_r0_ra4_resize_b_17 : dspba_delay
    GENERIC MAP ( width => 9, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_ra4_resize_b, xout => d_u0_m0_wo0_wi0_r0_ra4_resize_b_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa2(COUNTER,48)@17
    -- every=1, low=0, high=511, step=1, init=300
    u0_m0_wo0_wi0_r0_wa2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa2_i <= TO_UNSIGNED(300, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_17_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa2_i <= u0_m0_wo0_wi0_r0_wa2_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa2_i, 9)));

    -- u0_m0_wo0_wi0_r0_memr2(DUALMEM,62)@17
    u0_m0_wo0_wi0_r0_memr2_ia <= STD_LOGIC_VECTOR(d_in0_m0_wi0_wo0_assign_id0_q_17_q);
    u0_m0_wo0_wi0_r0_memr2_aa <= u0_m0_wo0_wi0_r0_wa2_q;
    u0_m0_wo0_wi0_r0_memr2_ab <= d_u0_m0_wo0_wi0_r0_ra4_resize_b_17_q;
    u0_m0_wo0_wi0_r0_memr2_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 16,
        widthad_b => 9,
        numwords_b => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr2_aa,
        data_a => u0_m0_wo0_wi0_r0_memr2_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_17_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr2_ab,
        q_b => u0_m0_wo0_wi0_r0_memr2_iq
    );
    u0_m0_wo0_wi0_r0_memr2_q <= u0_m0_wo0_wi0_r0_memr2_iq(15 downto 0);

    -- u0_m0_wo0_sym_add2(ADD,84)@17
    u0_m0_wo0_sym_add2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr2_q(15)) & u0_m0_wo0_wi0_r0_memr2_q));
    u0_m0_wo0_sym_add2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr11_q(15)) & u0_m0_wo0_wi0_r0_memr11_q));
    u0_m0_wo0_sym_add2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add2_a) + SIGNED(u0_m0_wo0_sym_add2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add2_q <= u0_m0_wo0_sym_add2_o(16 downto 0);

    -- u0_m0_wo0_ca6(COUNTER,74)@14
    -- every=1, low=0, high=93, step=1, init=0
    u0_m0_wo0_ca6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca6_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_ca6_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca6_i = TO_UNSIGNED(92, 7)) THEN
                    u0_m0_wo0_ca6_eq <= '1';
                ELSE
                    u0_m0_wo0_ca6_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca6_eq = '1') THEN
                    u0_m0_wo0_ca6_i <= u0_m0_wo0_ca6_i - 93;
                ELSE
                    u0_m0_wo0_ca6_i <= u0_m0_wo0_ca6_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca6_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca6_i, 7)));

    -- d_u0_m0_wo0_ca6_q_16(DELAY,134)@14
    d_u0_m0_wo0_ca6_q_16 : dspba_delay
    GENERIC MAP ( width => 7, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca6_q, xout => d_u0_m0_wo0_ca6_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm2_lutmem(DUALMEM,120)@16
    u0_m0_wo0_cm2_lutmem_aa <= d_u0_m0_wo0_ca6_q_16_q;
    u0_m0_wo0_cm2_lutmem_reset0 <= areset;
    u0_m0_wo0_cm2_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_cm2_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm2_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm2_lutmem_aa,
        q_a => u0_m0_wo0_cm2_lutmem_ir
    );
    u0_m0_wo0_cm2_lutmem_r <= u0_m0_wo0_cm2_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_4(MULT,91)@18
    u0_m0_wo0_mtree_mult1_4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_lutmem_r);
    u0_m0_wo0_mtree_mult1_4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add2_q);
    u0_m0_wo0_mtree_mult1_4_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 17,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_4_a0,
        datab => u0_m0_wo0_mtree_mult1_4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_4_s1
    );
    u0_m0_wo0_mtree_mult1_4_q <= u0_m0_wo0_mtree_mult1_4_s1;

    -- u0_m0_wo0_wi0_r0_wa10(COUNTER,56)@15
    -- every=1, low=0, high=2047, step=1, init=570
    u0_m0_wo0_wi0_r0_wa10: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa10_i <= TO_UNSIGNED(570, 11);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa10_i <= u0_m0_wo0_wi0_r0_wa10_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa10_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa10_i, 11)));

    -- u0_m0_wo0_wi0_r0_memr10(DUALMEM,70)@15
    u0_m0_wo0_wi0_r0_memr10_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr10_aa <= u0_m0_wo0_wi0_r0_wa10_q;
    u0_m0_wo0_wi0_r0_memr10_ab <= u0_m0_wo0_wi0_r0_ra13_resize_b;
    u0_m0_wo0_wi0_r0_memr10_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 16,
        widthad_b => 11,
        numwords_b => 2048,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr10_aa,
        data_a => u0_m0_wo0_wi0_r0_memr10_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr10_ab,
        q_b => u0_m0_wo0_wi0_r0_memr10_iq
    );
    u0_m0_wo0_wi0_r0_memr10_q <= u0_m0_wo0_wi0_r0_memr10_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_wa3(COUNTER,49)@15
    -- every=1, low=0, high=511, step=1, init=394
    u0_m0_wo0_wi0_r0_wa3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa3_i <= TO_UNSIGNED(394, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa3_i <= u0_m0_wo0_wi0_r0_wa3_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa3_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa3_i, 9)));

    -- u0_m0_wo0_wi0_r0_memr3(DUALMEM,63)@15
    u0_m0_wo0_wi0_r0_memr3_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr3_aa <= u0_m0_wo0_wi0_r0_wa3_q;
    u0_m0_wo0_wi0_r0_memr3_ab <= u0_m0_wo0_wi0_r0_ra4_resize_b;
    u0_m0_wo0_wi0_r0_memr3_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 16,
        widthad_b => 9,
        numwords_b => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr3_aa,
        data_a => u0_m0_wo0_wi0_r0_memr3_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr3_ab,
        q_b => u0_m0_wo0_wi0_r0_memr3_iq
    );
    u0_m0_wo0_wi0_r0_memr3_q <= u0_m0_wo0_wi0_r0_memr3_iq(15 downto 0);

    -- u0_m0_wo0_sym_add3(ADD,85)@15
    u0_m0_wo0_sym_add3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr3_q(15)) & u0_m0_wo0_wi0_r0_memr3_q));
    u0_m0_wo0_sym_add3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr10_q(15)) & u0_m0_wo0_wi0_r0_memr10_q));
    u0_m0_wo0_sym_add3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add3_a) + SIGNED(u0_m0_wo0_sym_add3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add3_q <= u0_m0_wo0_sym_add3_o(16 downto 0);

    -- u0_m0_wo0_cm3_lutmem(DUALMEM,121)@14
    u0_m0_wo0_cm3_lutmem_aa <= u0_m0_wo0_ca6_q;
    u0_m0_wo0_cm3_lutmem_reset0 <= areset;
    u0_m0_wo0_cm3_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_cm3_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm3_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm3_lutmem_aa,
        q_a => u0_m0_wo0_cm3_lutmem_ir
    );
    u0_m0_wo0_cm3_lutmem_r <= u0_m0_wo0_cm3_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_3(MULT,92)@16
    u0_m0_wo0_mtree_mult1_3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_lutmem_r);
    u0_m0_wo0_mtree_mult1_3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add3_q);
    u0_m0_wo0_mtree_mult1_3_reset <= areset;
    u0_m0_wo0_mtree_mult1_3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 17,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_3_a0,
        datab => u0_m0_wo0_mtree_mult1_3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_3_s1
    );
    u0_m0_wo0_mtree_mult1_3_q <= u0_m0_wo0_mtree_mult1_3_s1;

    -- u0_m0_wo0_wi0_r0_wa9(COUNTER,55)@15
    -- every=1, low=0, high=2047, step=1, init=476
    u0_m0_wo0_wi0_r0_wa9: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa9_i <= TO_UNSIGNED(476, 11);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa9_i <= u0_m0_wo0_wi0_r0_wa9_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa9_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa9_i, 11)));

    -- u0_m0_wo0_wi0_r0_memr9(DUALMEM,69)@15
    u0_m0_wo0_wi0_r0_memr9_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr9_aa <= u0_m0_wo0_wi0_r0_wa9_q;
    u0_m0_wo0_wi0_r0_memr9_ab <= u0_m0_wo0_wi0_r0_ra13_resize_b;
    u0_m0_wo0_wi0_r0_memr9_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 11,
        numwords_a => 2048,
        width_b => 16,
        widthad_b => 11,
        numwords_b => 2048,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr9_aa,
        data_a => u0_m0_wo0_wi0_r0_memr9_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr9_ab,
        q_b => u0_m0_wo0_wi0_r0_memr9_iq
    );
    u0_m0_wo0_wi0_r0_memr9_q <= u0_m0_wo0_wi0_r0_memr9_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_wa4(COUNTER,50)@15
    -- every=1, low=0, high=511, step=1, init=488
    u0_m0_wo0_wi0_r0_wa4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa4_i <= TO_UNSIGNED(488, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa4_i <= u0_m0_wo0_wi0_r0_wa4_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa4_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa4_i, 9)));

    -- u0_m0_wo0_wi0_r0_memr4(DUALMEM,64)@15
    u0_m0_wo0_wi0_r0_memr4_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr4_aa <= u0_m0_wo0_wi0_r0_wa4_q;
    u0_m0_wo0_wi0_r0_memr4_ab <= u0_m0_wo0_wi0_r0_ra4_resize_b;
    u0_m0_wo0_wi0_r0_memr4_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 9,
        numwords_a => 512,
        width_b => 16,
        widthad_b => 9,
        numwords_b => 512,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr4_aa,
        data_a => u0_m0_wo0_wi0_r0_memr4_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr4_ab,
        q_b => u0_m0_wo0_wi0_r0_memr4_iq
    );
    u0_m0_wo0_wi0_r0_memr4_q <= u0_m0_wo0_wi0_r0_memr4_iq(15 downto 0);

    -- u0_m0_wo0_sym_add4(ADD,86)@15
    u0_m0_wo0_sym_add4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr4_q(15)) & u0_m0_wo0_wi0_r0_memr4_q));
    u0_m0_wo0_sym_add4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr9_q(15)) & u0_m0_wo0_wi0_r0_memr9_q));
    u0_m0_wo0_sym_add4: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add4_a) + SIGNED(u0_m0_wo0_sym_add4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add4_q <= u0_m0_wo0_sym_add4_o(16 downto 0);

    -- u0_m0_wo0_cm4_lutmem(DUALMEM,122)@14
    u0_m0_wo0_cm4_lutmem_aa <= u0_m0_wo0_ca6_q;
    u0_m0_wo0_cm4_lutmem_reset0 <= areset;
    u0_m0_wo0_cm4_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_cm4_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm4_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm4_lutmem_aa,
        q_a => u0_m0_wo0_cm4_lutmem_ir
    );
    u0_m0_wo0_cm4_lutmem_r <= u0_m0_wo0_cm4_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_2(MULT,93)@16
    u0_m0_wo0_mtree_mult1_2_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_lutmem_r);
    u0_m0_wo0_mtree_mult1_2_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add4_q);
    u0_m0_wo0_mtree_mult1_2_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 17,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_a0,
        datab => u0_m0_wo0_mtree_mult1_2_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

    -- u0_m0_wo0_mtree_add0_1(ADD,97)@18
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_2_q(24)) & u0_m0_wo0_mtree_mult1_2_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_3_q(24)) & u0_m0_wo0_mtree_mult1_3_q));
    u0_m0_wo0_mtree_add0_1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem(DUALMEM,118)@12
    u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra4_count1_q;
    u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 9,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_ir(8 downto 0);

    -- u0_m0_wo0_wi0_r0_ra8_count1_lutreg(REG,37)@14
    u0_m0_wo0_wi0_r0_ra8_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra8_count1_lutreg_q <= "010000110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra8_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra8_count1_lut_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra6_count0(COUNTER,28)@14
    -- every=94, low=0, high=1023, step=100, init=0
    u0_m0_wo0_wi0_r0_ra6_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra6_count0_i <= TO_UNSIGNED(0, 10);
            u0_m0_wo0_wi0_r0_ra6_count0_sc <= TO_SIGNED(92, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra6_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra6_count0_sc <= u0_m0_wo0_wi0_r0_ra6_count0_sc - (-93);
                ELSE
                    u0_m0_wo0_wi0_r0_ra6_count0_sc <= u0_m0_wo0_wi0_r0_ra6_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra6_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra6_count0_i <= u0_m0_wo0_wi0_r0_ra6_count0_i + 100;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra6_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra6_count0_i, 11)));

    -- u0_m0_wo0_wi0_r0_ra8_add_0_0(ADD,38)@14
    u0_m0_wo0_wi0_r0_ra8_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra6_count0_q);
    u0_m0_wo0_wi0_r0_ra8_add_0_0_b <= STD_LOGIC_VECTOR("000" & u0_m0_wo0_wi0_r0_ra8_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra8_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra8_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra8_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra8_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra8_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra8_add_0_0_q <= u0_m0_wo0_wi0_r0_ra8_add_0_0_o(11 downto 0);

    -- u0_m0_wo0_wi0_r0_ra8_resize(BITSELECT,39)@15
    u0_m0_wo0_wi0_r0_ra8_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra8_add_0_0_q(9 downto 0));
    u0_m0_wo0_wi0_r0_ra8_resize_b <= u0_m0_wo0_wi0_r0_ra8_resize_in(9 downto 0);

    -- u0_m0_wo0_wi0_r0_wa8(COUNTER,54)@15
    -- every=1, low=0, high=1023, step=1, init=876
    u0_m0_wo0_wi0_r0_wa8: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa8_i <= TO_UNSIGNED(876, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa8_i <= u0_m0_wo0_wi0_r0_wa8_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa8_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa8_i, 10)));

    -- u0_m0_wo0_wi0_r0_memr8(DUALMEM,68)@15
    u0_m0_wo0_wi0_r0_memr8_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr8_aa <= u0_m0_wo0_wi0_r0_wa8_q;
    u0_m0_wo0_wi0_r0_memr8_ab <= u0_m0_wo0_wi0_r0_ra8_resize_b;
    u0_m0_wo0_wi0_r0_memr8_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 10,
        numwords_a => 1024,
        width_b => 16,
        widthad_b => 10,
        numwords_b => 1024,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr8_aa,
        data_a => u0_m0_wo0_wi0_r0_memr8_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr8_ab,
        q_b => u0_m0_wo0_wi0_r0_memr8_iq
    );
    u0_m0_wo0_wi0_r0_memr8_q <= u0_m0_wo0_wi0_r0_memr8_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem(DUALMEM,117)@12
    u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra4_count1_q;
    u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 11,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_ir(10 downto 0);

    -- u0_m0_wo0_wi0_r0_ra6_count1_lutreg(REG,31)@14
    u0_m0_wo0_wi0_r0_ra6_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra6_count1_lutreg_q <= "01011100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra6_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra6_count1_lut_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra6_add_0_0(ADD,32)@14
    u0_m0_wo0_wi0_r0_ra6_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra6_count0_q);
    u0_m0_wo0_wi0_r0_ra6_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra6_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra6_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra6_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra6_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra6_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra6_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra6_add_0_0_q <= u0_m0_wo0_wi0_r0_ra6_add_0_0_o(11 downto 0);

    -- u0_m0_wo0_wi0_r0_ra6_resize(BITSELECT,33)@15
    u0_m0_wo0_wi0_r0_ra6_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra6_add_0_0_q(9 downto 0));
    u0_m0_wo0_wi0_r0_ra6_resize_b <= u0_m0_wo0_wi0_r0_ra6_resize_in(9 downto 0);

    -- u0_m0_wo0_wi0_r0_wa5(COUNTER,51)@15
    -- every=1, low=0, high=1023, step=1, init=282
    u0_m0_wo0_wi0_r0_wa5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa5_i <= TO_UNSIGNED(282, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa5_i <= u0_m0_wo0_wi0_r0_wa5_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa5_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa5_i, 10)));

    -- u0_m0_wo0_wi0_r0_memr5(DUALMEM,65)@15
    u0_m0_wo0_wi0_r0_memr5_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr5_aa <= u0_m0_wo0_wi0_r0_wa5_q;
    u0_m0_wo0_wi0_r0_memr5_ab <= u0_m0_wo0_wi0_r0_ra6_resize_b;
    u0_m0_wo0_wi0_r0_memr5_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 10,
        numwords_a => 1024,
        width_b => 16,
        widthad_b => 10,
        numwords_b => 1024,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr5_aa,
        data_a => u0_m0_wo0_wi0_r0_memr5_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr5_ab,
        q_b => u0_m0_wo0_wi0_r0_memr5_iq
    );
    u0_m0_wo0_wi0_r0_memr5_q <= u0_m0_wo0_wi0_r0_memr5_iq(15 downto 0);

    -- u0_m0_wo0_sym_add5(ADD,87)@15
    u0_m0_wo0_sym_add5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr5_q(15)) & u0_m0_wo0_wi0_r0_memr5_q));
    u0_m0_wo0_sym_add5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr8_q(15)) & u0_m0_wo0_wi0_r0_memr8_q));
    u0_m0_wo0_sym_add5: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add5_a) + SIGNED(u0_m0_wo0_sym_add5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add5_q <= u0_m0_wo0_sym_add5_o(16 downto 0);

    -- u0_m0_wo0_cm5_lutmem(DUALMEM,123)@14
    u0_m0_wo0_cm5_lutmem_aa <= u0_m0_wo0_ca6_q;
    u0_m0_wo0_cm5_lutmem_reset0 <= areset;
    u0_m0_wo0_cm5_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_cm5_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm5_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm5_lutmem_aa,
        q_a => u0_m0_wo0_cm5_lutmem_ir
    );
    u0_m0_wo0_cm5_lutmem_r <= u0_m0_wo0_cm5_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_1(MULT,94)@16
    u0_m0_wo0_mtree_mult1_1_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_lutmem_r);
    u0_m0_wo0_mtree_mult1_1_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add5_q);
    u0_m0_wo0_mtree_mult1_1_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 17,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_a0,
        datab => u0_m0_wo0_mtree_mult1_1_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_s1
    );
    u0_m0_wo0_mtree_mult1_1_q <= u0_m0_wo0_mtree_mult1_1_s1;

    -- u0_m0_wo0_wi0_r0_wa7(COUNTER,53)@15
    -- every=1, low=0, high=1023, step=1, init=782
    u0_m0_wo0_wi0_r0_wa7: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa7_i <= TO_UNSIGNED(782, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa7_i <= u0_m0_wo0_wi0_r0_wa7_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa7_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa7_i, 10)));

    -- u0_m0_wo0_wi0_r0_memr7(DUALMEM,67)@15
    u0_m0_wo0_wi0_r0_memr7_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr7_aa <= u0_m0_wo0_wi0_r0_wa7_q;
    u0_m0_wo0_wi0_r0_memr7_ab <= u0_m0_wo0_wi0_r0_ra8_resize_b;
    u0_m0_wo0_wi0_r0_memr7_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 10,
        numwords_a => 1024,
        width_b => 16,
        widthad_b => 10,
        numwords_b => 1024,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr7_aa,
        data_a => u0_m0_wo0_wi0_r0_memr7_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr7_ab,
        q_b => u0_m0_wo0_wi0_r0_memr7_iq
    );
    u0_m0_wo0_wi0_r0_memr7_q <= u0_m0_wo0_wi0_r0_memr7_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_wa6(COUNTER,52)@15
    -- every=1, low=0, high=1023, step=1, init=376
    u0_m0_wo0_wi0_r0_wa6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa6_i <= TO_UNSIGNED(376, 10);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa6_i <= u0_m0_wo0_wi0_r0_wa6_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa6_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa6_i, 10)));

    -- u0_m0_wo0_wi0_r0_memr6(DUALMEM,66)@15
    u0_m0_wo0_wi0_r0_memr6_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr6_aa <= u0_m0_wo0_wi0_r0_wa6_q;
    u0_m0_wo0_wi0_r0_memr6_ab <= u0_m0_wo0_wi0_r0_ra6_resize_b;
    u0_m0_wo0_wi0_r0_memr6_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 10,
        numwords_a => 1024,
        width_b => 16,
        widthad_b => 10,
        numwords_b => 1024,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr6_aa,
        data_a => u0_m0_wo0_wi0_r0_memr6_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr6_ab,
        q_b => u0_m0_wo0_wi0_r0_memr6_iq
    );
    u0_m0_wo0_wi0_r0_memr6_q <= u0_m0_wo0_wi0_r0_memr6_iq(15 downto 0);

    -- u0_m0_wo0_sym_add6(ADD,88)@15
    u0_m0_wo0_sym_add6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr6_q(15)) & u0_m0_wo0_wi0_r0_memr6_q));
    u0_m0_wo0_sym_add6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr7_q(15)) & u0_m0_wo0_wi0_r0_memr7_q));
    u0_m0_wo0_sym_add6: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add6_a) + SIGNED(u0_m0_wo0_sym_add6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add6_q <= u0_m0_wo0_sym_add6_o(16 downto 0);

    -- u0_m0_wo0_cm6_lutmem(DUALMEM,124)@14
    u0_m0_wo0_cm6_lutmem_aa <= u0_m0_wo0_ca6_q;
    u0_m0_wo0_cm6_lutmem_reset0 <= areset;
    u0_m0_wo0_cm6_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 94,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_first_0002_rtl_u0_m0_wo0_cm6_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm6_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm6_lutmem_aa,
        q_a => u0_m0_wo0_cm6_lutmem_ir
    );
    u0_m0_wo0_cm6_lutmem_r <= u0_m0_wo0_cm6_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_mtree_mult1_0(MULT,95)@16
    u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm6_lutmem_r);
    u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add6_q);
    u0_m0_wo0_mtree_mult1_0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 8,
        lpm_widthb => 17,
        lpm_widthp => 25,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_mtree_add0_0(ADD,96)@18
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_0_q(24)) & u0_m0_wo0_mtree_mult1_0_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_mult1_1_q(24)) & u0_m0_wo0_mtree_mult1_1_q));
    u0_m0_wo0_mtree_add0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(25 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,99)@19
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_0_q(25)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add0_1_q(25)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(26 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,101)@20
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add1_0_q(26)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 25 => u0_m0_wo0_mtree_mult1_4_q(24)) & u0_m0_wo0_mtree_mult1_4_q));
    u0_m0_wo0_mtree_add2_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(27 downto 0);

    -- u0_m0_wo0_accum(ADD,103)@21
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((34 downto 28 => u0_m0_wo0_mtree_add2_0_q(27)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_21_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(34 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,104)@20
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "001011101";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "000000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 93;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(8 downto 8));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,105)@21
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_21_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

    -- u0_m0_wo0_oseq_gated_reg(REG,106)@21
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,111)@22
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
