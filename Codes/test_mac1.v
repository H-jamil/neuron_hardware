`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/15/2020 04:55:24 PM
// Design Name:
// Module Name: test_mac1
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


module test_mac1();
    parameter half_cycle=20;
    reg[127:0] data_p[39:0];
    reg[127:0] data_w[39:0];
    wire [19:0]s;
    //reg[7:0]x,y;
    //wire[15:0]mul;
    reg[127:0] p,w;
    reg[7:0] count;
    reg clk;
    wire clk2;
    integer outfile;
    
    assign #2 clk2=clk;
    //mac2 uut(clk,p,w,s);
    mac1 uut(clk,p,w,s);
    //mult multiplierTest(x,y,mul);
    initial begin
        $readmemh("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\digits_hex.txt",data_p);
        $readmemh("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\weights_hex.txt",data_w);
        outfile = $fopen("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\simout_mac_only_syn.txt","w");
        //outfile = $fopen("simout_mac_only.txt","w");
        clk=0;
        count=0;
        //#150 count=1;
        //#10 count=0;
      //  x=0;
      //  y=0;
        end
      always #half_cycle clk=!clk;
      //write to file
//        initial begin
//        #120 x=4;
//             y=4;
//        #50 x=5;
//            y=5;
//        #50 $finish;
//        end
      always @(posedge clk)
      if (count>0)
        $fdisplay(outfile,"%h",s);
      
      always @(posedge clk2)begin
        p=data_p[count];
        w=data_w[count];
        count =count+1;
        if (count==44)
            begin
            $fclose(outfile);
            $finish;
            end
        end
endmodule
