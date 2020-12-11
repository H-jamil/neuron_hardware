`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SIUC
// Engineer: Jamil hasibul
//
// Create Date: 11/15/2020 02:23:18 PM
// Design Name:
// Module Name: mult
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

module mult(x,y,p);
input [7:0]x,y;
output [15:0]p;
reg [15:0]p;
reg [15:0]a;

always @(x , y)
  p=x*y;
endmodule


//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: SIUC
// Engineer: Jamil hasibul
//
// Create Date: 11/15/2020 02:23:18 PM
// Design Name:
// Module Name: mult
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
module mult(x,y,p);
input [7:0]x,y;
output [15:0]p;
reg [15:0]p;
reg [15:0]a;
integer i;

always @(x , y)
begin
  a=x;
  p=0; // needs to zeroed
  for(i=0;i<8;i=i+1)
  begin
    if(y[i])
      p=p+a; // must be a blocking assignment
    a=a<<1;
  end
end
endmodule



module mult(
    input signed [7:0] a,
    input signed [7:0] b,
    output signed [15:0] p
);
    assign p=a*b;
endmodule
