module ALU_Decoder(ALU_Op, func3, func7, ALU_Control);
  input [1:0] ALU_Op;
  input [2:0] func3;
  input [6:0] func7;
  output [2:0] ALU_Control;

  // Continuous assignment for ALU_Control
  assign ALU_Control = (ALU_Op == 2'b00) ? 3'b000 :                   // ALU_Op == 00 corresponds to R-type instructions
                       (ALU_Op == 2'b10 && func3 == 3'b000 && func7 == 7'b0000000) ? 3'b000 :  // ALU_Op == 10 with func3 = 000 and func7 = 0000000 corresponds to ADD
                       (ALU_Op == 2'b10 && func3 == 3'b000 && func7 == 7'b0100000) ? 3'b001 :  // ALU_Op == 10 with func3 = 000 and func7 = 0100000 corresponds to SUB
                       (ALU_Op == 2'b10 && func3 == 3'b010 && func7 == 7'b0000000) ? 3'b101 :  // ALU_Op == 10 with func3 = 010 corresponds to SLT
                       (ALU_Op == 2'b10 && func3 == 3'b110 && func7 == 7'b0000000) ? 3'b011 :  // ALU_Op == 10 with func3 = 110 corresponds to OR
                       (ALU_Op == 2'b10 && func3 == 3'b111 && func7 == 7'b0000000) ? 3'b010 :  // ALU_Op == 10 with func3 = 111 corresponds to AND
                       (ALU_Op == 2'b10 && func3 == 3'b100 && func7 == 7'b0000000) ? 3'b111 :  // ALU_Op == 10 with func3 = 100 corresponds to XOR
                       (ALU_Op == 2'b01 && func3 == 3'b000) ? 3'b110 :  // ALU_Op == b01 with func3 = 000 corresponds to BEQ
                       (ALU_Op == 2'b10 && func3 == 3'b000) ? 3'b000 :   // For I-type instructions with func3 = 000
                       3'b000; // Default value
endmodule
