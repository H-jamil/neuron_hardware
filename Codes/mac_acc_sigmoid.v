`timescale 1ns / 1ps
module mac_acc_sigmoid(
  input clk2,
  input rst2,
  input [127:0] pixelsIn,
  input [127:0] weightsIn,
  input [7:0] b,
  output [7:0] dout);

  wire [19:0] macOut;
  wire [21:0] dout_acc;
  wire [7:0] dout;

  mac1 MAC(clk2,pixelsIn,weightsIn,macOut);
  acc Accumulator(macOut,b,clk2,rst2,dout_acc);
  sigmoid_func sig(dout_acc,dout);

  endmodule
