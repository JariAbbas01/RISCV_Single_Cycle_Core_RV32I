`include "Program_Counter.v"
`include "PC_Adder.v"
`include "Instruction_Memory.v"
`include "register_File.v"
`include "Sign_Extend.v"
`include "ALU.v"
`include "Control_Unit_Top.v"
`include "Data_memory.v"
`include "Mux.v"
`include "Branch_Target.v"

module Single_Cycle_Top(clk, reset);
input clk, reset;

// Interim Signals
wire [31:0] instr, PC_Plus_4, PC_out, RD_1_top, RD_2_top, ImmExtend_top, srcB, MUXBDM_OUT, ALU_result_top, DM_RD, PC_Mux_out, Final_result, BT;
wire regWrite, ALUSrc, zero, MemWrite, MemReg, PCSrc, branch_out, Branch, Jump;
wire [1:0] ImmSrc, ResultSrc, ALU_Op;
wire [2:0] ALU_Control_top;

Program_Counter Program_Counter(
    .clk(clk), 
    .reset(reset), 
    .PC_Next(PC_Mux_out), 
    .PC(PC_out)
    );

PC_adder PC_adder(
    .a(PC_out),
    .b(32'd4),
    .s(PC_Plus_4)
    );

// Branch Target
Branch_Target Branch_Target(
    .ImmExtendOutput(ImmExtend_top), 
    .PCOutPut(PC_out), 
    .BranchTarget(BT)
    );



MUX Mux_PC(
    .a(PC_Plus_4),
    .b(BT),
    .s((branch_out && Branch) || Jump),
    .o(PC_Mux_out)
);

Instruction_Memory Instruction_Memory(
    .reset(reset), 
    .A(PC_out), 
    .RD(instr)
    );

Register_File Register_File(
    .clk(clk),
    .reset(reset),
    .A1(instr[19:15]), 
    .A2(instr[24:20]), 
    .A3(instr[11:7]),  
    .WE3(regWrite), 
    .WD3(Final_result), 
    .RD1(RD_1_top), 
    .RD2(RD_2_top)
    );

ImmExtend ImmExtend(
    .instr(instr), 
    .ImmSrc(ImmSrc), 
    .extendedImm(ImmExtend_top)
    );

MUX MUX(
    .a(RD_2_top),
    .b(ImmExtend_top),
    .s(ALUSrc),
    .o(srcB)
    );

ALU ALU(
    .A(RD_1_top), 
    .B(srcB),
    .ALU_Control(ALU_Control_top), 
    .Result(ALU_result_top),
    .branch_out(branch_out)
    );

Data_Memory Data_Memory(
    .clk(clk), 
    .reset(reset), 
    .WE(MemWrite), // Assuming MemWrite is intended to be the write enable signal
    .A(ALU_result_top), 
    .WD(RD_2_top), 
    .RD(DM_RD)
    );


MUX MUX_Before_DM(
    .a(ALU_result_top),
    .b(PC_Plus_4),
    .s(Jump),
    .o(MUXBDM_OUT)
);



MUX MUX_after_DM(
    .a(MUXBDM_OUT),
    .b(DM_RD),
    .s(MemReg),
    .o(Final_result)
    );

Control_unit_top Control_unit_top(
    .zero(zero),
    .opcode(instr[6:0]), 
    .func3(instr[14:12]), 
    .func7(instr[31:25]), 
    .regWrite(regWrite), 
    .ImmSrc(ImmSrc), 
    .ResultSrc(ResultSrc), 
    .ALU_Control(ALU_Control_top), 
    .ALUSrc(ALUSrc), 
    .MemWrite(MemWrite), 
    .MemReg(MemReg),
    .Jump(Jump),
    .PCSrc(PCSrc),
    .Branch(Branch),
    .ALU_Op(ALU_Op)
    );

endmodule
