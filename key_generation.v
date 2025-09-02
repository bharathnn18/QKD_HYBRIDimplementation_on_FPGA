`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 19:28:46
// Design Name: 
// Module Name: key_generation
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


module key_generation(
    input clk,
    input [79:0] sender_vsifted,
    input [79:0] receiver_vsifted,
    output reg [15:0] key
);

    integer i;
    integer key_index;

    always @(posedge clk) begin
        key_index = 0;
        key = 16'b0;

        for (i = 0; i < 80; i = i + 1) begin
            if (sender_vsifted[i] == receiver_vsifted[i]) begin
                if (key_index < 16) begin
                    key[key_index] = sender_vsifted[i];
                    key_index = key_index + 1;
                end
            end
        end
    end

endmodule


