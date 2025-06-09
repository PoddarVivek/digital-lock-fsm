 4-Digit Digital Lock System using FSM (Verilog)

This project implements a secure 4-digit digital lock using **Finite State Machine (FSM)** principles in Verilog HDL. The lock accepts one digit at a time and compares it against a preset password sequence. Upon successful entry, the system activates an unlock signal; otherwise, it resets.

Tools Used

- Verilog HDL  
- ModelSim / Vivado (for simulation)  
- (Optional) FPGA for real hardware deployment (e.g., Basys 3, Spartan-6)

 Password Logic

The correct password is: **4 → 3 → 2 → 1**  
The user must enter each digit one by one using a load signal.

-  Correct Sequence → Unlocks system (`unlocked = 1`)
-  Incorrect Entry → System resets (`unlocked = 0`)


 Simulation

To simulate the design:

1. Load both files in your Verilog simulator (ModelSim or Vivado).
2. Run the testbench `digital_lock_tb.v`
3. Observe the output:
   - `unlocked = 1` for correct sequence
   - `unlocked = 0` for incorrect sequence

