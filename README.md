### RISC32Bit-SingleCycle-Core

Welcome to the RISC32Bit-SingleCycle-Core repository! This repository hosts the implementation of a 32-bit RISC-V single-cycle core, designed to execute instructions within a single clock cycle. The core is based on the RISC-V instruction set architecture (ISA), offering simplicity and efficiency for embedded system applications and educational purposes.

#### Instructions

The core supports various RISC-V instructions, including:

- **R-Type Instructions:**
  - `add x10, x5, x6` - `x10 = x5 + x6`
  - `sub x11, x7, x8` - `x11 = x7 - x8`
  - `and x12, x9, x10` - `x12 = x9 & x10`
  - `or x13, x11, x12` - `x13 = x11 | x12`
  - `slt x14, x13, x14` - `x14 = (x13 < x14) ? 1 : 0`
  
- **I-Type Instructions:**
  - `addi x19, x10, 10` - `x19 = x10 + 10`
  - `lw x20, 20(x11)` - `x20 = Memory[x11 + 20]`
  - `sw x21, 30(x12)` - `Memory[x12 + 30] = x21`

- **Additional Instructions:**
  - `addi x5, x0, 3` - `x5 = 3`
  - `addi x6, x0, 4` - `x6 = 4`
  - `add x10, x5, x6` - `x10 = x5 + x6`
  - `addi x11, x0, 1` - `x11 = 1`
  - `repeat:`
    - `addi x12, x0, 10` - `x12 = 10`
    - `addi x11, x11, 1` - Increment x11 by 1
    - `beq x11, x12, table` - Branch to table if x11 equals x12
    - `beq x0, x0, repeat` - Infinite loop (will repeat indefinitely)
    - `table:`

#### Implementation Details

The core comprises various components:

- **Decoder:** Responsible for decoding instructions and directing them to the appropriate functional units.
- **Immediate Extender (immExt):** Extends immediate values for I-Type instructions.
- **ALU Decoder:** Determines the operation to be performed by the Arithmetic Logic Unit (ALU) based on the instruction opcode.
- **Arithmetic Logic Unit (ALU):** Executes arithmetic and logical operations based on the ALU Decoder's instruction.

#### Get Started

Clone or fork this repository to explore the simplicity and efficiency of the RISC-V single-cycle core for your projects.

**Happy coding!**
