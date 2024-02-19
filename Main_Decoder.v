module Main_Decoder(zero, opcode, regWrite, ImmSrc, ALUSrc, MemWrite, MemReg, ResultSrc, ALU_Op, PCSrc, Branch);
input zero;
input [6:0] opcode;
output reg regWrite, ALUSrc, MemWrite, MemReg, PCSrc, Branch;
output reg [1:0] ImmSrc, ResultSrc, ALU_Op;

// Interim Signal



always @ (opcode or zero)
begin
  if(opcode == 7'b0000011) begin  //LW
    regWrite = 1'b1;
    ImmSrc = 2'b00;
    ALUSrc = 1'b1;
    MemWrite = 1'b0;
    ResultSrc = 2'b10;
    Branch = 1'b0;
    ALU_Op = 2'b00;
    MemReg = 1'b1;
    PCSrc = Branch & zero;
  end
  else if (opcode == 7'b0100011) begin //Sw
    regWrite = 1'b0;
    ImmSrc = 2'b01;
    ALUSrc = 1'b1;
    MemWrite = 1'b1;
    ResultSrc = 2'b00;
    Branch = 1'b0;
    ALU_Op = 2'b00;
    MemReg = 1'b0;
    PCSrc = Branch & zero;
  end
  else if (opcode == 7'b0110011) begin // R-type
    regWrite = 1'b1;
    ImmSrc = 2'b00;
    ALUSrc = 1'b0;
    MemWrite = 1'b0;
    ResultSrc = 2'b01;
    Branch = 1'b0;
    ALU_Op = 2'b10;
    MemReg = 1'b0;
    PCSrc = Branch & zero;
  end
  else if (opcode == 7'b0010011) begin  // I-type
    regWrite = 1'b1;
    ImmSrc = 2'b00;
    ALUSrc = 1'b1;
    MemWrite = 1'b0;
    ResultSrc = 2'b01;
    Branch = 1'b0;
    ALU_Op = 2'b10;
    MemReg = 1'b0;
    PCSrc = Branch & zero;
  end else if (opcode == 7'b1100011) begin  // Branch-type
    regWrite = 1'b0;
    ImmSrc = 2'b10;
    ALUSrc = 1'b0;
    MemWrite = 1'b0;
    ResultSrc = 2'b00;
    Branch = 1'b1;
    ALU_Op = 2'b01;
    MemReg = 1'b0;
    PCSrc = Branch & zero;
  end else begin
    regWrite = 1'b1;
    ImmSrc = 2'b00;
    ALUSrc = 1'b1;
    MemWrite = 1'b0;
    ResultSrc = 2'b10;
    Branch = 1'b0;
    ALU_Op = 2'b00;
    MemReg = 1'b1;
    PCSrc = Branch & zero;
  end
  
end

endmodule