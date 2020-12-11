`timescale 1ns / 1ps
module acc(
    input [19:0] din,
    input [7:0] b,
    input clk,
    input rst,
    output [21:0] dout);

    reg [21:0] accReg, muxout;
    reg[21:0] dout;

    wire sel,en;
    wire [21:0] b_ext,sum;

    adder22 u1(din, muxout,sum);

    acc_ctrl u2(clk,rst,sel,en);

    assign b_est = {{14{b[7]}},b}; //This is sign extension

    always @(posedge clk) begin
        if(en) begin
            dout <=sum;
        end

    end

    always @(posedge clk)
        accReg <=sum;

    always @(*) begin
        if(sel)
            muxout = b_est;
        else
            muxout = accReg;

    end
endmodule
