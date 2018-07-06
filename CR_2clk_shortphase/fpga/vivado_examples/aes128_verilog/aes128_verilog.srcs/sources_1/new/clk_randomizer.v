`timescale 1ns / 1ps


module clk_randomizer(
    input wire clk_in,
    output reg clk_rand
    );
    
    reg clk_out;
    wire c_15;
    wire mout_0, buf_out;
    
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
        clk_rand<=mout_0;
        clk_out<=buf_out;
    end
    
    
    
    
    clk_wiz_0 clk_wiz (
        .clk_in1(clk_in),
        .clk_15(c_15)
    );
    
    
   
    //------ Mux 0/180 phase clks ------//
    BUFGMUX_CTRL MUX_0 (
          .O(mout_0),   // 1-bit output: Clock output
          .I0(clk_in), // 1-bit input: Clock input (S=0)
          .I1(c_15), // 1-bit input: Clock input (S=1)
          .S(rand_bits[0])    // 1-bit input: Clock select
       );

      BUFG BUF (
            .O(buf_out),
            .I(clk_in)
          );
                 
endmodule
