`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 19:41:34
// Design Name: 
// Module Name: tb_top_qkd_core
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
/////////////////////////////////////////////////////////////////////////////////

module tb_top_qkd_core;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [15:0] final_key;

    // DUT instance
    top_qkd_core uut (
        .clk(clk),
        .rst(rst),
        .final_key(final_key)
    );

    // Clock generation: 100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Simulation process
    initial begin
        $display("=== QKD Simulation Started ===");

        // Reset
        rst = 1;
        #20 rst = 0;

        // Wait sufficient time for processing
        #100000000;

        // Show and store the final key
        $display("Final Key = %b", final_key);
        $display("=== QKD Simulation Completed ===");
        $stop;
    end

endmodule

