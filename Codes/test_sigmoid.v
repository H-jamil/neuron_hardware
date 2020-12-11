`timescale 1ns / 1ps
module test_sigmoid( );

parameter half_cycle = 20;
reg [127:0] data_p[39:0];
reg [127:0] data_w[39:0];
wire [7:0] dout;
reg [127:0] p, w;
reg [7:0] b;
reg [7:0] count;
reg clk, rst1, rst2;
wire clk2;
integer outfile;
integer outfile2;

assign #2 clk2=clk; // delayed clk

mac_acc_sigmoid uut (clk2, rst2, p, w, b, dout);


  initial begin
  $readmemh("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\digits_hex.txt",data_p);
  $readmemh("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\weights_hex.txt",data_w);
  outfile = $fopen("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\simout_sigmoid_node_syn.txt","w");
  outfile2 = $fopen("C:\\Users\\siu855574994\\OneDrive - Southern Illinois University\\Fall 2020\\ECE-528\\projects\\Codes\\simout_mac_sigmoid.txt","w");
  clk=0;
  count=0;
  rst1=1;
  rst2=1;
  b=11;
  #150 rst1=0;
end

//Generate clock
always #half_cycle clk=!clk;
// write acc output to file
  always @(posedge clk)
      if ((count>7)&(count[1:0]==2'b00))
          $fdisplay(outfile, "%h", dout);

  // write mac output to file

always @(posedge clk) begin
  if(count>3)begin
  $fdisplay(outfile2, "%h", uut.dout);
  //rst2=1;
  end
  end
always @(posedge clk2) begin
    p=data_p[count];
    w=data_w[count];
    if (!rst1) begin
      count= count+1;
      if (count==4)
         #half_cycle rst2=0;

      if (count==45) begin
        $fclose(outfile);
        $fclose(outfile2);
        $finish;
        end
      end
    end
endmodule
