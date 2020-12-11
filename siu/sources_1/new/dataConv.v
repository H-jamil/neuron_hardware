`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 04:36:24 PM
// Design Name: 
// Module Name: dataConv
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


module dataConv(
    input [7:0] dataIN,
    input sign,
    output [7:0] dataOUT
    );
    
    reg [7:0] dataOUT;
    
    always @(*) begin
       if (sign==0)
          dataOUT = dataIN;
       else
          dataOUT=~dataIN+1;
    end
endmodule
