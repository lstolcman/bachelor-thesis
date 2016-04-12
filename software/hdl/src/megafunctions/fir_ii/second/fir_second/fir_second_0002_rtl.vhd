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

-- VHDL created from fir_second_0002_rtl
-- VHDL created on Tue Apr 12 14:01:21 2016


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

entity fir_second_0002_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(25 downto 0);  -- sfix26
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(43 downto 0);  -- sfix44
        clk : in std_logic;
        areset : in std_logic
    );
end fir_second_0002_rtl;

architecture normal of fir_second_0002_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_15_q : STD_LOGIC_VECTOR (25 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_15_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_i : UNSIGNED (6 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count0_sc : SIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count1_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count1_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_a : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_o : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_we2_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_we2_seq_eq : std_logic;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_wa2_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa2_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr0_q_16_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr1_ia : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_iq : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_ca2_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_ca2_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_ca2_i : signal is true;
    signal u0_m0_wo0_ca2_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca2_eq : signal is true;
    signal d_u0_m0_wo0_ca2_q_14_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (37 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (43 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (43 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (43 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (43 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (43 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_ir : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_r : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm0_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm0_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm0_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm0_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm0_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm0_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm1_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm1_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm1_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm1_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm1_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm1_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm2_lutmem_reset0 : std_logic;
    signal u0_m0_wo0_cm2_lutmem_ia : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm2_lutmem_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm2_lutmem_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_cm2_lutmem_ir : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_cm2_lutmem_r : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_b0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_im0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im4_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im4_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im4_s1 : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_im4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_im4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_result_add_0_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_b0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im4_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im4_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im4_s1 : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_im4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_im4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_result_add_0_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_a0 : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_b0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_s1 : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im4_a0 : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im4_b0 : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im4_s1 : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_im4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_im4_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_a : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_b : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_o : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_result_add_0_0_q : STD_LOGIC_VECTOR (36 downto 0);
    signal u0_m0_wo0_oseq_gated_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_resize_in : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_resize_b : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bs2_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bs2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bs6_in : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bs6_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_in : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_wi0_r0_split1_c : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_align_8_q : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_align_8_q_int : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_8_q : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_align_8_q_int : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_8_q : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_align_8_q_int : STD_LOGIC_VECTOR (35 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_bjB3_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_wi0_r0_join1_q : STD_LOGIC_VECTOR (51 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs2_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs6_in : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bs6_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs2_in : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs2_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs6_in : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bs6_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_bjB3_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_bjB3_q : STD_LOGIC_VECTOR (17 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- xIn(PORTIN,2)@10

    -- u0_m0_wo0_run(ENABLEGENERATOR,9)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(7 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(84, 8);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(7) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-85);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(7 downto 7));
            ELSE
                u0_m0_wo0_run_enable_q <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_pre_ena_q <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_pre_ena_q and VCC_q;

    -- u0_m0_wo0_memread(DELAY,10)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,84)@12
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,11)@13
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_13_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_14(DELAY,86)@13
    d_u0_m0_wo0_compute_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_14_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_19(DELAY,87)@14
    d_u0_m0_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_14_q, xout => d_u0_m0_wo0_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,35)@19
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "000000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "000000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 85;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(8 downto 8));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_20(DELAY,88)@19
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_19_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_14(DELAY,85)@13
    d_u0_m0_wo0_memread_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_13_q, xout => d_u0_m0_wo0_memread_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra2_count1(COUNTER,14)@12
    -- every=1, low=0, high=85, step=1, init=1
    u0_m0_wo0_wi0_r0_ra2_count1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count1_i <= TO_UNSIGNED(1, 7);
            u0_m0_wo0_wi0_r0_ra2_count1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra2_count1_i = TO_UNSIGNED(84, 7)) THEN
                    u0_m0_wo0_wi0_r0_ra2_count1_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra2_count1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra2_count1_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra2_count1_i <= u0_m0_wo0_wi0_r0_ra2_count1_i - 85;
                ELSE
                    u0_m0_wo0_wi0_r0_ra2_count1_i <= u0_m0_wo0_wi0_r0_ra2_count1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_count1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra2_count1_i, 7)));

    -- u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem(DUALMEM,45)@12
    u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_aa <= u0_m0_wo0_wi0_r0_ra2_count1_q;
    u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_reset0 <= areset;
    u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 8,
        widthad_a => 7,
        numwords_a => 86,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_second_0002_rtl_u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_aa,
        q_a => u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_ir
    );
    u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_r <= u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_ir(7 downto 0);

    -- u0_m0_wo0_wi0_r0_ra2_count1_lutreg(REG,16)@14
    u0_m0_wo0_wi0_r0_ra2_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q <= "01011000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra2_count1_lut_lutmem_r);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra2_count0(COUNTER,13)@14
    -- every=86, low=0, high=127, step=1, init=0
    u0_m0_wo0_wi0_r0_ra2_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count0_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_wi0_r0_ra2_count0_sc <= TO_SIGNED(84, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra2_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra2_count0_sc <= u0_m0_wo0_wi0_r0_ra2_count0_sc - (-85);
                ELSE
                    u0_m0_wo0_wi0_r0_ra2_count0_sc <= u0_m0_wo0_wi0_r0_ra2_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra2_count0_sc(7) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra2_count0_i <= u0_m0_wo0_wi0_r0_ra2_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra2_count0_i, 8)));

    -- u0_m0_wo0_wi0_r0_ra2_add_0_0(ADD,17)@14
    u0_m0_wo0_wi0_r0_ra2_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra2_count0_q);
    u0_m0_wo0_wi0_r0_ra2_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra2_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra2_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra2_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_add_0_0_q <= u0_m0_wo0_wi0_r0_ra2_add_0_0_o(8 downto 0);

    -- u0_m0_wo0_wi0_r0_ra2_resize(BITSELECT,18)@15
    u0_m0_wo0_wi0_r0_ra2_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra2_add_0_0_q(6 downto 0));
    u0_m0_wo0_wi0_r0_ra2_resize_b <= u0_m0_wo0_wi0_r0_ra2_resize_in(6 downto 0);

    -- d_xIn_0_15(DELAY,82)@10
    d_xIn_0_15 : dspba_delay
    GENERIC MAP ( width => 26, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_15_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_15(DELAY,83)@10
    d_in0_m0_wi0_wo0_assign_id1_q_15 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,20)@15
    -- every=1, low=0, high=127, step=1, init=45
    u0_m0_wo0_wi0_r0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(45, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_15_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 7)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,22)@15
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_15_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra2_resize_b;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 26,
        widthad_a => 7,
        numwords_a => 128,
        width_b => 26,
        widthad_b => 7,
        numwords_b => 128,
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
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_15_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(25 downto 0);

    -- d_u0_m0_wo0_wi0_r0_memr0_q_16(DELAY,89)@15
    d_u0_m0_wo0_wi0_r0_memr0_q_16 : dspba_delay
    GENERIC MAP ( width => 26, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => d_u0_m0_wo0_wi0_r0_memr0_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_2_bs6(BITSELECT,55)@16
    u0_m0_wo0_mtree_mult1_2_bs6_in <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_16_q);
    u0_m0_wo0_mtree_mult1_2_bs6_b <= u0_m0_wo0_mtree_mult1_2_bs6_in(25 downto 17);

    -- u0_m0_wo0_ca2(COUNTER,26)@13
    -- every=1, low=0, high=85, step=1, init=0
    u0_m0_wo0_ca2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca2_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_ca2_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_ca2_i = TO_UNSIGNED(84, 7)) THEN
                    u0_m0_wo0_ca2_eq <= '1';
                ELSE
                    u0_m0_wo0_ca2_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca2_eq = '1') THEN
                    u0_m0_wo0_ca2_i <= u0_m0_wo0_ca2_i - 85;
                ELSE
                    u0_m0_wo0_ca2_i <= u0_m0_wo0_ca2_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca2_i, 7)));

    -- d_u0_m0_wo0_ca2_q_14(DELAY,90)@13
    d_u0_m0_wo0_ca2_q_14 : dspba_delay
    GENERIC MAP ( width => 7, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca2_q, xout => d_u0_m0_wo0_ca2_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm0_lutmem(DUALMEM,46)@14
    u0_m0_wo0_cm0_lutmem_aa <= d_u0_m0_wo0_ca2_q_14_q;
    u0_m0_wo0_cm0_lutmem_reset0 <= areset;
    u0_m0_wo0_cm0_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 7,
        numwords_a => 86,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_second_0002_rtl_u0_m0_wo0_cm0_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm0_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm0_lutmem_aa,
        q_a => u0_m0_wo0_cm0_lutmem_ir
    );
    u0_m0_wo0_cm0_lutmem_r <= u0_m0_wo0_cm0_lutmem_ir(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_im4(MULT,53)@16
    u0_m0_wo0_mtree_mult1_2_im4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_lutmem_r);
    u0_m0_wo0_mtree_mult1_2_im4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_bs6_b);
    u0_m0_wo0_mtree_mult1_2_im4_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_im4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 9,
        lpm_widthp => 19,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_im4_a0,
        datab => u0_m0_wo0_mtree_mult1_2_im4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_im4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_im4_s1
    );
    u0_m0_wo0_mtree_mult1_2_im4_q <= u0_m0_wo0_mtree_mult1_2_im4_s1;

    -- u0_m0_wo0_mtree_mult1_2_align_8(BITSHIFT,57)@18
    u0_m0_wo0_mtree_mult1_2_align_8_q_int <= u0_m0_wo0_mtree_mult1_2_im4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_2_align_8_q <= u0_m0_wo0_mtree_mult1_2_align_8_q_int(35 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_bs2(BITSELECT,51)@16
    u0_m0_wo0_mtree_mult1_2_bs2_in <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_16_q(16 downto 0));
    u0_m0_wo0_mtree_mult1_2_bs2_b <= u0_m0_wo0_mtree_mult1_2_bs2_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_2_bjB3(BITJOIN,52)@16
    u0_m0_wo0_mtree_mult1_2_bjB3_q <= GND_q & u0_m0_wo0_mtree_mult1_2_bs2_b;

    -- u0_m0_wo0_mtree_mult1_2_im0(MULT,49)@16
    u0_m0_wo0_mtree_mult1_2_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_2_bjB3_q);
    u0_m0_wo0_mtree_mult1_2_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_lutmem_r);
    u0_m0_wo0_mtree_mult1_2_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 10,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_2_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_im0_s1
    );
    u0_m0_wo0_mtree_mult1_2_im0_q <= u0_m0_wo0_mtree_mult1_2_im0_s1;

    -- u0_m0_wo0_mtree_mult1_2_result_add_0_0(ADD,59)@18
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 28 => u0_m0_wo0_mtree_mult1_2_im0_q(27)) & u0_m0_wo0_mtree_mult1_2_im0_q));
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => u0_m0_wo0_mtree_mult1_2_align_8_q(35)) & u0_m0_wo0_mtree_mult1_2_align_8_q));
    u0_m0_wo0_mtree_mult1_2_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_2_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_2_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_2_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_2_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_2_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_2_result_add_0_0_o(36 downto 0);

    -- u0_m0_wo0_wi0_r0_join1(BITJOIN,23)@15
    u0_m0_wo0_wi0_r0_join1_q <= u0_m0_wo0_wi0_r0_split1_b & u0_m0_wo0_wi0_r0_memr0_q;

    -- u0_m0_wo0_wi0_r0_we2_seq(SEQUENCE,19)@14
    u0_m0_wo0_wi0_r0_we2_seq: PROCESS (clk, areset)
        variable u0_m0_wo0_wi0_r0_we2_seq_c : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_we2_seq_c := "000000000";
            u0_m0_wo0_wi0_r0_we2_seq_q <= "0";
            u0_m0_wo0_wi0_r0_we2_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_14_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_we2_seq_c = "000000000") THEN
                    u0_m0_wo0_wi0_r0_we2_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_we2_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_we2_seq_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_we2_seq_c := u0_m0_wo0_wi0_r0_we2_seq_c + 85;
                ELSE
                    u0_m0_wo0_wi0_r0_we2_seq_c := u0_m0_wo0_wi0_r0_we2_seq_c - 1;
                END IF;
                u0_m0_wo0_wi0_r0_we2_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_we2_seq_c(8 downto 8));
            ELSE
                u0_m0_wo0_wi0_r0_we2_seq_q <= "0";
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa2(COUNTER,21)@15
    -- every=1, low=0, high=127, step=1, init=46
    u0_m0_wo0_wi0_r0_wa2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa2_i <= TO_UNSIGNED(46, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_wi0_r0_we2_seq_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa2_i <= u0_m0_wo0_wi0_r0_wa2_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa2_i, 7)));

    -- u0_m0_wo0_wi0_r0_memr1(DUALMEM,25)@15
    u0_m0_wo0_wi0_r0_memr1_ia <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_join1_q);
    u0_m0_wo0_wi0_r0_memr1_aa <= u0_m0_wo0_wi0_r0_wa2_q;
    u0_m0_wo0_wi0_r0_memr1_ab <= u0_m0_wo0_wi0_r0_ra2_resize_b;
    u0_m0_wo0_wi0_r0_memr1_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 52,
        widthad_a => 7,
        numwords_a => 128,
        width_b => 52,
        widthad_b => 7,
        numwords_b => 128,
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
        address_a => u0_m0_wo0_wi0_r0_memr1_aa,
        data_a => u0_m0_wo0_wi0_r0_memr1_ia,
        wren_a => u0_m0_wo0_wi0_r0_we2_seq_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr1_ab,
        q_b => u0_m0_wo0_wi0_r0_memr1_iq
    );
    u0_m0_wo0_wi0_r0_memr1_q <= u0_m0_wo0_wi0_r0_memr1_iq(51 downto 0);

    -- u0_m0_wo0_wi0_r0_split1(BITSELECT,24)@15
    u0_m0_wo0_wi0_r0_split1_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_memr1_q);
    u0_m0_wo0_wi0_r0_split1_b <= u0_m0_wo0_wi0_r0_split1_in(25 downto 0);
    u0_m0_wo0_wi0_r0_split1_c <= u0_m0_wo0_wi0_r0_split1_in(51 downto 26);

    -- u0_m0_wo0_mtree_mult1_1_bs6(BITSELECT,66)@15
    u0_m0_wo0_mtree_mult1_1_bs6_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_b);
    u0_m0_wo0_mtree_mult1_1_bs6_b <= u0_m0_wo0_mtree_mult1_1_bs6_in(25 downto 17);

    -- u0_m0_wo0_cm1_lutmem(DUALMEM,47)@13
    u0_m0_wo0_cm1_lutmem_aa <= u0_m0_wo0_ca2_q;
    u0_m0_wo0_cm1_lutmem_reset0 <= areset;
    u0_m0_wo0_cm1_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 7,
        numwords_a => 86,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_second_0002_rtl_u0_m0_wo0_cm1_lutmem.hex",
        init_file_layout => "PORT_A",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        aclr0 => u0_m0_wo0_cm1_lutmem_reset0,
        clock0 => clk,
        address_a => u0_m0_wo0_cm1_lutmem_aa,
        q_a => u0_m0_wo0_cm1_lutmem_ir
    );
    u0_m0_wo0_cm1_lutmem_r <= u0_m0_wo0_cm1_lutmem_ir(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_im4(MULT,64)@15
    u0_m0_wo0_mtree_mult1_1_im4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_lutmem_r);
    u0_m0_wo0_mtree_mult1_1_im4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bs6_b);
    u0_m0_wo0_mtree_mult1_1_im4_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 9,
        lpm_widthp => 19,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im4_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im4_s1
    );
    u0_m0_wo0_mtree_mult1_1_im4_q <= u0_m0_wo0_mtree_mult1_1_im4_s1;

    -- u0_m0_wo0_mtree_mult1_1_align_8(BITSHIFT,68)@17
    u0_m0_wo0_mtree_mult1_1_align_8_q_int <= u0_m0_wo0_mtree_mult1_1_im4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_1_align_8_q <= u0_m0_wo0_mtree_mult1_1_align_8_q_int(35 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_bs2(BITSELECT,62)@15
    u0_m0_wo0_mtree_mult1_1_bs2_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_b(16 downto 0));
    u0_m0_wo0_mtree_mult1_1_bs2_b <= u0_m0_wo0_mtree_mult1_1_bs2_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_bjB3(BITJOIN,63)@15
    u0_m0_wo0_mtree_mult1_1_bjB3_q <= GND_q & u0_m0_wo0_mtree_mult1_1_bs2_b;

    -- u0_m0_wo0_mtree_mult1_1_im0(MULT,60)@15
    u0_m0_wo0_mtree_mult1_1_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_bjB3_q);
    u0_m0_wo0_mtree_mult1_1_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_lutmem_r);
    u0_m0_wo0_mtree_mult1_1_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 10,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_1_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_im0_s1
    );
    u0_m0_wo0_mtree_mult1_1_im0_q <= u0_m0_wo0_mtree_mult1_1_im0_s1;

    -- u0_m0_wo0_mtree_mult1_1_result_add_0_0(ADD,70)@17
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 28 => u0_m0_wo0_mtree_mult1_1_im0_q(27)) & u0_m0_wo0_mtree_mult1_1_im0_q));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => u0_m0_wo0_mtree_mult1_1_align_8_q(35)) & u0_m0_wo0_mtree_mult1_1_align_8_q));
    u0_m0_wo0_mtree_mult1_1_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_1_result_add_0_0_o(36 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_bs6(BITSELECT,77)@15
    u0_m0_wo0_mtree_mult1_0_bs6_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_c);
    u0_m0_wo0_mtree_mult1_0_bs6_b <= u0_m0_wo0_mtree_mult1_0_bs6_in(25 downto 17);

    -- u0_m0_wo0_cm2_lutmem(DUALMEM,48)@13
    u0_m0_wo0_cm2_lutmem_aa <= u0_m0_wo0_ca2_q;
    u0_m0_wo0_cm2_lutmem_reset0 <= areset;
    u0_m0_wo0_cm2_lutmem_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "ROM",
        width_a => 10,
        widthad_a => 7,
        numwords_a => 86,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        outdata_reg_a => "CLOCK0",
        outdata_aclr_a => "CLEAR0",
        clock_enable_input_a => "NORMAL",
        power_up_uninitialized => "FALSE",
        init_file => "fir_second_0002_rtl_u0_m0_wo0_cm2_lutmem.hex",
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
    u0_m0_wo0_cm2_lutmem_r <= u0_m0_wo0_cm2_lutmem_ir(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_im4(MULT,75)@15
    u0_m0_wo0_mtree_mult1_0_im4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_lutmem_r);
    u0_m0_wo0_mtree_mult1_0_im4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bs6_b);
    u0_m0_wo0_mtree_mult1_0_im4_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 10,
        lpm_widthb => 9,
        lpm_widthp => 19,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im4_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im4_s1
    );
    u0_m0_wo0_mtree_mult1_0_im4_q <= u0_m0_wo0_mtree_mult1_0_im4_s1;

    -- u0_m0_wo0_mtree_mult1_0_align_8(BITSHIFT,79)@17
    u0_m0_wo0_mtree_mult1_0_align_8_q_int <= u0_m0_wo0_mtree_mult1_0_im4_q & "00000000000000000";
    u0_m0_wo0_mtree_mult1_0_align_8_q <= u0_m0_wo0_mtree_mult1_0_align_8_q_int(35 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_bs2(BITSELECT,73)@15
    u0_m0_wo0_mtree_mult1_0_bs2_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_split1_c(16 downto 0));
    u0_m0_wo0_mtree_mult1_0_bs2_b <= u0_m0_wo0_mtree_mult1_0_bs2_in(16 downto 0);

    -- u0_m0_wo0_mtree_mult1_0_bjB3(BITJOIN,74)@15
    u0_m0_wo0_mtree_mult1_0_bjB3_q <= GND_q & u0_m0_wo0_mtree_mult1_0_bs2_b;

    -- u0_m0_wo0_mtree_mult1_0_im0(MULT,71)@15
    u0_m0_wo0_mtree_mult1_0_im0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_bjB3_q);
    u0_m0_wo0_mtree_mult1_0_im0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_lutmem_r);
    u0_m0_wo0_mtree_mult1_0_im0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_im0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 18,
        lpm_widthb => 10,
        lpm_widthp => 28,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_im0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_im0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_im0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_im0_s1
    );
    u0_m0_wo0_mtree_mult1_0_im0_q <= u0_m0_wo0_mtree_mult1_0_im0_s1;

    -- u0_m0_wo0_mtree_mult1_0_result_add_0_0(ADD,81)@17
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 28 => u0_m0_wo0_mtree_mult1_0_im0_q(27)) & u0_m0_wo0_mtree_mult1_0_im0_q));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((36 downto 36 => u0_m0_wo0_mtree_mult1_0_align_8_q(35)) & u0_m0_wo0_mtree_mult1_0_align_8_q));
    u0_m0_wo0_mtree_mult1_0_result_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_0_result_add_0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_a) + SIGNED(u0_m0_wo0_mtree_mult1_0_result_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_0_result_add_0_0_q <= u0_m0_wo0_mtree_mult1_0_result_add_0_0_o(36 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,33)@18
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_0_result_add_0_0_q);
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(u0_m0_wo0_mtree_mult1_1_result_add_0_0_q);
    u0_m0_wo0_mtree_add0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(36 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,34)@19
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => u0_m0_wo0_mtree_add0_0_q(36)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((37 downto 37 => u0_m0_wo0_mtree_mult1_2_result_add_0_0_q(36)) & u0_m0_wo0_mtree_mult1_2_result_add_0_0_q));
    u0_m0_wo0_mtree_add1_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(37 downto 0);

    -- u0_m0_wo0_accum(ADD,36)@20
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((43 downto 38 => u0_m0_wo0_mtree_add1_0_q(37)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(43 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,37)@19
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "001010101";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "000000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 85;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(8 downto 8));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,38)@20
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_20_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

    -- u0_m0_wo0_oseq_gated_reg(REG,39)@20
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,44)@21
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
