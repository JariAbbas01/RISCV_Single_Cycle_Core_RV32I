module ALU(A, B,ALU_Control, Result, zeroFlag, negativeFlag, carryFlag, overflowFlag, branch_out);
input [31:0] A,B;
input [2:0] ALU_Control;
output [31:0] Result;
output zeroFlag,negativeFlag,carryFlag,overflowFlag, branch_out;


// Interim Signals
wire [31:0] A_AND_B, A_OR_B, NOT_B, MUX_1, SUM, SLT, MUX_2, XOR;

wire carry_out;

// Logic

assign A_AND_B = A & B;
assign A_OR_B = A | B;
assign NOT_B = ~B;
assign XOR = A ^ B;
assign branch_out = (ALU_Control == 3'b110) ? (A==B) : 1'b0;

assign MUX_1 = (ALU_Control[0] == 1'b0) ? B : NOT_B;

assign {carry_out, SUM} = A + MUX_1 + ALU_Control[0];

assign SLT = {31'b0000000000000000000000000000000, SUM[31]};

assign MUX_2 = (ALU_Control == 3'b000) ? SUM : 
                (ALU_Control == 3'b001) ? SUM : 
                (ALU_Control == 3'b010) ? A_AND_B : 
                (ALU_Control == 3'b011) ? A_OR_B : 
                (ALU_Control == 3'b101) ? SLT :  
                (ALU_Control == 3'b111) ? XOR : 32'h00000000; 
                


assign Result = MUX_2;

// Flags Declairation

assign zeroFlag = &(~Result);

assign negativeFlag = Result[31];

assign carryFlag = carry_out & (~(ALU_Control[1]));

assign overflowFlag = (A[31] ^ SUM[31]) & (~(A[31] ^ B[31] ^ ALU_Control[0])) & (~ALU_Control[1]);


endmodule