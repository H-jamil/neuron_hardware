`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SIUC
// Engineer: Jamil hasibul
//
// Create Date: 11/15/2020 02:23:18 PM
// Design Name:
// Module Name: mac1
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


module mac1(
    input clk,
    input [127:0] pixels,
    input [127:0] weights,
    output [19:0] sum
    );
    wire [255:0] p;
    wire [135:0] s1;
    wire [71:0] s2;
    wire [37:0] s3;

    //multiplier are instantiate with following code

    genvar i;
    generate
      for (i=0;i<=15;i=i+1)
        mult multName(pixels[(127-8*i):(127-8*i-7)],
                      weights[(127-8*i):(127-8*i-7)],
                      p[(255-16*i):(255-16*i-15)]);
    endgenerate

    genvar k;
    generate
      for (k=0;k<=7;k=k+1)
        adder #(16) adder16Name(p[(255-16*2*k):(255-16*2*k-15)],
                            p[(255-16*(2*k+1)):(255-16*(2*k+1)-15)],
                            s1[(135-17*k):(135-17*k-16)]);
    endgenerate

    adder #(17) adder17_1(s1[135:119],s1[118:102],s2[71:54]);
    adder #(17) adder17_2(s1[101:85],s1[84:68],s2[53:36]);
    adder #(17) adder17_3(s1[67:51],s1[50:34],s2[35:18]);
    adder #(17) adder17_4(s1[33:17],s1[16:0],s2[17:0]);

    adder #(18) adder18_1(s2[71:54],s2[53:36],s3[37:19]);
    adder #(18) adder18_2(s2[35:18],s2[17:0],s3[18:0]);

    adder #(19) adder19_1(s3[37:19],s3[18:0],sum);

endmodule
