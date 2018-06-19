`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
// Create Date: 05/08/2018 10:33:03 PM
// Design Name: 
// Module Name: clk_randomizer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_randomizer(
    input wire clk_in,
    output reg clk_rand
    );
    
    reg clk_out;
    wire c_90,c_180,c_270,c_45,c_135,c_225,c_315;
    wire mout_0, mout_1, mout_2, mout_3, mout_4, mout_5, mout_6, buf_out;
    wire bufhout_0, bufhout_1, bufhout_2, bufhout_3, bufhout_4, bufhout_5, bufhout_6;
    
    //------ Stuff for RNG (Linear Feedback Shift Register) ------//
    reg [7:0] rand_buf = 8'h00;
    reg [6:0] rand_bits = 7'h00;
    reg [4:0] counter = 5'h00;
        
    always @(posedge clk_in) begin
        rand_buf[7:1] <= rand_buf[6:0];
        rand_buf[0] <= ~^{rand_buf[7], rand_buf[5:3]};
        if(counter == 5'hff) begin
            rand_bits <= rand_buf[6:0];
        end
    end
    
    always @(*) begin
        clk_rand<=mout_6;
        clk_out<=buf_out;
    end
    
    
    
    
    clk_wiz_0 clk_wiz (
        .clk_in1(clk_in),
        .clk_90(c_90),
        .clk_180(c_180),
        .clk_270(c_270),
        .clk_45(c_45),
        .clk_135(c_135),
        .clk_225(c_225),
        .clk_315(c_315)
    );
    
    /****** Need to RNG ******/
    
    /****** Mux levels here we come ******/
    //------ Mux 0/90 phase clks ------//
    BUFGMUX_CTRL MUX_0 (
          .O(mout_0),   // 1-bit output: Clock output
          .I0(clk_in), // 1-bit input: Clock input (S=0)
          .I1(c_90), // 1-bit input: Clock input (S=1)
          .S(rand_bits[0])    // 1-bit input: Clock select
       );
       
    //------ Mux 180/270 phase clks ------//
    BUFGMUX_CTRL MUX_1 (
          .O(mout_1),   // 1-bit output: Clock output
          .I0(c_180), // 1-bit input: Clock input (S=0)
          .I1(c_270), // 1-bit input: Clock input (S=1)
          .S(rand_bits[1])    // 1-bit input: Clock select
        );
        
   BUFH BUFH_0 (
           .O(bufhout_0), // 1-bit output: Clock output
           .I(mout_0)  // 1-bit input: Clock input
        );
        
    BUFH BUFH_1 (
            .O(bufhout_1),
            .I(mout_1)
        );
    //------ Mux mux0/mux1 outputs (0,90,180,270) ------//
    BUFGMUX_CTRL MUX_2 (
           .O(mout_2),   // 1-bit output: Clock output
           .I0(bufhout_0), // 1-bit input: Clock input (S=0)
           .I1(bufhout_1), // 1-bit input: Clock input (S=1)
           .S(rand_bits[2])    // 1-bit input: Clock select
         );
         
     //------ Mux 45/135 phase clks ------//
     BUFGMUX_CTRL MUX_3 (
           .O(mout_3),   // 1-bit output: Clock output
           .I0(c_45), // 1-bit input: Clock input (S=0)
           .I1(c_135), // 1-bit input: Clock input (S=1)
           .S(rand_bits[3])    // 1-bit input: Clock select
         );
         
     //------ Mux 225/315 phase clks ------//
     BUFGMUX_CTRL MUX_4 (
           .O(mout_4),   // 1-bit output: Clock output
           .I0(c_225), // 1-bit input: Clock input (S=0)
           .I1(c_315), // 1-bit input: Clock input (S=1)
           .S(rand_bits[4])    // 1-bit input: Clock select
         );
    
    BUFH BUFH_3 (
            .O(bufhout_3),
            .I(mout_3)
        );
    
    BUFH BUFH_4 (
            .O(bufhout_4),
            .I(mout_4)
        );
    
    //------ Mux mux3/mux4 outputs (45,135,225,315)------//
    BUFGMUX_CTRL MUX_5 (
           .O(mout_5),   // 1-bit output: Clock output
           .I0(bufhout_3), // 1-bit input: Clock input (S=0)
           .I1(bufhout_4), // 1-bit input: Clock input (S=1)
           .S(rand_bits[5])    // 1-bit input: Clock select
         );
         
    BUFH BUFH_2 (
            .O(bufhout_2),
            .I(mout_2)
        );
         
    BUFH BUFH_5 (
            .O(bufhout_5),
            .I(mout_5)
        );
         
    //------ Final mux, mux outputs of mux2/mux5 ------//
    BUFGMUX_CTRL MUX_6 (
           .O(mout_6),   // 1-bit output: Clock output
           .I0(bufhout_2), // 1-bit input: Clock input (S=0)
           .I1(bufhout_5), // 1-bit input: Clock input (S=1)
           .S(rand_bits[6])    // 1-bit input: Clock select
         );
                 
                 
     /****** NOT SURE IF WE NEED A BUFFER OR WE CAN JUST PASS THE ORIGINAL CLK OUT
            the image from the paper shows a buffer, so I'm using one here
      ******/
      BUFG BUF (
            .O(buf_out),
            .I(clk_in)
          );
                 
endmodule
