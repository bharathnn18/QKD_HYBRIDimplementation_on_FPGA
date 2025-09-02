`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 19:26:42
// Design Name: 
// Module Name: sender_sifted
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


module sender_sifted(
    input clk,
    input [159:0] qubit,
    input [79:0] sender_bases,
    input [79:0] receiver_bases,
    output reg[79:0] sifted_valid,
    output reg [79:0] sifted_sender
    );
    parameter ZERO = 2'b00, NINETY = 2'b01, FORTYFIVE = 2'b10, ONETHREEFIVE = 2'b11;
        integer i;
        always@(posedge clk)
        begin
        for(i=0;i<80;i=i+1) begin
            if(sender_bases[i] == receiver_bases[i]) begin
                if(sender_bases[i] == 0 && qubit[2*i+: 2] == ZERO) begin
                    sifted_sender[i] = 1'b0;
                    sifted_valid[i] = 1'b1; end
                else if(sender_bases[i] == 0 && qubit[2*i+: 2] == NINETY) begin
                    sifted_sender[i] = 1'b1;
                    sifted_valid[i] = 1'b1; end
                else if(sender_bases[i] == 1 && qubit[2*i+: 2] == FORTYFIVE) begin
                    sifted_sender[i] = 1'b0;
                    sifted_valid[i] = 1'b1; end
                else if(sender_bases[i] == 1 && qubit[2*i+: 2] == ONETHREEFIVE) begin
                    sifted_sender[i] = 1'b1;
                    sifted_valid[i] = 1'b1; end
                else begin
                    sifted_sender[i] = 1'bx;
                    sifted_valid[i] = 1'b0; end
             end
       end
end
endmodule