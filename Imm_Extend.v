module ImmExtend (
  input [31:0] instr,
  input [1:0] ImmSrc,
  output reg [31:0] extendedImm
);

always @*
begin
  case (ImmSrc)
    2'b00: // I-Type
      extendedImm = {{20{instr[31]}}, instr[31:20]};

    2'b01: // S-Type
      extendedImm = {{20{instr[31]}}, instr[31:25], instr[11:7]};

    2'b10: // B-Type
      extendedImm = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};

    2'b11: // J-Type
      extendedImm = {{12{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};

    default:
      extendedImm = 32'h0;
  endcase
end

endmodule
