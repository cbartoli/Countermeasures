// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Jul  6 08:58:58 2018
// Host        : JUPITER running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               F:/Documents/Countermeasures/CR_2clk_shortphase/fpga/vivado_examples/aes128_verilog/aes128_verilog.runs/clk_wiz_0_synth_1/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tftg256-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_15, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_15,reset,locked,clk_in1" */;
  output clk_15;
  input reset;
  output locked;
  input clk_in1;
endmodule
