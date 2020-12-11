`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2018 04:42:51 PM
// Design Name: 
// Module Name: sigmoid
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


module sigmoid(
    input [8:0] addr,
    input sign,
    input ovf,
    output [7:0] data
    );
    
    wire [8:0] lutaddr;
    wire [5:0] lutdata;
    wire [7:0] dataext, datasigned;
    
    addrConv u1 (addr, sign, lutaddr);
    dist_mem_gen_0 u2 (lutaddr, lutdata);
    assign dataext = {2'b00, lutdata};
    dataConv u3 (dataext, sign, datasigned);
    saturationLogic u4 (datasigned, sign, ovf, data);
    
endmodule
