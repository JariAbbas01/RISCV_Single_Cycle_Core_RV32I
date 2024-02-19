module Branch_Target(ImmExtendOutput, PCOutPut, BranchTarget);
input [31:0] ImmExtendOutput, PCOutPut;
output [31:0] BranchTarget;

assign BranchTarget = ImmExtendOutput + PCOutPut;


endmodule