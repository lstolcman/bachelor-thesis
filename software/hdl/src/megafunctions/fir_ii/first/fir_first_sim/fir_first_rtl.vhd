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

-- VHDL created from fir_first_rtl
-- VHDL created on Tue Apr 12 13:59:10 2016


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

entity fir_first_rtl is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(15 downto 0);  -- sfix16
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(31 downto 0);  -- sfix32
        clk : in std_logic;
        areset : in std_logic
    );
end fir_first_rtl;

architecture normal of fir_first_rtl is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_run_pre_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_16_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (5 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal d_u0_m0_wo0_wi0_r0_ra0_count0_q_13_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count0_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count0_sc : SIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra1_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_a : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_b : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_o : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_add_0_0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count0_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count0_sc : SIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra2_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_add_0_0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_count0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_count0_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra3_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra3_count0_sc : SIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_ra3_count0_sc : signal is true;
    signal u0_m0_wo0_wi0_r0_ra3_count1_lutreg_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_add_0_0_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_add_0_0_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_add_0_0_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_add_0_0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_wa1_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_wa1_i : UNSIGNED (6 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa1_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_wa2_i : UNSIGNED (7 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa2_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa3_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_wa3_i : UNSIGNED (8 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa3_i : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr1_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_aa : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_ab : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr2_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_aa : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_ab : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr3_ia : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_aa : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_ab : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_iq : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_wi0_r0_memr3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_ca1_q : STD_LOGIC_VECTOR (5 downto 0);
    signal u0_m0_wo0_ca1_i : UNSIGNED (5 downto 0);
    attribute preserve of u0_m0_wo0_ca1_i : signal is true;
    signal u0_m0_wo0_ca1_eq : std_logic;
    attribute preserve of u0_m0_wo0_ca1_eq : signal is true;
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_sym_add0_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add0_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_symSuppress_1_seq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_symSuppress_1_seq_eq : std_logic;
    signal u0_m0_wo0_sym_add1_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_i : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_sym_add1_q : STD_LOGIC_VECTOR (16 downto 0);
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
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (31 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_a : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_b : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_count1_lut_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_count1_lut_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_count1_lut_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_resize_in : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra1_resize_b : STD_LOGIC_VECTOR (6 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_resize_in : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra2_resize_b : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_resize_in : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_wi0_r0_ra3_resize_b : STD_LOGIC_VECTOR (8 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- xIn(PORTIN,2)@10

    -- u0_m0_wo0_run(ENABLEGENERATOR,9)@10
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enable_q;
    u0_m0_wo0_run: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(6 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(8 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(58, 7);
            u0_m0_wo0_run_enable_q <= "0";
            u0_m0_wo0_run_count <= "000000000";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(6) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-59);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enable_q <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(6 downto 6));
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

    -- u0_m0_wo0_compute(DELAY,11)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,64)@12
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_16(DELAY,65)@13
    d_u0_m0_wo0_compute_q_16 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,51)@16
    u0_m0_wo0_aseq: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "00000000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_16_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "00000000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 59;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_17(DELAY,66)@16
    d_u0_m0_wo0_compute_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_16_q, xout => d_u0_m0_wo0_compute_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,13)@12
    -- every=1, low=0, high=59, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 6);
            u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(58, 6)) THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i - 59;
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 6)));

    -- u0_m0_wo0_wi0_r0_ra3_count1_lut(LOOKUP,30)@12
    u0_m0_wo0_wi0_r0_ra3_count1_lut: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "000000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100111";
            WHEN "000001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100110";
            WHEN "000010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100101";
            WHEN "000011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100100";
            WHEN "000100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100011";
            WHEN "000101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100010";
            WHEN "000110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100001";
            WHEN "000111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110100000";
            WHEN "001000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011111";
            WHEN "001001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011110";
            WHEN "001010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011101";
            WHEN "001011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011100";
            WHEN "001100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011011";
            WHEN "001101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011010";
            WHEN "001110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011001";
            WHEN "001111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110011000";
            WHEN "010000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010111";
            WHEN "010001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010110";
            WHEN "010010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010101";
            WHEN "010011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010100";
            WHEN "010100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010011";
            WHEN "010101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010010";
            WHEN "010110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010001";
            WHEN "010111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110010000";
            WHEN "011000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001111";
            WHEN "011001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001110";
            WHEN "011010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001101";
            WHEN "011011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001100";
            WHEN "011100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001011";
            WHEN "011101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001010";
            WHEN "011110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001001";
            WHEN "011111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110001000";
            WHEN "100000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000111";
            WHEN "100001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000110";
            WHEN "100010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000101";
            WHEN "100011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000100";
            WHEN "100100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000011";
            WHEN "100101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000010";
            WHEN "100110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000001";
            WHEN "100111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0110000000";
            WHEN "101000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111111";
            WHEN "101001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111110";
            WHEN "101010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111101";
            WHEN "101011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111100";
            WHEN "101100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111011";
            WHEN "101101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111010";
            WHEN "101110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111001";
            WHEN "101111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101111000";
            WHEN "110000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110111";
            WHEN "110001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110110";
            WHEN "110010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110101";
            WHEN "110011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110100";
            WHEN "110100" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110011";
            WHEN "110101" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110010";
            WHEN "110110" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110001";
            WHEN "110111" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101110000";
            WHEN "111000" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101101111";
            WHEN "111001" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101101110";
            WHEN "111010" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101101101";
            WHEN "111011" => u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= "0101101100";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra3_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra3_count1_lutreg(REG,31)@12
    u0_m0_wo0_wi0_r0_ra3_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra3_count1_lutreg_q <= "0110100111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra3_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra3_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra3_count0(COUNTER,28)@12
    -- every=60, low=0, high=511, step=100, init=0
    u0_m0_wo0_wi0_r0_ra3_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra3_count0_i <= TO_UNSIGNED(0, 9);
            u0_m0_wo0_wi0_r0_ra3_count0_sc <= TO_SIGNED(58, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra3_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra3_count0_sc <= u0_m0_wo0_wi0_r0_ra3_count0_sc - (-59);
                ELSE
                    u0_m0_wo0_wi0_r0_ra3_count0_sc <= u0_m0_wo0_wi0_r0_ra3_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra3_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra3_count0_i <= u0_m0_wo0_wi0_r0_ra3_count0_i + 100;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra3_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra3_count0_i, 10)));

    -- u0_m0_wo0_wi0_r0_ra3_add_0_0(ADD,32)@12
    u0_m0_wo0_wi0_r0_ra3_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra3_count0_q);
    u0_m0_wo0_wi0_r0_ra3_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra3_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra3_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra3_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra3_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra3_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra3_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra3_add_0_0_q <= u0_m0_wo0_wi0_r0_ra3_add_0_0_o(10 downto 0);

    -- u0_m0_wo0_wi0_r0_ra3_resize(BITSELECT,33)@13
    u0_m0_wo0_wi0_r0_ra3_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra3_add_0_0_q(8 downto 0));
    u0_m0_wo0_wi0_r0_ra3_resize_b <= u0_m0_wo0_wi0_r0_ra3_resize_in(8 downto 0);

    -- d_xIn_0_13(DELAY,61)@10
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 16, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,62)@10
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa3(COUNTER,37)@13
    -- every=1, low=0, high=511, step=1, init=88
    u0_m0_wo0_wi0_r0_wa3: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa3_i <= TO_UNSIGNED(88, 9);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa3_i <= u0_m0_wo0_wi0_r0_wa3_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa3_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa3_i, 9)));

    -- u0_m0_wo0_wi0_r0_memr3(DUALMEM,41)@13
    u0_m0_wo0_wi0_r0_memr3_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr3_aa <= u0_m0_wo0_wi0_r0_wa3_q;
    u0_m0_wo0_wi0_r0_memr3_ab <= u0_m0_wo0_wi0_r0_ra3_resize_b;
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
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr3_ab,
        q_b => u0_m0_wo0_wi0_r0_memr3_iq
    );
    u0_m0_wo0_wi0_r0_memr3_q <= u0_m0_wo0_wi0_r0_memr3_iq(15 downto 0);

    -- d_u0_m0_wo0_memread_q_13(DELAY,63)@12
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_ra0_count0_q_13(DELAY,67)@12
    d_u0_m0_wo0_wi0_r0_ra0_count0_q_13 : dspba_delay
    GENERIC MAP ( width => 6, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_ra0_count0_q, xout => d_u0_m0_wo0_wi0_r0_ra0_count0_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,14)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lut: PROCESS (d_u0_m0_wo0_wi0_r0_ra0_count0_q_13_q)
    BEGIN
        -- Begin reserved scope level
        CASE (d_u0_m0_wo0_wi0_r0_ra0_count0_q_13_q) IS
            WHEN "000000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101001";
            WHEN "000001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101010";
            WHEN "000010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101011";
            WHEN "000011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101100";
            WHEN "000100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101101";
            WHEN "000101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101110";
            WHEN "000110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0101111";
            WHEN "000111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110000";
            WHEN "001000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110001";
            WHEN "001001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110010";
            WHEN "001010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110011";
            WHEN "001011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110100";
            WHEN "001100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110101";
            WHEN "001101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110110";
            WHEN "001110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0110111";
            WHEN "001111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111000";
            WHEN "010000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111001";
            WHEN "010001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111010";
            WHEN "010010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111011";
            WHEN "010011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111100";
            WHEN "010100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111101";
            WHEN "010101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111110";
            WHEN "010110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0111111";
            WHEN "010111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000000";
            WHEN "011000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000001";
            WHEN "011001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000010";
            WHEN "011010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000011";
            WHEN "011011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000100";
            WHEN "011100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000101";
            WHEN "011101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000110";
            WHEN "011110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1000111";
            WHEN "011111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001000";
            WHEN "100000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001001";
            WHEN "100001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001010";
            WHEN "100010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001011";
            WHEN "100011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001100";
            WHEN "100100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001101";
            WHEN "100101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001110";
            WHEN "100110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1001111";
            WHEN "100111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010000";
            WHEN "101000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010001";
            WHEN "101001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010010";
            WHEN "101010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010011";
            WHEN "101011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010100";
            WHEN "101100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010101";
            WHEN "101101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010110";
            WHEN "101110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1010111";
            WHEN "101111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011000";
            WHEN "110000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011001";
            WHEN "110001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011010";
            WHEN "110010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011011";
            WHEN "110011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011100";
            WHEN "110100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011101";
            WHEN "110101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011110";
            WHEN "110110" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1011111";
            WHEN "110111" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1100000";
            WHEN "111000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1100001";
            WHEN "111001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1100010";
            WHEN "111010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "1100011";
            WHEN "111011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "0000000";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,15)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= "0101001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,34)@13
    -- every=1, low=0, high=99, step=1, init=0
    u0_m0_wo0_wi0_r0_wa0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_wi0_r0_wa0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_wa0_i = TO_UNSIGNED(98, 7)) THEN
                    u0_m0_wo0_wi0_r0_wa0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_wa0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i - 99;
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 7)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,38)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 7,
        numwords_a => 100,
        width_b => 16,
        widthad_b => 7,
        numwords_b => 100,
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
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(15 downto 0);

    -- u0_m0_wo0_sym_add0(ADD,45)@13
    u0_m0_wo0_sym_add0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr0_q(15)) & u0_m0_wo0_wi0_r0_memr0_q));
    u0_m0_wo0_sym_add0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr3_q(15)) & u0_m0_wo0_wi0_r0_memr3_q));
    u0_m0_wo0_sym_add0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_sym_add0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add0_a) + SIGNED(u0_m0_wo0_sym_add0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add0_q <= u0_m0_wo0_sym_add0_o(16 downto 0);

    -- u0_m0_wo0_ca1(COUNTER,42)@13
    -- every=1, low=0, high=59, step=1, init=0
    u0_m0_wo0_ca1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca1_i <= TO_UNSIGNED(0, 6);
            u0_m0_wo0_ca1_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_13_q = "1") THEN
                IF (u0_m0_wo0_ca1_i = TO_UNSIGNED(58, 6)) THEN
                    u0_m0_wo0_ca1_eq <= '1';
                ELSE
                    u0_m0_wo0_ca1_eq <= '0';
                END IF;
                IF (u0_m0_wo0_ca1_eq = '1') THEN
                    u0_m0_wo0_ca1_i <= u0_m0_wo0_ca1_i - 59;
                ELSE
                    u0_m0_wo0_ca1_i <= u0_m0_wo0_ca1_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca1_i, 6)));

    -- u0_m0_wo0_cm0(LOOKUP,43)@13
    u0_m0_wo0_cm0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "00111100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca1_q) IS
                WHEN "000000" => u0_m0_wo0_cm0_q <= "00111100";
                WHEN "000001" => u0_m0_wo0_cm0_q <= "00111011";
                WHEN "000010" => u0_m0_wo0_cm0_q <= "00111001";
                WHEN "000011" => u0_m0_wo0_cm0_q <= "00111000";
                WHEN "000100" => u0_m0_wo0_cm0_q <= "00110110";
                WHEN "000101" => u0_m0_wo0_cm0_q <= "00110100";
                WHEN "000110" => u0_m0_wo0_cm0_q <= "00110011";
                WHEN "000111" => u0_m0_wo0_cm0_q <= "00110001";
                WHEN "001000" => u0_m0_wo0_cm0_q <= "00110000";
                WHEN "001001" => u0_m0_wo0_cm0_q <= "00101110";
                WHEN "001010" => u0_m0_wo0_cm0_q <= "00101101";
                WHEN "001011" => u0_m0_wo0_cm0_q <= "00101011";
                WHEN "001100" => u0_m0_wo0_cm0_q <= "00101010";
                WHEN "001101" => u0_m0_wo0_cm0_q <= "00101000";
                WHEN "001110" => u0_m0_wo0_cm0_q <= "00100111";
                WHEN "001111" => u0_m0_wo0_cm0_q <= "00100110";
                WHEN "010000" => u0_m0_wo0_cm0_q <= "00100100";
                WHEN "010001" => u0_m0_wo0_cm0_q <= "00100011";
                WHEN "010010" => u0_m0_wo0_cm0_q <= "00100010";
                WHEN "010011" => u0_m0_wo0_cm0_q <= "00100000";
                WHEN "010100" => u0_m0_wo0_cm0_q <= "00011111";
                WHEN "010101" => u0_m0_wo0_cm0_q <= "00011110";
                WHEN "010110" => u0_m0_wo0_cm0_q <= "00011101";
                WHEN "010111" => u0_m0_wo0_cm0_q <= "00011011";
                WHEN "011000" => u0_m0_wo0_cm0_q <= "00011010";
                WHEN "011001" => u0_m0_wo0_cm0_q <= "00011001";
                WHEN "011010" => u0_m0_wo0_cm0_q <= "00011000";
                WHEN "011011" => u0_m0_wo0_cm0_q <= "00010111";
                WHEN "011100" => u0_m0_wo0_cm0_q <= "00010110";
                WHEN "011101" => u0_m0_wo0_cm0_q <= "00010101";
                WHEN "011110" => u0_m0_wo0_cm0_q <= "00010100";
                WHEN "011111" => u0_m0_wo0_cm0_q <= "00010011";
                WHEN "100000" => u0_m0_wo0_cm0_q <= "00010010";
                WHEN "100001" => u0_m0_wo0_cm0_q <= "00010001";
                WHEN "100010" => u0_m0_wo0_cm0_q <= "00010000";
                WHEN "100011" => u0_m0_wo0_cm0_q <= "00001111";
                WHEN "100100" => u0_m0_wo0_cm0_q <= "00001110";
                WHEN "100101" => u0_m0_wo0_cm0_q <= "00001101";
                WHEN "100110" => u0_m0_wo0_cm0_q <= "00001100";
                WHEN "100111" => u0_m0_wo0_cm0_q <= "00001100";
                WHEN "101000" => u0_m0_wo0_cm0_q <= "00001011";
                WHEN "101001" => u0_m0_wo0_cm0_q <= "00001010";
                WHEN "101010" => u0_m0_wo0_cm0_q <= "00001010";
                WHEN "101011" => u0_m0_wo0_cm0_q <= "00001001";
                WHEN "101100" => u0_m0_wo0_cm0_q <= "00001000";
                WHEN "101101" => u0_m0_wo0_cm0_q <= "00001000";
                WHEN "101110" => u0_m0_wo0_cm0_q <= "00000111";
                WHEN "101111" => u0_m0_wo0_cm0_q <= "00000111";
                WHEN "110000" => u0_m0_wo0_cm0_q <= "00000110";
                WHEN "110001" => u0_m0_wo0_cm0_q <= "00000101";
                WHEN "110010" => u0_m0_wo0_cm0_q <= "00000101";
                WHEN "110011" => u0_m0_wo0_cm0_q <= "00000101";
                WHEN "110100" => u0_m0_wo0_cm0_q <= "00000100";
                WHEN "110101" => u0_m0_wo0_cm0_q <= "00000100";
                WHEN "110110" => u0_m0_wo0_cm0_q <= "00000011";
                WHEN "110111" => u0_m0_wo0_cm0_q <= "00000011";
                WHEN "111000" => u0_m0_wo0_cm0_q <= "00000011";
                WHEN "111001" => u0_m0_wo0_cm0_q <= "00000010";
                WHEN "111010" => u0_m0_wo0_cm0_q <= "00000010";
                WHEN "111011" => u0_m0_wo0_cm0_q <= "00000010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_1(MULT,48)@14
    u0_m0_wo0_mtree_mult1_1_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
    u0_m0_wo0_mtree_mult1_1_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add0_q);
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

    -- u0_m0_wo0_symSuppress_1_seq(SEQUENCE,46)@12
    u0_m0_wo0_symSuppress_1_seq: PROCESS (clk, areset)
        variable u0_m0_wo0_symSuppress_1_seq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_symSuppress_1_seq_c := "00000001";
            u0_m0_wo0_symSuppress_1_seq_q <= "0";
            u0_m0_wo0_symSuppress_1_seq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                IF (u0_m0_wo0_symSuppress_1_seq_c = "00000000") THEN
                    u0_m0_wo0_symSuppress_1_seq_eq <= '1';
                ELSE
                    u0_m0_wo0_symSuppress_1_seq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_symSuppress_1_seq_eq = '1') THEN
                    u0_m0_wo0_symSuppress_1_seq_c := u0_m0_wo0_symSuppress_1_seq_c + 59;
                ELSE
                    u0_m0_wo0_symSuppress_1_seq_c := u0_m0_wo0_symSuppress_1_seq_c - 1;
                END IF;
                u0_m0_wo0_symSuppress_1_seq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_symSuppress_1_seq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra2_count1_lut(LOOKUP,24)@12
    u0_m0_wo0_wi0_r0_ra2_count1_lut: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "000000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111111";
            WHEN "000001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111110";
            WHEN "000010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111101";
            WHEN "000011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111100";
            WHEN "000100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111011";
            WHEN "000101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111010";
            WHEN "000110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111001";
            WHEN "000111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01111000";
            WHEN "001000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110111";
            WHEN "001001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110110";
            WHEN "001010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110101";
            WHEN "001011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110100";
            WHEN "001100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110011";
            WHEN "001101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110010";
            WHEN "001110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110001";
            WHEN "001111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01110000";
            WHEN "010000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101111";
            WHEN "010001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101110";
            WHEN "010010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101101";
            WHEN "010011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101100";
            WHEN "010100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101011";
            WHEN "010101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101010";
            WHEN "010110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101001";
            WHEN "010111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01101000";
            WHEN "011000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100111";
            WHEN "011001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100110";
            WHEN "011010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100101";
            WHEN "011011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100100";
            WHEN "011100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100011";
            WHEN "011101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100010";
            WHEN "011110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100001";
            WHEN "011111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01100000";
            WHEN "100000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011111";
            WHEN "100001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011110";
            WHEN "100010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011101";
            WHEN "100011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011100";
            WHEN "100100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011011";
            WHEN "100101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011010";
            WHEN "100110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011001";
            WHEN "100111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01011000";
            WHEN "101000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010111";
            WHEN "101001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010110";
            WHEN "101010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010101";
            WHEN "101011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010100";
            WHEN "101100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010011";
            WHEN "101101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010010";
            WHEN "101110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010001";
            WHEN "101111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01010000";
            WHEN "110000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001111";
            WHEN "110001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001110";
            WHEN "110010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001101";
            WHEN "110011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001100";
            WHEN "110100" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001011";
            WHEN "110101" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001010";
            WHEN "110110" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001001";
            WHEN "110111" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01001000";
            WHEN "111000" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01000111";
            WHEN "111001" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01000110";
            WHEN "111010" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01000101";
            WHEN "111011" => u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= "01000100";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra2_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra2_count1_lutreg(REG,25)@12
    u0_m0_wo0_wi0_r0_ra2_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q <= "01111111";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra2_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra2_count0(COUNTER,22)@12
    -- every=60, low=0, high=255, step=100, init=0
    u0_m0_wo0_wi0_r0_ra2_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_count0_i <= TO_UNSIGNED(0, 8);
            u0_m0_wo0_wi0_r0_ra2_count0_sc <= TO_SIGNED(58, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra2_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra2_count0_sc <= u0_m0_wo0_wi0_r0_ra2_count0_sc - (-59);
                ELSE
                    u0_m0_wo0_wi0_r0_ra2_count0_sc <= u0_m0_wo0_wi0_r0_ra2_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra2_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra2_count0_i <= u0_m0_wo0_wi0_r0_ra2_count0_i + 100;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra2_count0_i, 9)));

    -- u0_m0_wo0_wi0_r0_ra2_add_0_0(ADD,26)@12
    u0_m0_wo0_wi0_r0_ra2_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra2_count0_q);
    u0_m0_wo0_wi0_r0_ra2_add_0_0_b <= STD_LOGIC_VECTOR("00" & u0_m0_wo0_wi0_r0_ra2_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra2_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra2_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra2_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra2_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra2_add_0_0_q <= u0_m0_wo0_wi0_r0_ra2_add_0_0_o(9 downto 0);

    -- u0_m0_wo0_wi0_r0_ra2_resize(BITSELECT,27)@13
    u0_m0_wo0_wi0_r0_ra2_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra2_add_0_0_q(7 downto 0));
    u0_m0_wo0_wi0_r0_ra2_resize_b <= u0_m0_wo0_wi0_r0_ra2_resize_in(7 downto 0);

    -- u0_m0_wo0_wi0_r0_wa2(COUNTER,36)@13
    -- every=1, low=0, high=255, step=1, init=244
    u0_m0_wo0_wi0_r0_wa2: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa2_i <= TO_UNSIGNED(244, 8);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa2_i <= u0_m0_wo0_wi0_r0_wa2_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa2_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa2_i, 8)));

    -- u0_m0_wo0_wi0_r0_memr2(DUALMEM,40)@13
    u0_m0_wo0_wi0_r0_memr2_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr2_aa <= u0_m0_wo0_wi0_r0_wa2_q;
    u0_m0_wo0_wi0_r0_memr2_ab <= u0_m0_wo0_wi0_r0_ra2_resize_b;
    u0_m0_wo0_wi0_r0_memr2_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 8,
        numwords_a => 256,
        width_b => 16,
        widthad_b => 8,
        numwords_b => 256,
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
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr2_ab,
        q_b => u0_m0_wo0_wi0_r0_memr2_iq
    );
    u0_m0_wo0_wi0_r0_memr2_q <= u0_m0_wo0_wi0_r0_memr2_iq(15 downto 0);

    -- u0_m0_wo0_wi0_r0_ra1_count1_lut(LOOKUP,18)@12
    u0_m0_wo0_wi0_r0_ra1_count1_lut: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "000000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011001";
            WHEN "000001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011010";
            WHEN "000010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011011";
            WHEN "000011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011100";
            WHEN "000100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011101";
            WHEN "000101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011110";
            WHEN "000110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00011111";
            WHEN "000111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100000";
            WHEN "001000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100001";
            WHEN "001001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100010";
            WHEN "001010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100011";
            WHEN "001011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100100";
            WHEN "001100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100101";
            WHEN "001101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100110";
            WHEN "001110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00100111";
            WHEN "001111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101000";
            WHEN "010000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101001";
            WHEN "010001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101010";
            WHEN "010010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101011";
            WHEN "010011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101100";
            WHEN "010100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101101";
            WHEN "010101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101110";
            WHEN "010110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00101111";
            WHEN "010111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110000";
            WHEN "011000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110001";
            WHEN "011001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110010";
            WHEN "011010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110011";
            WHEN "011011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110100";
            WHEN "011100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110101";
            WHEN "011101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110110";
            WHEN "011110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00110111";
            WHEN "011111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111000";
            WHEN "100000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111001";
            WHEN "100001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111010";
            WHEN "100010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111011";
            WHEN "100011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111100";
            WHEN "100100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111101";
            WHEN "100101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111110";
            WHEN "100110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "00111111";
            WHEN "100111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000000";
            WHEN "101000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000001";
            WHEN "101001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000010";
            WHEN "101010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000011";
            WHEN "101011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000100";
            WHEN "101100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000101";
            WHEN "101101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000110";
            WHEN "101110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01000111";
            WHEN "101111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001000";
            WHEN "110000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001001";
            WHEN "110001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001010";
            WHEN "110010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001011";
            WHEN "110011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001100";
            WHEN "110100" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001101";
            WHEN "110101" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001110";
            WHEN "110110" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01001111";
            WHEN "110111" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01010000";
            WHEN "111000" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01010001";
            WHEN "111001" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01010010";
            WHEN "111010" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01010011";
            WHEN "111011" => u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= "01010100";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra1_count1_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra1_count1_lutreg(REG,19)@12
    u0_m0_wo0_wi0_r0_ra1_count1_lutreg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q <= "00011001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_count1_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra1_count0(COUNTER,16)@12
    -- every=60, low=0, high=127, step=-28, init=0
    u0_m0_wo0_wi0_r0_ra1_count0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_count0_i <= TO_UNSIGNED(0, 7);
            u0_m0_wo0_wi0_r0_ra1_count0_sc <= TO_SIGNED(58, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_memread_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra1_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra1_count0_sc <= u0_m0_wo0_wi0_r0_ra1_count0_sc - (-59);
                ELSE
                    u0_m0_wo0_wi0_r0_ra1_count0_sc <= u0_m0_wo0_wi0_r0_ra1_count0_sc + (-1);
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra1_count0_sc(6) = '1') THEN
                    u0_m0_wo0_wi0_r0_ra1_count0_i <= u0_m0_wo0_wi0_r0_ra1_count0_i - 28;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra1_count0_i, 8)));

    -- u0_m0_wo0_wi0_r0_ra1_add_0_0(ADD,20)@12
    u0_m0_wo0_wi0_r0_ra1_add_0_0_a <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra1_count0_q);
    u0_m0_wo0_wi0_r0_ra1_add_0_0_b <= STD_LOGIC_VECTOR("0" & u0_m0_wo0_wi0_r0_ra1_count1_lutreg_q);
    u0_m0_wo0_wi0_r0_ra1_add_0_0: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_add_0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_wi0_r0_ra1_add_0_0_o <= STD_LOGIC_VECTOR(UNSIGNED(u0_m0_wo0_wi0_r0_ra1_add_0_0_a) + UNSIGNED(u0_m0_wo0_wi0_r0_ra1_add_0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra1_add_0_0_q <= u0_m0_wo0_wi0_r0_ra1_add_0_0_o(8 downto 0);

    -- u0_m0_wo0_wi0_r0_ra1_resize(BITSELECT,21)@13
    u0_m0_wo0_wi0_r0_ra1_resize_in <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra1_add_0_0_q(6 downto 0));
    u0_m0_wo0_wi0_r0_ra1_resize_b <= u0_m0_wo0_wi0_r0_ra1_resize_in(6 downto 0);

    -- u0_m0_wo0_wi0_r0_wa1(COUNTER,35)@13
    -- every=1, low=0, high=127, step=1, init=16
    u0_m0_wo0_wi0_r0_wa1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa1_i <= TO_UNSIGNED(16, 7);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_wa1_i <= u0_m0_wo0_wi0_r0_wa1_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa1_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa1_i, 7)));

    -- u0_m0_wo0_wi0_r0_memr1(DUALMEM,39)@13
    u0_m0_wo0_wi0_r0_memr1_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr1_aa <= u0_m0_wo0_wi0_r0_wa1_q;
    u0_m0_wo0_wi0_r0_memr1_ab <= u0_m0_wo0_wi0_r0_ra1_resize_b;
    u0_m0_wo0_wi0_r0_memr1_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 16,
        widthad_a => 7,
        numwords_a => 128,
        width_b => 16,
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
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr1_ab,
        q_b => u0_m0_wo0_wi0_r0_memr1_iq
    );
    u0_m0_wo0_wi0_r0_memr1_q <= u0_m0_wo0_wi0_r0_memr1_iq(15 downto 0);

    -- u0_m0_wo0_sym_add1(ADD,47)@13
    u0_m0_wo0_sym_add1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr1_q(15)) & u0_m0_wo0_wi0_r0_memr1_q));
    u0_m0_wo0_sym_add1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_wi0_r0_memr2_q(15)) & u0_m0_wo0_wi0_r0_memr2_q));
    u0_m0_wo0_sym_add1_i <= u0_m0_wo0_sym_add1_a;
    u0_m0_wo0_sym_add1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_sym_add1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_symSuppress_1_seq_q = "1") THEN
                u0_m0_wo0_sym_add1_o <= u0_m0_wo0_sym_add1_i;
            ELSE
                u0_m0_wo0_sym_add1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_sym_add1_a) + SIGNED(u0_m0_wo0_sym_add1_b));
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_sym_add1_q <= u0_m0_wo0_sym_add1_o(16 downto 0);

    -- u0_m0_wo0_cm1(LOOKUP,44)@13
    u0_m0_wo0_cm1: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "00000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca1_q) IS
                WHEN "000000" => u0_m0_wo0_cm1_q <= "00000000";
                WHEN "000001" => u0_m0_wo0_cm1_q <= "01111111";
                WHEN "000010" => u0_m0_wo0_cm1_q <= "01111110";
                WHEN "000011" => u0_m0_wo0_cm1_q <= "01111110";
                WHEN "000100" => u0_m0_wo0_cm1_q <= "01111110";
                WHEN "000101" => u0_m0_wo0_cm1_q <= "01111110";
                WHEN "000110" => u0_m0_wo0_cm1_q <= "01111110";
                WHEN "000111" => u0_m0_wo0_cm1_q <= "01111110";
                WHEN "001000" => u0_m0_wo0_cm1_q <= "01111101";
                WHEN "001001" => u0_m0_wo0_cm1_q <= "01111101";
                WHEN "001010" => u0_m0_wo0_cm1_q <= "01111100";
                WHEN "001011" => u0_m0_wo0_cm1_q <= "01111100";
                WHEN "001100" => u0_m0_wo0_cm1_q <= "01111011";
                WHEN "001101" => u0_m0_wo0_cm1_q <= "01111011";
                WHEN "001110" => u0_m0_wo0_cm1_q <= "01111010";
                WHEN "001111" => u0_m0_wo0_cm1_q <= "01111010";
                WHEN "010000" => u0_m0_wo0_cm1_q <= "01111001";
                WHEN "010001" => u0_m0_wo0_cm1_q <= "01111000";
                WHEN "010010" => u0_m0_wo0_cm1_q <= "01110111";
                WHEN "010011" => u0_m0_wo0_cm1_q <= "01110111";
                WHEN "010100" => u0_m0_wo0_cm1_q <= "01110110";
                WHEN "010101" => u0_m0_wo0_cm1_q <= "01110101";
                WHEN "010110" => u0_m0_wo0_cm1_q <= "01110100";
                WHEN "010111" => u0_m0_wo0_cm1_q <= "01110011";
                WHEN "011000" => u0_m0_wo0_cm1_q <= "01110010";
                WHEN "011001" => u0_m0_wo0_cm1_q <= "01110001";
                WHEN "011010" => u0_m0_wo0_cm1_q <= "01101111";
                WHEN "011011" => u0_m0_wo0_cm1_q <= "01101110";
                WHEN "011100" => u0_m0_wo0_cm1_q <= "01101101";
                WHEN "011101" => u0_m0_wo0_cm1_q <= "01101100";
                WHEN "011110" => u0_m0_wo0_cm1_q <= "01101011";
                WHEN "011111" => u0_m0_wo0_cm1_q <= "01101001";
                WHEN "100000" => u0_m0_wo0_cm1_q <= "01101000";
                WHEN "100001" => u0_m0_wo0_cm1_q <= "01100111";
                WHEN "100010" => u0_m0_wo0_cm1_q <= "01100101";
                WHEN "100011" => u0_m0_wo0_cm1_q <= "01100100";
                WHEN "100100" => u0_m0_wo0_cm1_q <= "01100010";
                WHEN "100101" => u0_m0_wo0_cm1_q <= "01100001";
                WHEN "100110" => u0_m0_wo0_cm1_q <= "01100000";
                WHEN "100111" => u0_m0_wo0_cm1_q <= "01011110";
                WHEN "101000" => u0_m0_wo0_cm1_q <= "01011101";
                WHEN "101001" => u0_m0_wo0_cm1_q <= "01011011";
                WHEN "101010" => u0_m0_wo0_cm1_q <= "01011001";
                WHEN "101011" => u0_m0_wo0_cm1_q <= "01011000";
                WHEN "101100" => u0_m0_wo0_cm1_q <= "01010110";
                WHEN "101101" => u0_m0_wo0_cm1_q <= "01010101";
                WHEN "101110" => u0_m0_wo0_cm1_q <= "01010011";
                WHEN "101111" => u0_m0_wo0_cm1_q <= "01010010";
                WHEN "110000" => u0_m0_wo0_cm1_q <= "01010000";
                WHEN "110001" => u0_m0_wo0_cm1_q <= "01001110";
                WHEN "110010" => u0_m0_wo0_cm1_q <= "01001101";
                WHEN "110011" => u0_m0_wo0_cm1_q <= "01001011";
                WHEN "110100" => u0_m0_wo0_cm1_q <= "01001001";
                WHEN "110101" => u0_m0_wo0_cm1_q <= "01001000";
                WHEN "110110" => u0_m0_wo0_cm1_q <= "01000110";
                WHEN "110111" => u0_m0_wo0_cm1_q <= "01000100";
                WHEN "111000" => u0_m0_wo0_cm1_q <= "01000011";
                WHEN "111001" => u0_m0_wo0_cm1_q <= "01000001";
                WHEN "111010" => u0_m0_wo0_cm1_q <= "01000000";
                WHEN "111011" => u0_m0_wo0_cm1_q <= "00111110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0(MULT,49)@14
    u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_sym_add1_q);
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

    -- u0_m0_wo0_mtree_add0_0(ADD,50)@16
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

    -- u0_m0_wo0_accum(ADD,52)@17
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((31 downto 26 => u0_m0_wo0_mtree_add0_0_q(25)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_17_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(31 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,53)@16
    u0_m0_wo0_oseq: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(7 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "00111011";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_16_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "00000000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 59;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(7 downto 7));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,54)@17
    u0_m0_wo0_oseq_gated_a <= u0_m0_wo0_oseq_q;
    u0_m0_wo0_oseq_gated_b <= d_u0_m0_wo0_compute_q_17_q;
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_gated_a and u0_m0_wo0_oseq_gated_b;

    -- u0_m0_wo0_oseq_gated_reg(REG,55)@17
    u0_m0_wo0_oseq_gated_reg: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,60)@18
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
