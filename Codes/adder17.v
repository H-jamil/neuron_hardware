`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SIUC
// Engineer: Jamil hasibul
//
// Create Date: 11/15/2020 02:23:18 PM
// Design Name:
// Module Name: adder17
// Project Name: HandWrittenDigitRecognition
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


module adder17(
    input signed[16:0] a,
    input signed[16:0] b,
    output [17:0] s
    );
    assign s=a+b;
endmodule
