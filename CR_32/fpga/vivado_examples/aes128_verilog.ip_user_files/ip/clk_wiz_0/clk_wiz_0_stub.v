// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Wed Jun 20 14:30:12 2018
// Host        : DPA310 running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/DPAWS/Documents/CHRIS/Countermeasures/CR_32/fpga/vivado_examples/aes128_verilog.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_90, clk_180, clk_270, clk_45, clk_135, clk_225, 
  clk_315, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_90,clk_180,clk_270,clk_45,clk_135,clk_225,clk_315,reset,locked,clk_in1" */;
  output clk_90;
  output clk_180;
  output clk_270;
  output clk_45;
  output clk_135;
  output clk_225;
  output clk_315;
  input reset;
  output locked;
  input clk_in1;
endmodule
