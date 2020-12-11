module sigmoid_func(
    input[21:0] in,
    output[7:0] out
);

wire[16:0] y;
reg ovf;
wire sign;
wire out1,out2,out3,out4,out5,out6;
wire[8:0] data;

assign y=in[21:5];
assign sign=y[16];
assign data=y[8:0];
or u1(out1,y[15],y[14],y[13],y[12],y[11],y[10],y[9]);
and u2(out2,y[15],y[14],y[13],y[12],y[11],y[10],y[9]);
or u3(out3,y[8],y[7],y[6],y[5],y[4],y[3],y[2],y[1],y[0]);
not u4(out4,out2);
not u5(out5,out3);
or u6(out6,out4,out5);

always @(*) begin
  if (sign ==1'b0) begin
    ovf<=out1;
  end
  if (sign ==1'b1) begin
    ovf<=out6;
  end
end

sigmoid_0 sig(data,sign,ovf,out);

endmodule
