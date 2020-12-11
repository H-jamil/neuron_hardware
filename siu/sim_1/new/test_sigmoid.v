`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 04:47:54 PM
// Design Name: 
// Module Name: test_sigmoid
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


module test_sigmoid( );

reg clk;
reg signed [10:0] count;
wire [7:0] data;
wire clk2;
reg sign, ovf;

integer outfile;

parameter half_cycle = 20;

assign #2 clk2=clk;

// instantiate the LUT
sigmoid u1 (count[8:0], sign, ovf, data);

initial begin
  clk=0;
  count = -511;
  sign = 1;
  ovf = 0;
  outfile = $fopen("simout.txt","w");
  end
  
always #half_cycle clk=!clk;

// write to file
always @(posedge clk)
     $fdisplay(outfile, "%h", data); 

always @(posedge clk2) begin
   count = count + 1;
   
   if (count==0)
      sign = 0;
      
   if (count>=512) begin
     $fclose(outfile);
     $finish; 
  end
end
endmodule
