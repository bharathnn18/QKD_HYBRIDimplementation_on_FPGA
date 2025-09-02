`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 19:24:50
// Design Name: 
// Module Name: qubit
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
module qubit(
    input clk,
    input [79:0] r_bit,
    input [79:0] r_base,
    output reg [159:0] qubit
);
    parameter ZERO = 2'b00, NINETY = 2'b01, FORTYFIVE = 2'b10, ONETHREEFIVE = 2'b11;
    integer i;
    always@(posedge clk)
    begin
    for(i=0;i<80;i = i+1) begin
        if(r_bit[i] == 1'b0 && r_base[i] == 1'b0) begin 
            qubit[2*i+: 2] = ZERO; end
        else if(r_bit[i] == 1'b1 && r_base[i] == 1'b0) begin
            qubit[2*i+: 2] = NINETY; end
        else if(r_bit[i] == 1'b0 && r_base[i] == 1'b1) begin
            qubit[2*i+: 2] = FORTYFIVE; end
        else if(r_bit[i] == 1'b1 && r_base[i] == 1'b1) begin
            qubit[2*i+: 2] = ONETHREEFIVE; end
        end
    end
endmodule
