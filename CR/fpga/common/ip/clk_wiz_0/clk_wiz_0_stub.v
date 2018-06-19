// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Tue May  8 22:15:13 2018
// Host        : Neptune running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Chris/Documents/Umass/SecProj/side-channel-countermeasures/src/vivado/aes128_verilog/aes128_verilog.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
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
