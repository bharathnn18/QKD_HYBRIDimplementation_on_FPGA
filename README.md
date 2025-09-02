# QKD_HYBRIDimplementation_on_FPGA

In this project, the Quantum Key Distribution is developed in verilog and implemented on a FPGA.
Here is how it works:
1. The quantum random numbers and bases that needs to be generated in the BB84 protocol of QKD 
is done in python and saved in a .mem file.
2. The remaining steps which are classical processing is done in verilog. 
Hence implementing a hybrid implementation of QKD.

# NOTE: This only does the KEY generation to use in other CRYPTOGRAPHY algorithm.

# Brief Description.
• Implemented BB84-based QKD protocol on FPGA using Verilog for secure key generation. 
• Integrated Python with FPGA for random bit generation and key sifting. 
• Achieved reliable cryptographic randomness on hybrid SoC architecture.
