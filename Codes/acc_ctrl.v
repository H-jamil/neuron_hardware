`timescale 1ns / 1ps
module acc_ctrl(
    input clk,
    input rst,
    output sel,
    output en
);

    reg[1:0] next_state, curr_state;
    parameter s1 = 2'b00;
    parameter s2 = 2'b01;
    parameter s3 = 2'b10;
    parameter s4 = 2'b11;

    always @(posedge clk) begin
        if(rst)
            curr_state = s1;
        else
            curr_state = next_state;
    end


    always @(curr_state) begin
        case(curr_state)
            s1: next_state = s2;
            s2: next_state = s3;
            s3: next_state = s4;
            s4: next_state = s1;
        endcase
    end

    assign sel = (curr_state ==s1) ? 1'b1 : 1'b0;
    assign en =  (curr_state ==s4) ? 1'b1 : 1'b0;

endmodule
