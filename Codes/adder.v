`timescale 1ns / 1ps
module adder #(
    parameter WIDTH=16,
    parameter A_WIDTH=WIDTH,
    parameter B_WIDTH=WIDTH)
    (
    input signed[A_WIDTH-1:0] a,
    input signed[B_WIDTH-1:0] b,
    output signed[WIDTH:0] s
    );

    assign s=a+b;

endmodule
