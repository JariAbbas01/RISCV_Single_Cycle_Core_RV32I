`include "Main_Decoder.v"
`include "ALU_Decoder.v"

module Control_unit_top(
    input zero,
    input [6:0] opcode,
    input [2:0] func3,
    input [6:0] func7,
    output wire regWrite,
    output [1:0] ImmSrc, ResultSrc,
    output [2:0] ALU_Control,
    output ALUSrc, MemReg, PCSrc,
    output MemWrite, Branch,
    output [1:0] ALU_Op
);

Main_Decoder Main_Decoder(
    .zero(zero),
    .opcode(opcode),
    .regWrite(regWrite),
    .ImmSrc(ImmSrc),
    .ALUSrc(ALUSrc),
    .MemWrite(MemWrite),
    .MemReg(MemReg),
    .PCSrc(PCSrc),
    .ResultSrc(ResultSrc),
    .ALU_Op(ALU_Op),
    .Branch(Branch)
);

ALU_Decoder ALU_Decoder(
    .ALU_Op(ALU_Op),
    .func3(func3),
    .func7(func7),
    .ALU_Control(ALU_Control) // Pass ALU_Control output back
);

endmodule

