module Program_Counter(clk, reset, PC_Next, PC);
input clk, reset;
input [31:0] PC_Next;
output reg [31:0] PC;


always @ (posedge clk or posedge reset)
begin
  if(reset) begin
    PC = 32'h00000000;
  end else begin
    PC = PC_Next;
  end
end

endmodule