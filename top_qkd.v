`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 19:29:55
// Design Name: 
// Module Name: top_qkd
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


module top_qkd_core (
    input clk,
    input rst,
    output [15:0] final_key
);

    parameter N = 80;

    // Memory loaded from Python's .mem file (3 bits: alice_bit, alice_base, bob_base)
    reg [2:0] data_mem [0:N-1];
    reg [6:0] i;

    reg [79:0] alice_bits;
    reg [79:0] alice_bases;
    reg [79:0] bob_bases;

    wire [159:0] qubit;

    wire [79:0] sifted_sender, s_valid_sender;
    wire [79:0] sifted_receiver, s_valid_receiver;

    wire [79:0] final_sender, final_receiver;
    wire [6:0] sender_len, receiver_len;

    wire [15:0] key_out;

    // Load memory once at simulation start
    initial begin
        $readmemb("C:/Users/TARUN/BB84/BB84.sim/sim_1/behave/xsim/data.mem", data_mem);  // 3-bit lines
        for (i = 0; i < N; i = i + 1) begin
            alice_bits[i]  = data_mem[i][2];
            alice_bases[i] = data_mem[i][1];
            bob_bases[i]   = data_mem[i][0];
            
        end
         $display("Loaded data.mem: alice_bits = %b \n alice_bases = %b \n bob_bases = %b", alice_bits,alice_bases, bob_bases);
    end

    // Instantiate sender_qubit
    qubit sender (
        .clk(clk),
        .r_bit(alice_bits),
        .r_base(alice_bases),
        .qubit(qubit)
    );

    // Instantiate sender_sifted
    sender_sifted s_sifted (
        .clk(clk),
        .qubit(qubit),
        .sender_bases(alice_bases),
        .receiver_bases(bob_bases),
        .sifted_valid(s_valid_sender),
        .sifted_sender(sifted_sender)
    );

    // Instantiate receiver_sifted
    receiver_sifted r_sifted (
        .clk(clk),
        .qubit(qubit),
        .r_bases(alice_bases),
        .s_bases(bob_bases),
        .sifted_valid(s_valid_receiver),
        .sifted_receiver(sifted_receiver)
    );

    // Instantiate sifted_key_gen
    siftedkey_gen keygen (
        .clk(clk),
        .sender_sifted(sifted_sender),
        .sender_svalid(s_valid_sender),
        .receiver_sifted(sifted_receiver),
        .receiver_svalid(s_valid_receiver),
        .sender_vsifted(final_sender),
        .receiver_vsifted(final_receiver),
        .sender_len(sender_len),
        .receiver_len(receiver_len)
    );

    // Instantiate key_generation
    key_generation key_module (
        .clk(clk),
        .sender_vsifted(final_sender),
        .receiver_vsifted(final_receiver),
        .key(key_out)
    );

    assign final_key = key_out;
    initial begin
    #1000; // wait some time for processing (adjust based on simulation)
    $display("Final Key = %b", final_key);
end
endmodule




