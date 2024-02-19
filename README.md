### RISC32Bit-SingleCycle-Core

Welcome to the RISC32Bit-SingleCycle-Core repository! This repository hosts the implementation of a 32-bit RISC-V single-cycle core, meticulously crafted to efficiently execute instructions within a single clock cycle. Rooted in the RISC-V instruction set architecture (ISA), this core is tailored for the demands of embedded system applications and educational endeavors.

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

- **Decoder:** Decodes instructions, guiding them to the appropriate functional units.
- **Immediate Extender (immExt):** Extends immediate values for I-Type instructions.
- **ALU Decoder:** Determines ALU operation based on instruction opcode.
- **Arithmetic Logic Unit (ALU):** Executes arithmetic and logical operations.

#### Get Started

Embark on your journey with the RISC-V single-cycle core! Clone or fork this repository to unleash its simplicity and efficiency in your projects.

**Happy coding!**
