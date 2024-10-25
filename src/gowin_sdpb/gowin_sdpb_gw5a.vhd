--Copyright (C)2014-2024 Gowin Semiconductor Corporation.
--All rights reserved.
--File Title: IP file
--Tool Version: V1.9.10.02
--Part Number: GW5A-LV25MG121NC1/I0
--Device: GW5A-25
--Device Version: A
--Created Time: Fri Oct 25 20:51:48 2024

library IEEE;
use IEEE.std_logic_1164.all;

entity Gowin_SDPB is
    port (
        dout: out std_logic_vector(7 downto 0);
        clka: in std_logic;
        cea: in std_logic;
        clkb: in std_logic;
        ceb: in std_logic;
        oce: in std_logic;
        reset: in std_logic;
        ada: in std_logic_vector(15 downto 0);
        din: in std_logic_vector(7 downto 0);
        adb: in std_logic_vector(15 downto 0)
    );
end Gowin_SDPB;

architecture Behavioral of Gowin_SDPB is

    signal sdpb_inst_0_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_0_dout: std_logic_vector(0 downto 0);
    signal sdpb_inst_1_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_1_dout: std_logic_vector(0 downto 0);
    signal sdpb_inst_2_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_2_dout: std_logic_vector(0 downto 0);
    signal sdpb_inst_3_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_3_dout: std_logic_vector(0 downto 0);
    signal sdpb_inst_4_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_4_dout: std_logic_vector(1 downto 1);
    signal sdpb_inst_5_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_5_dout: std_logic_vector(1 downto 1);
    signal sdpb_inst_6_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_6_dout: std_logic_vector(1 downto 1);
    signal sdpb_inst_7_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_7_dout: std_logic_vector(1 downto 1);
    signal sdpb_inst_8_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_8_dout: std_logic_vector(2 downto 2);
    signal sdpb_inst_9_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_9_dout: std_logic_vector(2 downto 2);
    signal sdpb_inst_10_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_10_dout: std_logic_vector(2 downto 2);
    signal sdpb_inst_11_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_11_dout: std_logic_vector(2 downto 2);
    signal sdpb_inst_12_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_12_dout: std_logic_vector(3 downto 3);
    signal sdpb_inst_13_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_13_dout: std_logic_vector(3 downto 3);
    signal sdpb_inst_14_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_14_dout: std_logic_vector(3 downto 3);
    signal sdpb_inst_15_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_15_dout: std_logic_vector(3 downto 3);
    signal sdpb_inst_16_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_16_dout: std_logic_vector(4 downto 4);
    signal sdpb_inst_17_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_17_dout: std_logic_vector(4 downto 4);
    signal sdpb_inst_18_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_18_dout: std_logic_vector(4 downto 4);
    signal sdpb_inst_19_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_19_dout: std_logic_vector(4 downto 4);
    signal sdpb_inst_20_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_20_dout: std_logic_vector(5 downto 5);
    signal sdpb_inst_21_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_21_dout: std_logic_vector(5 downto 5);
    signal sdpb_inst_22_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_22_dout: std_logic_vector(5 downto 5);
    signal sdpb_inst_23_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_23_dout: std_logic_vector(5 downto 5);
    signal sdpb_inst_24_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_24_dout: std_logic_vector(6 downto 6);
    signal sdpb_inst_25_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_25_dout: std_logic_vector(6 downto 6);
    signal sdpb_inst_26_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_26_dout: std_logic_vector(6 downto 6);
    signal sdpb_inst_27_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_27_dout: std_logic_vector(6 downto 6);
    signal sdpb_inst_28_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_28_dout: std_logic_vector(7 downto 7);
    signal sdpb_inst_29_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_29_dout: std_logic_vector(7 downto 7);
    signal sdpb_inst_30_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_30_dout: std_logic_vector(7 downto 7);
    signal sdpb_inst_31_dout_w: std_logic_vector(30 downto 0);
    signal sdpb_inst_31_dout: std_logic_vector(7 downto 7);
    signal dff_q_0: std_logic;
    signal dff_q_1: std_logic;
    signal mux_o_0: std_logic;
    signal mux_o_1: std_logic;
    signal mux_o_3: std_logic;
    signal mux_o_4: std_logic;
    signal mux_o_6: std_logic;
    signal mux_o_7: std_logic;
    signal mux_o_9: std_logic;
    signal mux_o_10: std_logic;
    signal mux_o_12: std_logic;
    signal mux_o_13: std_logic;
    signal mux_o_15: std_logic;
    signal mux_o_16: std_logic;
    signal mux_o_18: std_logic;
    signal mux_o_19: std_logic;
    signal mux_o_21: std_logic;
    signal mux_o_22: std_logic;
    signal gw_gnd: std_logic;
    signal sdpb_inst_0_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_0_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_0_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_0_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_1_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_1_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_1_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_1_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_2_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_2_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_2_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_2_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_3_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_3_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_3_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_3_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_4_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_4_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_4_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_4_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_5_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_5_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_5_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_5_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_6_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_6_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_6_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_6_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_7_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_7_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_7_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_7_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_8_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_8_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_8_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_8_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_9_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_9_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_9_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_9_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_10_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_10_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_10_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_10_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_11_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_11_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_11_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_11_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_12_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_12_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_12_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_12_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_13_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_13_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_13_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_13_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_14_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_14_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_14_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_14_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_15_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_15_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_15_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_15_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_16_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_16_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_16_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_16_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_17_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_17_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_17_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_17_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_18_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_18_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_18_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_18_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_19_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_19_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_19_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_19_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_20_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_20_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_20_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_20_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_21_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_21_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_21_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_21_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_22_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_22_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_22_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_22_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_23_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_23_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_23_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_23_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_24_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_24_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_24_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_24_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_25_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_25_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_25_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_25_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_26_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_26_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_26_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_26_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_27_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_27_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_27_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_27_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_28_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_28_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_28_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_28_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_29_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_29_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_29_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_29_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_30_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_30_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_30_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_30_DO_o: std_logic_vector(31 downto 0);
    signal sdpb_inst_31_BLKSELA_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_31_BLKSELB_i: std_logic_vector(2 downto 0);
    signal sdpb_inst_31_DI_i: std_logic_vector(31 downto 0);
    signal sdpb_inst_31_DO_o: std_logic_vector(31 downto 0);

    --component declaration
    component SDPB
        generic (
            READ_MODE: in bit := '0';
            BIT_WIDTH_0: in integer :=16;
            BIT_WIDTH_1: in integer :=16;
            BLK_SEL_0: in bit_vector := "000";
            BLK_SEL_1: in bit_vector := "000";
            RESET_MODE: in string := "SYNC";
            INIT_RAM_00: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_01: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_02: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_03: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_04: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_05: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_06: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_07: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_08: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_09: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_0F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_10: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_11: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_12: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_13: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_14: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_15: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_16: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_17: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_18: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_19: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_1F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_20: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_21: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_22: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_23: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_24: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_25: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_26: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_27: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_28: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_29: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_2F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_30: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_31: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_32: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_33: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_34: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_35: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_36: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_37: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_38: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_39: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3A: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3B: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3C: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3D: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3E: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000";
            INIT_RAM_3F: in bit_vector := X"0000000000000000000000000000000000000000000000000000000000000000"
        );
        port (
            DO: out std_logic_vector(31 downto 0);
            CLKA: in std_logic;
            CEA: in std_logic;
            CLKB: in std_logic;
            CEB: in std_logic;
            OCE: in std_logic;
            RESET: in std_logic;
            BLKSELA: in std_logic_vector(2 downto 0);
            BLKSELB: in std_logic_vector(2 downto 0);
            ADA: in std_logic_vector(13 downto 0);
            DI: in std_logic_vector(31 downto 0);
            ADB: in std_logic_vector(13 downto 0)
        );
    end component;

    -- component declaration
    component DFFRE
        port (
            Q: out std_logic;
            D: in std_logic;
            CLK: in std_logic;
            CE: in std_logic;
            RESET: in std_logic
        );
    end component;

    -- component declaration
    component MUX2
        port (
            O: out std_logic;
            I0: in std_logic;
            I1: in std_logic;
            S0: in std_logic
        );
    end component;

begin
    gw_gnd <= '0';

    sdpb_inst_0_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_0_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_0_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(0);
    sdpb_inst_0_dout(0) <= sdpb_inst_0_DO_o(0);
    sdpb_inst_0_dout_w(30 downto 0) <= sdpb_inst_0_DO_o(31 downto 1) ;
    sdpb_inst_1_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_1_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_1_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(0);
    sdpb_inst_1_dout(0) <= sdpb_inst_1_DO_o(0);
    sdpb_inst_1_dout_w(30 downto 0) <= sdpb_inst_1_DO_o(31 downto 1) ;
    sdpb_inst_2_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_2_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_2_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(0);
    sdpb_inst_2_dout(0) <= sdpb_inst_2_DO_o(0);
    sdpb_inst_2_dout_w(30 downto 0) <= sdpb_inst_2_DO_o(31 downto 1) ;
    sdpb_inst_3_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_3_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_3_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(0);
    sdpb_inst_3_dout(0) <= sdpb_inst_3_DO_o(0);
    sdpb_inst_3_dout_w(30 downto 0) <= sdpb_inst_3_DO_o(31 downto 1) ;
    sdpb_inst_4_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_4_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_4_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(1);
    sdpb_inst_4_dout(1) <= sdpb_inst_4_DO_o(0);
    sdpb_inst_4_dout_w(30 downto 0) <= sdpb_inst_4_DO_o(31 downto 1) ;
    sdpb_inst_5_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_5_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_5_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(1);
    sdpb_inst_5_dout(1) <= sdpb_inst_5_DO_o(0);
    sdpb_inst_5_dout_w(30 downto 0) <= sdpb_inst_5_DO_o(31 downto 1) ;
    sdpb_inst_6_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_6_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_6_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(1);
    sdpb_inst_6_dout(1) <= sdpb_inst_6_DO_o(0);
    sdpb_inst_6_dout_w(30 downto 0) <= sdpb_inst_6_DO_o(31 downto 1) ;
    sdpb_inst_7_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_7_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_7_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(1);
    sdpb_inst_7_dout(1) <= sdpb_inst_7_DO_o(0);
    sdpb_inst_7_dout_w(30 downto 0) <= sdpb_inst_7_DO_o(31 downto 1) ;
    sdpb_inst_8_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_8_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_8_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(2);
    sdpb_inst_8_dout(2) <= sdpb_inst_8_DO_o(0);
    sdpb_inst_8_dout_w(30 downto 0) <= sdpb_inst_8_DO_o(31 downto 1) ;
    sdpb_inst_9_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_9_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_9_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(2);
    sdpb_inst_9_dout(2) <= sdpb_inst_9_DO_o(0);
    sdpb_inst_9_dout_w(30 downto 0) <= sdpb_inst_9_DO_o(31 downto 1) ;
    sdpb_inst_10_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_10_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_10_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(2);
    sdpb_inst_10_dout(2) <= sdpb_inst_10_DO_o(0);
    sdpb_inst_10_dout_w(30 downto 0) <= sdpb_inst_10_DO_o(31 downto 1) ;
    sdpb_inst_11_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_11_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_11_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(2);
    sdpb_inst_11_dout(2) <= sdpb_inst_11_DO_o(0);
    sdpb_inst_11_dout_w(30 downto 0) <= sdpb_inst_11_DO_o(31 downto 1) ;
    sdpb_inst_12_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_12_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_12_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(3);
    sdpb_inst_12_dout(3) <= sdpb_inst_12_DO_o(0);
    sdpb_inst_12_dout_w(30 downto 0) <= sdpb_inst_12_DO_o(31 downto 1) ;
    sdpb_inst_13_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_13_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_13_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(3);
    sdpb_inst_13_dout(3) <= sdpb_inst_13_DO_o(0);
    sdpb_inst_13_dout_w(30 downto 0) <= sdpb_inst_13_DO_o(31 downto 1) ;
    sdpb_inst_14_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_14_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_14_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(3);
    sdpb_inst_14_dout(3) <= sdpb_inst_14_DO_o(0);
    sdpb_inst_14_dout_w(30 downto 0) <= sdpb_inst_14_DO_o(31 downto 1) ;
    sdpb_inst_15_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_15_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_15_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(3);
    sdpb_inst_15_dout(3) <= sdpb_inst_15_DO_o(0);
    sdpb_inst_15_dout_w(30 downto 0) <= sdpb_inst_15_DO_o(31 downto 1) ;
    sdpb_inst_16_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_16_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_16_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(4);
    sdpb_inst_16_dout(4) <= sdpb_inst_16_DO_o(0);
    sdpb_inst_16_dout_w(30 downto 0) <= sdpb_inst_16_DO_o(31 downto 1) ;
    sdpb_inst_17_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_17_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_17_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(4);
    sdpb_inst_17_dout(4) <= sdpb_inst_17_DO_o(0);
    sdpb_inst_17_dout_w(30 downto 0) <= sdpb_inst_17_DO_o(31 downto 1) ;
    sdpb_inst_18_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_18_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_18_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(4);
    sdpb_inst_18_dout(4) <= sdpb_inst_18_DO_o(0);
    sdpb_inst_18_dout_w(30 downto 0) <= sdpb_inst_18_DO_o(31 downto 1) ;
    sdpb_inst_19_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_19_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_19_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(4);
    sdpb_inst_19_dout(4) <= sdpb_inst_19_DO_o(0);
    sdpb_inst_19_dout_w(30 downto 0) <= sdpb_inst_19_DO_o(31 downto 1) ;
    sdpb_inst_20_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_20_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_20_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(5);
    sdpb_inst_20_dout(5) <= sdpb_inst_20_DO_o(0);
    sdpb_inst_20_dout_w(30 downto 0) <= sdpb_inst_20_DO_o(31 downto 1) ;
    sdpb_inst_21_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_21_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_21_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(5);
    sdpb_inst_21_dout(5) <= sdpb_inst_21_DO_o(0);
    sdpb_inst_21_dout_w(30 downto 0) <= sdpb_inst_21_DO_o(31 downto 1) ;
    sdpb_inst_22_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_22_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_22_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(5);
    sdpb_inst_22_dout(5) <= sdpb_inst_22_DO_o(0);
    sdpb_inst_22_dout_w(30 downto 0) <= sdpb_inst_22_DO_o(31 downto 1) ;
    sdpb_inst_23_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_23_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_23_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(5);
    sdpb_inst_23_dout(5) <= sdpb_inst_23_DO_o(0);
    sdpb_inst_23_dout_w(30 downto 0) <= sdpb_inst_23_DO_o(31 downto 1) ;
    sdpb_inst_24_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_24_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_24_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(6);
    sdpb_inst_24_dout(6) <= sdpb_inst_24_DO_o(0);
    sdpb_inst_24_dout_w(30 downto 0) <= sdpb_inst_24_DO_o(31 downto 1) ;
    sdpb_inst_25_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_25_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_25_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(6);
    sdpb_inst_25_dout(6) <= sdpb_inst_25_DO_o(0);
    sdpb_inst_25_dout_w(30 downto 0) <= sdpb_inst_25_DO_o(31 downto 1) ;
    sdpb_inst_26_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_26_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_26_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(6);
    sdpb_inst_26_dout(6) <= sdpb_inst_26_DO_o(0);
    sdpb_inst_26_dout_w(30 downto 0) <= sdpb_inst_26_DO_o(31 downto 1) ;
    sdpb_inst_27_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_27_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_27_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(6);
    sdpb_inst_27_dout(6) <= sdpb_inst_27_DO_o(0);
    sdpb_inst_27_dout_w(30 downto 0) <= sdpb_inst_27_DO_o(31 downto 1) ;
    sdpb_inst_28_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_28_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_28_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(7);
    sdpb_inst_28_dout(7) <= sdpb_inst_28_DO_o(0);
    sdpb_inst_28_dout_w(30 downto 0) <= sdpb_inst_28_DO_o(31 downto 1) ;
    sdpb_inst_29_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_29_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_29_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(7);
    sdpb_inst_29_dout(7) <= sdpb_inst_29_DO_o(0);
    sdpb_inst_29_dout_w(30 downto 0) <= sdpb_inst_29_DO_o(31 downto 1) ;
    sdpb_inst_30_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_30_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_30_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(7);
    sdpb_inst_30_dout(7) <= sdpb_inst_30_DO_o(0);
    sdpb_inst_30_dout_w(30 downto 0) <= sdpb_inst_30_DO_o(31 downto 1) ;
    sdpb_inst_31_BLKSELA_i <= gw_gnd & ada(15) & ada(14);
    sdpb_inst_31_BLKSELB_i <= gw_gnd & adb(15) & adb(14);
    sdpb_inst_31_DI_i <= gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & gw_gnd & din(7);
    sdpb_inst_31_dout(7) <= sdpb_inst_31_DO_o(0);
    sdpb_inst_31_dout_w(30 downto 0) <= sdpb_inst_31_DO_o(31 downto 1) ;

    sdpb_inst_0: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"6F7FD205202807404523D0CD5D8ADB9E30739257F098C151D008AC904A555400",
            INIT_RAM_01 => X"8A44429110AA04196D01166D4EDFFB6E7D6CABFE6DAA52DBA86DB6EFB40DA05B",
            INIT_RAM_02 => X"FA9619B20DCBE400A9158721E48998FCDBDF841CC952EC0EA5DD9DF0A828A282",
            INIT_RAM_03 => X"000F18DF7883BAA109BEEEE2DC38B702FB974E0BBB2F9DDC29C39E18F6581E1F",
            INIT_RAM_04 => X"0561940E01F78C6DA80F8EBED7403A7D7475AA1568F35755A424B1927704E047",
            INIT_RAM_05 => X"0003F314F316B1005B93CA6154A23F4D5D51354B00D5D5690ED0B4189E00F047",
            INIT_RAM_06 => X"F131E2B7C4C0CFFCC3831E03F30E68C79DBAF7CFBA1999D3ABA203AF77758289",
            INIT_RAM_07 => X"D30E163C21D30E28C78CABB17DF620EB17462E087B50BF9B89870DC6C29CAFCD",
            INIT_RAM_08 => X"4108461832A8020DA463756B8413D24048A1174438108769D0ECD8F34E8D833D",
            INIT_RAM_09 => X"7B0320FC6FBBC5C1EF7814FC1AEBABAC2BABAE70CCBAFAC590294A341B6D519A",
            INIT_RAM_0A => X"2D62D60A2EB7089558C022E11C1AF5B16F599816199980A70A0A68C5AC4D42F4",
            INIT_RAM_0B => X"07DC022A800899E0258380967002458201D2C02087209B780250200800202727",
            INIT_RAM_0C => X"003C04040400080061A40180C020E10C88830088800200C02430C5FD20F1DC04",
            INIT_RAM_0D => X"FF80000000D1D1D100D100D100D1000000D1008100001000F7800DBC0126D000",
            INIT_RAM_0E => X"000000000000000000000000000000000000000002B400A5A5A5AA3FFFFFFE00",
            INIT_RAM_0F => X"000B552401F000F8007C0E000E000003801C0000000000000100000000000000"
        )
        port map (
            DO => sdpb_inst_0_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_0_BLKSELA_i,
            BLKSELB => sdpb_inst_0_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_0_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_1: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_1_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_1_BLKSELA_i,
            BLKSELB => sdpb_inst_1_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_1_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_2: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_2_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_2_BLKSELA_i,
            BLKSELB => sdpb_inst_2_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_2_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_3: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_3_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_3_BLKSELA_i,
            BLKSELB => sdpb_inst_3_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_3_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_4: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"92A886840D2A6226022A8222086521616180508A232625000111046345A294D4",
            INIT_RAM_01 => X"5164041811157742029D9446222A2495824540A00898AD255288494549281210",
            INIT_RAM_02 => X"044DC8A0E8A606A1291D70B55400114092D5A3E0A070AA8AE145011107111064",
            INIT_RAM_03 => X"000AB0228A0D0142020010DD1B9054F8022A29E154100813853814C8288840D5",
            INIT_RAM_04 => X"00C92580B8157A5910057450A22810AAA12951E880822AA11049690DAA5C0A40",
            INIT_RAM_05 => X"001A2A8A80D1553FA14C949D10058148AA80CA85458AA8411080546301480200",
            INIT_RAM_06 => X"A0800C22800108AA00181086A800C204301222911071328D050D5500022808A2",
            INIT_RAM_07 => X"A814F0290EA81492052051480A020E000000040380841551500818A804830AA8",
            INIT_RAM_08 => X"C0C7100296FA0A0213168CC29900049FC5154AA853A102D2A55500A695500E2A",
            INIT_RAM_09 => X"B6795DAA54445216DA37C1AB314514019405450028501458C04491E890453D50",
            INIT_RAM_0A => X"2DF2002692F5150236BCDD46C6944346B2800EB4C1016845CB0A243455BAA446",
            INIT_RAM_0B => X"0817018CAC2A301B0FA260B10F02E1440B0000386942392000E4400200192DAA",
            INIT_RAM_0C => X"380002233000287408094C0323E0C440110203550CFE77C20020C6E280524205",
            INIT_RAM_0D => X"FFC0000000B0B0B000B000B000B0000000B000400000098604E050A18468C805",
            INIT_RAM_0E => X"30C30FFFFFFFF9B38D8C2C20677803B8DD1BA37007215466C3C3443BBBBBFC00",
            INIT_RAM_0F => X"001366140FFE07FF03FF83381800F806003001F000000000C6AF917AA3107FFF"
        )
        port map (
            DO => sdpb_inst_4_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_4_BLKSELA_i,
            BLKSELB => sdpb_inst_4_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_4_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_5: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_5_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_5_BLKSELA_i,
            BLKSELB => sdpb_inst_5_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_5_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_6: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_6_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_6_BLKSELA_i,
            BLKSELB => sdpb_inst_6_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_6_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_7: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_7_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_7_BLKSELA_i,
            BLKSELB => sdpb_inst_7_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_7_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_8: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"E79646330C446524039AB094CBE7C98D1B5326CFB11464763D657D918A550000",
            INIT_RAM_01 => X"C976321C9C996711011F445874F99F363234A45AC69A17CDB264F3728C449889",
            INIT_RAM_02 => X"BDD4108AEB6AE674815983BD03150558880C2C18A1650088CA045173E73C8666",
            INIT_RAM_03 => X"00060DD951827EBBC88E7AE5945C2700A3878A03D94B1FD449C4C380C2C8D55C",
            INIT_RAM_04 => X"05C51E0B4BEADD4CF42AABAEF1A32ED730D5DC17A14333B8C5A4F5177EA4B48F",
            INIT_RAM_05 => X"001D1B2411629E007BD1FFF26E861E2CCEE7351C48CCEE356D4BC4B41790B48F",
            INIT_RAM_06 => X"10842490421101661098420598424810903C185EE82EEA609CC22CC55D3EFF11",
            INIT_RAM_07 => X"9846708C8D984618118069383CD80023B7073C800B902CC8C421146210852464",
            INIT_RAM_08 => X"5188871AC33F754EF4FBF1D80563B04000C636611B84035992CC4232CCC02CAD",
            INIT_RAM_09 => X"BA8160527DAA8D1BE9F8045508DB367063267C6088F76A04902088281D5B3156",
            INIT_RAM_0A => X"2DF0DF01B0490994588267D78656F561CE4A2C9594056575B360E658A06F67C2",
            INIT_RAM_0B => X"01250280A4063000396200E09903F3000E3088285304F96883D0420E00293E33",
            INIT_RAM_0C => X"003E0A63700371F48061544D2BC006F33700015D8FFD7F012C003EE000027107",
            INIT_RAM_0D => X"FFE0B10088B188B1B1B1B10000B100B1000000810000108E20A051B08DC44103",
            INIT_RAM_0E => X"38E3894A52C6024F923CD1E69F3FE6F936A7F4FA031D2ABD0000BE905050F800",
            INIT_RAM_0F => X"00176D501BBE0DDF06EF9778FFE7FC3FE9FF0FFE0022ABBF98D075A2AB500000"
        )
        port map (
            DO => sdpb_inst_8_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_8_BLKSELA_i,
            BLKSELB => sdpb_inst_8_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_8_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_9: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_9_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_9_BLKSELA_i,
            BLKSELB => sdpb_inst_9_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_9_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_10: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_10_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_10_BLKSELA_i,
            BLKSELB => sdpb_inst_10_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_10_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_11: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_11_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_11_BLKSELA_i,
            BLKSELB => sdpb_inst_11_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_11_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_12: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"1843B031206002E06C8BEA1B9EA036624A0AE59A6C000240900DC410C10065F3",
            INIT_RAM_01 => X"520194C06533404AC6D01774182CC0C9890C0D0E8102C0321E030C88206180C2",
            INIT_RAM_02 => X"475BC9B22EBD8C4122157E29A0C888B0F5528BF0CA53462CA6888CD158052490",
            INIT_RAM_03 => X"000323A60885C508413085BA5FA4D7FA4C186BF86235E037E57A485039339F07",
            INIT_RAM_04 => X"10FDC7D4F8181F7B45555515A60095AA23AB55EA02BE22A99010FDCA2B3D4644",
            INIT_RAM_05 => X"0004409AC020357F2B5CADEC5507A5588AA0E8985588AA610123054728C1CE04",
            INIT_RAM_06 => X"C1999A472664EC3066498980C199A46269844D0153555489155D45500A430028",
            INIT_RAM_07 => X"E199931382E199E4627996D1412C3F9800F0038FA44882024CC4C10463929301",
            INIT_RAM_08 => X"570724429680A00297A2AD71B940C7BF8F771B862498E4A66B34CCCD330CC332",
            INIT_RAM_09 => X"EFFA5FA457504660BE2FD9AAD3719DC8099C9756EC4CD4DB81DD37F20671119C",
            INIT_RAM_0A => X"000200000EB6162BBEFCF8610D091E9629193A4709CCD19650F088880D0A0164",
            INIT_RAM_0B => X"0B5882240282294005A218B5A8C2208083620022682C28486214408A004107C3",
            INIT_RAM_0C => X"30000A23306229F60C097C872BF0DC719DC313554FFF7FC20030C108205A9041",
            INIT_RAM_0D => X"FFF0D00089D089D0D0D0D00000D000D000000040F8004080B6B4041479648824",
            INIT_RAM_0E => X"00000739CEC604DFA6FD33E9BF4FE9F1B637E6EE043EAB660000BAABBEEBF000",
            INIT_RAM_0F => X"0011634499080C8406423211BBEDDF6EE377DBBE0177FFFF847F9F783FF00000"
        )
        port map (
            DO => sdpb_inst_12_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_12_BLKSELA_i,
            BLKSELB => sdpb_inst_12_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_12_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_13: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_13_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_13_BLKSELA_i,
            BLKSELB => sdpb_inst_13_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_13_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_14: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_14_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_14_BLKSELA_i,
            BLKSELB => sdpb_inst_14_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_14_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_15: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_15_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_15_BLKSELA_i,
            BLKSELB => sdpb_inst_15_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_15_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_16: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"4A2A0B1C921BB839986C0C6200189110AC06C9000CC112081282060100002683",
            INIT_RAM_01 => X"30CC4C731350DD8612C40880090AA24445C740A938EF289147B82445163A6430",
            INIT_RAM_02 => X"055006441028160850F8084188226202D4913002DCE013CDC026661804D3184D",
            INIT_RAM_03 => X"000046000C040412911445A134135D0456C83E10419468B413412504852CDD04",
            INIT_RAM_04 => X"0DA64C758EB1158C4AC44513025613A446A6660A7E8C44CD2B01567A0283506A",
            INIT_RAM_05 => X"001224492C4001800E503940504404C113302053B211334BC6193B58EA0D502A",
            INIT_RAM_06 => X"AC4C5162913232A93164C5EAA4C517314251208151D551933764876280800020",
            INIT_RAM_07 => X"A4C5498AEAA4C5173142545308A360566A3CD1D8162E11352262AA9131485A98",
            INIT_RAM_08 => X"21384D97BB000A039C002200C3D082A033498893164C7216A9522628B52268CA",
            INIT_RAM_09 => X"F804A0A204506000E2382EAA9100155210041198C90000640C22480604801220",
            INIT_RAM_0A => X"2490002092681042B901A04920315C1BE08C610833220318449111100600210C",
            INIT_RAM_0B => X"1000C3C1055B021B200460C800C300138C0908380054A000C202120C001D0FFC",
            INIT_RAM_0C => X"003F05A429D158818BD3C247DCBAE2C6E8C3AB1247E53FC5D575EAAA6AC40186",
            INIT_RAM_0D => X"FFF8D1880088D1D1D1D100D1D100D10000000081E0000B850800F242E9D02186",
            INIT_RAM_0E => X"30C304A128BDC7FFBFFDFFEFFF4F89FDEF3DC79E07F8D5E70000AEAFAEBAE000",
            INIT_RAM_0F => X"A81BCA118BBA05DD02EEB77D908C87643B21D908015554403200000000002AAA"
        )
        port map (
            DO => sdpb_inst_16_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_16_BLKSELA_i,
            BLKSELB => sdpb_inst_16_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_16_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_17: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_17_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_17_BLKSELA_i,
            BLKSELB => sdpb_inst_17_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_17_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_18: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_18_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_18_BLKSELA_i,
            BLKSELB => sdpb_inst_18_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_18_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_19: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_19_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_19_BLKSELA_i,
            BLKSELB => sdpb_inst_19_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_19_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_20: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"80471122AA44104681905CC10501020F1113821454514382902A221460007C25",
            INIT_RAM_01 => X"AB082BCA0AA2009575F0A0AA9064D40838A88D1D451515022D754088285500AE",
            INIT_RAM_02 => X"075A111141ADE0CA46AB07AC2288083C7DF3F81A18AB518056A266F38A8AA888",
            INIT_RAM_03 => X"00100C0608ECC31DEA0823F29E2BA7868D546F0A62A8C47E29E2AA431B1896A6",
            INIT_RAM_04 => X"32BECD83387437A50D87E79B04441BB447B6672C6C9444CC22085EFC03D832C1",
            INIT_RAM_05 => X"001811141518203F0E5939D88081A30113340A4362113309849C365B07503281",
            INIT_RAM_06 => X"544EBA89533D61343AD4EB14D0EBA93AEE39417402401D9A2676466820410A64",
            INIT_RAM_07 => X"D0EB29D614D0EBA93AEE24B2410570B44448825C2C52A6808275D0433BE6A142",
            INIT_RAM_08 => X"CBB07706B0502012960420AD83D4C3C46B691353AD0ED9A85868275D46867584",
            INIT_RAM_09 => X"BD86B2E686004444F73C34BEB3288CC8999D92309E1980C3F69B6614A7888A2A",
            INIT_RAM_0A => X"1A424912590520513D41B221018216B05B9680641322182044DD41460C302934",
            INIT_RAM_0B => X"0000A4800408000FD00039A00104800214000668004500004500011A001AC000",
            INIT_RAM_0C => X"200001AC39F1DEC1C8D1C6075DDAE64664C1A8D0CEE73BCCD36DEE8A2AC0004A",
            INIT_RAM_0D => X"FFFCB0890089B0B0B0B000B0B000B00000000040B8000060002C000077C0001D",
            INIT_RAM_0E => X"004201884384C6FFB7FDBFEDFF37C7FCBF9612F00004FF180000BABBEFBEC000",
            INIT_RAM_0F => X"A81D739E6000080000801FFCBBC5DC2EF9770BBA015554400045DFB878101999"
        )
        port map (
            DO => sdpb_inst_20_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_20_BLKSELA_i,
            BLKSELB => sdpb_inst_20_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_20_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_21: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_21_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_21_BLKSELA_i,
            BLKSELB => sdpb_inst_21_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_21_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_22: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_22_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_22_BLKSELA_i,
            BLKSELB => sdpb_inst_22_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_22_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_23: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_23_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_23_BLKSELA_i,
            BLKSELB => sdpb_inst_23_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_23_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_24: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"802A0D0C980BEC3E44A52A5282DD207C6706E59A654516481280C28001002743",
            INIT_RAM_01 => X"34E7CC399311774632980A902122A401F6C340A818316D00619840051A187430",
            INIT_RAM_02 => X"5561C66316B0A4635E31723D4022B29288C19FF6A8C0968981288E5906730867",
            INIT_RAM_03 => X"001305080C40041AD11456C939924E784A481CE14494AAD99399250394080515",
            INIT_RAM_04 => X"308C8BF576A8112810F3134800AF48108910000087108800578044A002FF5E2A",
            INIT_RAM_05 => X"001E2048600001BF0C4431A800518462200000843F220014E52A57B76BCD5E6A",
            INIT_RAM_06 => X"A55CC322957646897325CC1AA5CC317308D528A0012002244008801000000000",
            INIT_RAM_07 => X"25CCCB991AA5CC317308D45A00014EC33A467253B26715312AE668957238CA98",
            INIT_RAM_08 => X"4FB0ADC756102A0A50A2A314DB22A05B885B8A97325C8E32AF52AE61952AE91A",
            INIT_RAM_09 => X"207C4C020400600280A3EF1080144007444040D00A110152339EA60814B002A4",
            INIT_RAM_0A => X"1A43ED04C9092540313CC843A92818140A81124AAABB939A71F0150007002412",
            INIT_RAM_0B => X"0001208002420000080000C000E300040C0002080020A0000280010400000000",
            INIT_RAM_0C => X"003F85042910004103D2800558AA22C2ACC2A81047C63F05D5752D754A000306",
            INIT_RAM_0D => X"FFFE000000B1B1B1B100B100B1000000B10000813F0000080010300001000066",
            INIT_RAM_0E => X"004200042121C04002001000801DCF001903206007FDFFFF0000EABEAFEA8000",
            INIT_RAM_0F => X"A800839E1C001F8001FF840081C200200080020001DFD7C1FFD6288846100787"
        )
        port map (
            DO => sdpb_inst_24_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_24_BLKSELA_i,
            BLKSELB => sdpb_inst_24_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_24_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_25: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_25_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_25_BLKSELA_i,
            BLKSELB => sdpb_inst_25_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_25_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_26: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_26_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_26_BLKSELA_i,
            BLKSELB => sdpb_inst_26_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_26_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_27: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_27_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_27_BLKSELA_i,
            BLKSELB => sdpb_inst_27_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_27_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_28: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "000",
            BLK_SEL_1 => "000",
            INIT_RAM_00 => X"A57B5C44B88BFD7F57A53DEDE3DF4A9AB7F787CF377DDF6CFA4AFBB5AA5576F6",
            INIT_RAM_01 => X"B2EFECBBFB3A6EB65392AA9AE5F7BD2A6ECBE9EC59757F4AE9D9D2AF3A997533",
            INIT_RAM_02 => X"FFD83775D7ECEEEF563B833DE4AABA9AF0D99C1ACAEAD4ADD5AAAA6DAEFB6AEF",
            INIT_RAM_03 => X"000E5C5D5DAEAEBBDBDF7EF1BE1A6F81EB4DDF07EA9EBFDE1BE1A7E5DE5BDEBF",
            INIT_RAM_04 => X"15BE9DFFBFE2B7AEB8FFFFFE55C7FEFDDDFCEF1DEFD9DDDCF7B4DEBD579BF22F",
            INIT_RAM_05 => X"0013314D716AABFF5EDB7BFAABD3AF77777115CF7F77773DEE78F7F37E45F22F",
            INIT_RAM_06 => X"B558E9B2D56757ED63B58E5F358E9963A3F938CAAB6ABFFEEEF6AEF555555575",
            INIT_RAM_07 => X"B58EEB1D5F358E9963A3FC7B755570E33F06785C3B323DB9AAC77CD5625E6EDC",
            INIT_RAM_08 => X"EFB8EFD6F77FFFDEF6F7FB98E377F7840DC9BED63B58979BB9DAAC74DDAACD5F",
            INIT_RAM_09 => X"EC04F2F62EAAED5FB3EC2FEEBB9EEEEAEEEEFAF6DDEEFFDD5BE2F80CBEBEEAA6",
            INIT_RAM_0A => X"2490000012660B7D7D01F7A7AEAFF677DFD55FABAAAAEAEBE3985DDAAF7567B6",
            INIT_RAM_0B => X"0000030000880000200000400000800006000010000800002000008400001000",
            INIT_RAM_0C => X"0000050C2941040043D38045D4BAC682E803AB0205453FC55555C00020C00007",
            INIT_RAM_0D => X"0000000000D0D0D0D000D000D0000000D0000040CF0004000000500000C00001",
            INIT_RAM_0E => X"004200842121C00000000000000000000000000007FDFFFF0000AABFFAAA0000",
            INIT_RAM_0F => X"A81FFC600380007800000FFDFF87FE7FE1FF87FE008A8380007DDF77F9F07F80"
        )
        port map (
            DO => sdpb_inst_28_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_28_BLKSELA_i,
            BLKSELB => sdpb_inst_28_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_28_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_29: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "001",
            BLK_SEL_1 => "001"
        )
        port map (
            DO => sdpb_inst_29_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_29_BLKSELA_i,
            BLKSELB => sdpb_inst_29_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_29_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_30: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "010",
            BLK_SEL_1 => "010"
        )
        port map (
            DO => sdpb_inst_30_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_30_BLKSELA_i,
            BLKSELB => sdpb_inst_30_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_30_DI_i,
            ADB => adb(13 downto 0)
        );

    sdpb_inst_31: SDPB
        generic map (
            READ_MODE => '0',
            BIT_WIDTH_0 => 1,
            BIT_WIDTH_1 => 1,
            RESET_MODE => "SYNC",
            BLK_SEL_0 => "011",
            BLK_SEL_1 => "011"
        )
        port map (
            DO => sdpb_inst_31_DO_o,
            CLKA => clka,
            CEA => cea,
            CLKB => clkb,
            CEB => ceb,
            OCE => oce,
            RESET => reset,
            BLKSELA => sdpb_inst_31_BLKSELA_i,
            BLKSELB => sdpb_inst_31_BLKSELB_i,
            ADA => ada(13 downto 0),
            DI => sdpb_inst_31_DI_i,
            ADB => adb(13 downto 0)
        );

    dff_inst_0: DFFRE
        port map (
            Q => dff_q_0,
            D => adb(15),
            CLK => clkb,
            CE => ceb,
            RESET => gw_gnd
        );

    dff_inst_1: DFFRE
        port map (
            Q => dff_q_1,
            D => adb(14),
            CLK => clkb,
            CE => ceb,
            RESET => gw_gnd
        );

    mux_inst_0: MUX2
        port map (
            O => mux_o_0,
            I0 => sdpb_inst_0_dout(0),
            I1 => sdpb_inst_1_dout(0),
            S0 => dff_q_1
        );

    mux_inst_1: MUX2
        port map (
            O => mux_o_1,
            I0 => sdpb_inst_2_dout(0),
            I1 => sdpb_inst_3_dout(0),
            S0 => dff_q_1
        );

    mux_inst_2: MUX2
        port map (
            O => dout(0),
            I0 => mux_o_0,
            I1 => mux_o_1,
            S0 => dff_q_0
        );

    mux_inst_3: MUX2
        port map (
            O => mux_o_3,
            I0 => sdpb_inst_4_dout(1),
            I1 => sdpb_inst_5_dout(1),
            S0 => dff_q_1
        );

    mux_inst_4: MUX2
        port map (
            O => mux_o_4,
            I0 => sdpb_inst_6_dout(1),
            I1 => sdpb_inst_7_dout(1),
            S0 => dff_q_1
        );

    mux_inst_5: MUX2
        port map (
            O => dout(1),
            I0 => mux_o_3,
            I1 => mux_o_4,
            S0 => dff_q_0
        );

    mux_inst_6: MUX2
        port map (
            O => mux_o_6,
            I0 => sdpb_inst_8_dout(2),
            I1 => sdpb_inst_9_dout(2),
            S0 => dff_q_1
        );

    mux_inst_7: MUX2
        port map (
            O => mux_o_7,
            I0 => sdpb_inst_10_dout(2),
            I1 => sdpb_inst_11_dout(2),
            S0 => dff_q_1
        );

    mux_inst_8: MUX2
        port map (
            O => dout(2),
            I0 => mux_o_6,
            I1 => mux_o_7,
            S0 => dff_q_0
        );

    mux_inst_9: MUX2
        port map (
            O => mux_o_9,
            I0 => sdpb_inst_12_dout(3),
            I1 => sdpb_inst_13_dout(3),
            S0 => dff_q_1
        );

    mux_inst_10: MUX2
        port map (
            O => mux_o_10,
            I0 => sdpb_inst_14_dout(3),
            I1 => sdpb_inst_15_dout(3),
            S0 => dff_q_1
        );

    mux_inst_11: MUX2
        port map (
            O => dout(3),
            I0 => mux_o_9,
            I1 => mux_o_10,
            S0 => dff_q_0
        );

    mux_inst_12: MUX2
        port map (
            O => mux_o_12,
            I0 => sdpb_inst_16_dout(4),
            I1 => sdpb_inst_17_dout(4),
            S0 => dff_q_1
        );

    mux_inst_13: MUX2
        port map (
            O => mux_o_13,
            I0 => sdpb_inst_18_dout(4),
            I1 => sdpb_inst_19_dout(4),
            S0 => dff_q_1
        );

    mux_inst_14: MUX2
        port map (
            O => dout(4),
            I0 => mux_o_12,
            I1 => mux_o_13,
            S0 => dff_q_0
        );

    mux_inst_15: MUX2
        port map (
            O => mux_o_15,
            I0 => sdpb_inst_20_dout(5),
            I1 => sdpb_inst_21_dout(5),
            S0 => dff_q_1
        );

    mux_inst_16: MUX2
        port map (
            O => mux_o_16,
            I0 => sdpb_inst_22_dout(5),
            I1 => sdpb_inst_23_dout(5),
            S0 => dff_q_1
        );

    mux_inst_17: MUX2
        port map (
            O => dout(5),
            I0 => mux_o_15,
            I1 => mux_o_16,
            S0 => dff_q_0
        );

    mux_inst_18: MUX2
        port map (
            O => mux_o_18,
            I0 => sdpb_inst_24_dout(6),
            I1 => sdpb_inst_25_dout(6),
            S0 => dff_q_1
        );

    mux_inst_19: MUX2
        port map (
            O => mux_o_19,
            I0 => sdpb_inst_26_dout(6),
            I1 => sdpb_inst_27_dout(6),
            S0 => dff_q_1
        );

    mux_inst_20: MUX2
        port map (
            O => dout(6),
            I0 => mux_o_18,
            I1 => mux_o_19,
            S0 => dff_q_0
        );

    mux_inst_21: MUX2
        port map (
            O => mux_o_21,
            I0 => sdpb_inst_28_dout(7),
            I1 => sdpb_inst_29_dout(7),
            S0 => dff_q_1
        );

    mux_inst_22: MUX2
        port map (
            O => mux_o_22,
            I0 => sdpb_inst_30_dout(7),
            I1 => sdpb_inst_31_dout(7),
            S0 => dff_q_1
        );

    mux_inst_23: MUX2
        port map (
            O => dout(7),
            I0 => mux_o_21,
            I1 => mux_o_22,
            S0 => dff_q_0
        );

end Behavioral; --Gowin_SDPB
