`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 04:38:58 PM
// Design Name: 
// Module Name: saturationLogic
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


module saturationLogic(
    input [7:0] dataIN,
    input sign,
    input ovf,
    output [7:0] dataOUT
    );
    
    reg [7:0] dataOUT;
    
    always @(*) begin
      if (ovf==0) 
        dataOUT = dataIN;
      else begin
        if (sign==0)
           dataOUT = 8'b01000000;
        else
           dataOUT = 8'b11000000;
       end
    end
           
endmodule
