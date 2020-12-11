`timescale 1ns / 1ps

module test_mult( );
  reg [7:0] a, b;
  wire [15:0] s;
  mult mult1 (a, b, s);
initial begin
  a=0;
  b=0;
  #10 a=7;
  b=1;
  #10 a=-5;
  b=3;
  #20 $finish;
  end
endmodule
