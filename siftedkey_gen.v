`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 19:27:58
// Design Name: 
// Module Name: siftedkey_gen
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


module siftedkey_gen(
    input clk,
    input [79:0] sender_sifted,
    input [79:0] sender_svalid,
    input [79:0] receiver_sifted,
    input [79:0] receiver_svalid,
    output reg [79:0] sender_vsifted,
    output reg [79:0] receiver_vsifted,
    output reg [6:0] sender_len,
    output reg [6:0] receiver_len
);
    integer i;
    reg [6:0] sender_idx;
    reg [6:0] receiver_idx;

    always @(posedge clk) begin
        sender_idx = 0;
        receiver_idx = 0;

        for (i = 0; i < 80; i = i + 1) begin
            if (sender_svalid[i]) begin
                sender_vsifted[sender_idx] = sender_sifted[i];
                sender_idx = sender_idx + 1;
            end
            if (receiver_svalid[i]) begin
                receiver_vsifted[receiver_idx] = receiver_sifted[i];
                receiver_idx = receiver_idx + 1;
            end
        end

        sender_len = sender_idx;
        receiver_len = receiver_idx;
    end
endmodule

