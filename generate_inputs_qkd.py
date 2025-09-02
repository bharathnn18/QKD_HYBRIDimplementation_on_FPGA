import os
import random
import pandas as pd
from random_bits_alice import random_bit as generate_bit

def generate_bb84_input_txt(num_bits, filename="C:/Users/TARUN/qkd_bb84/input_data.txt"):
    # Make sure directory exists
    os.makedirs(os.path.dirname(filename), exist_ok=True)

    # Generate data
    alice_bits = [generate_bit() for _ in range(num_bits)]
    alice_bases = [generate_bit() for _ in range(num_bits)] # 0 = 'Z' and 1 = 'X'
    bob_bases = [generate_bit() for _ in range(num_bits)]   # 0 = 'Z' and 1 = 'X'

    # Create DataFrame
    df = pd.DataFrame(zip(alice_bits, alice_bases, bob_bases))


    # Save as space-separated .txt (no header or index)
    df.to_csv(filename, sep=' ', index=False, header=False)

    print(f"[INFO] File saved at: {os.path.abspath(filename)}")


# Message bit length
d = 1
n = int(input("Length of message bits: "))
y = (4 + d)*n

if __name__ == '__main__':
    generate_bb84_input_txt(y)
    print(y)
    print(n)
