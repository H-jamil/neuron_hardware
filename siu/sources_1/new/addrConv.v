`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 04:24:06 PM
// Design Name: 
// Module Name: addrConv
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


module addrConv(
    input [8:0] addrIN,
    input sign,
    output [8:0] addrOUT
    );
    
    reg [8:0] addrOUT;
    
    always @(*) begin
       if (sign==0)
          addrOUT = addrIN;
       else
          addrOUT=~addrIN+1;
    end
endmodule
