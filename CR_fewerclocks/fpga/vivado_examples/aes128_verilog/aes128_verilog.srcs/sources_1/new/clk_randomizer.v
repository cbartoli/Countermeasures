`timescale 1ns / 1ps


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
    reg [7:0] counter = 2'b00;
        
    always @(posedge clk_in) begin
        rand_buf[7:1] <= rand_buf[6:0];
        rand_buf[0] <= ~^{rand_buf[7], rand_buf[5:3]};
        counter <= counter+2'b1;
        if(counter == 2'b11) begin
            rand_bits <= rand_buf[6:0];
        end
    end
    
    always @(*) begin
        clk_rand<=mout_2;
        clk_out<=buf_out;
    end
    
    
    
    
    clk_wiz_0 clk_wiz (
        .clk_in1(clk_in),
        .clk_90(c_90),
        .clk_180(c_180),
        .clk_270(c_270)
    );
    
    
    /****** Cascading CLK MUXs ******/
    //------ Mux 0/180 phase clks ------//
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


      BUFG BUF (
            .O(buf_out),
            .I(clk_in)
          );
                 
endmodule
