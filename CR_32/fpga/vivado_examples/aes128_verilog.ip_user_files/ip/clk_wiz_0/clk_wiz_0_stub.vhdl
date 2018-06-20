-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Wed Jun 20 14:30:12 2018
-- Host        : DPA310 running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               C:/Users/DPAWS/Documents/CHRIS/Countermeasures/CR_32/fpga/vivado_examples/aes128_verilog.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tftg256-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_90 : out STD_LOGIC;
    clk_180 : out STD_LOGIC;
    clk_270 : out STD_LOGIC;
    clk_45 : out STD_LOGIC;
    clk_135 : out STD_LOGIC;
    clk_225 : out STD_LOGIC;
    clk_315 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_90,clk_180,clk_270,clk_45,clk_135,clk_225,clk_315,reset,locked,clk_in1";
begin
end;
