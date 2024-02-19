### RISC32Bit-SingleCycle-Core

Hi! This is Jari Abbas Rizvi and Welcome to my RISC32Bit-SingleCycle-Core repository! This repository hosts the implementation of a 32-bit RISC-V single-cycle core, meticulously crafted to efficiently execute instructions within a single clock cycle. Rooted in the RISC-V instruction set architecture (ISA), this core is tailored for the demands of embedded system applications and educational endeavors.

#### Instructions

Explore the following sequence of instructions:

- **Initialization:**
  - `addi x5, x0, 3` - Initialize register x5 with immediate value 3
  - `addi x6, x0, 4` - Initialize register x6 with immediate value 4
  - `add x10, x5, x6` - Perform addition: `x10 = x5 + x6`
  - `addi x11, x0, 1` - Initialize register x11 with immediate value 1

- **Loop and Branching:**
  - `repeat:` - Label for the start of the loop
    - `addi x12, x0, 10` - Load immediate value 10 to register x12
    - `addi x11, x11, 1` - Increment register x11 by 1
    - `beq x11, x12, UP` - Branch to label UP if x11 equals x12
    - `j repeat` - Unconditional jump to label repeat

- **Label:**
  - `UP:` - Label for the branching destination
    - `jal x0, table` - Jump and link to label table

- **Table:**
  - `table:` - Label for the subroutine table

#### Implementation Details

Dive deeper into the core's architecture:

**Alu_Decoder.v**: This module is responsible for decoding the ALU operation based on the instruction opcode.

**ALU.v**: The ALU module performs arithmetic and logical operations based on the decoded ALU operation.

**Branch_Target.v**: This module calculates the target address for branch instructions.

**Control_Unit.v**: The Control Unit module generates control signals based on the instruction opcode to coordinate the execution of instructions.

**Data_Memory.v**: This module represents the data memory component of the processor, responsible for storing and retrieving data.

**Control_Unit_Top.v (Main_Decoder.v and ALU_Decoder.v)**: This module combines the main instruction decoder and the ALU decoder to provide comprehensive control over the processor's operations.

**Imm_Ext.v**: The Immediate Extender module extends immediate values for I-Type instructions to their full width.

**Instruction_Memory.v**: This module represents the instruction memory component of the processor, responsible for storing and fetching instructions.

**Program_Counter.v**: This module represents the program counter component of the processor, responsible for storing the address of the next instruction to be executed.

**register-File.v**: The Register File module represents the processor's register file, where data is stored temporarily for processing.

**Sign-Extend.v**: The Sign Extend module extends immediate values with a sign bit to their full width.

**Single_Cycle_Top.v**: This module represents the top-level design of the single-cycle processor, integrating all other modules to form a complete system.

**TestBench.v**: The TestBench module provides a simulation environment for testing the functionality of the processor modules.

#### Get Started

Embark on your journey with the RISC-V single-cycle core! Clone or fork this repository to unleash its simplicity and efficiency in your projects.

**Happy coding!**
