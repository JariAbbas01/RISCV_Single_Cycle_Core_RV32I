module Instruction_Memory(reset, A, RD);
  input reset;
  input [31:0] A;
  output [31:0] RD;

  // Create an Instruction Memory
  reg [31:0] Memory [1023:0];

  // Read
  assign RD = (reset) ? 32'h00000000 : Memory[A[31:2]];
initial begin
  $readmemh("memfile.hex", Memory, 0, 1023);
end



  // Initial memory content
  // initial begin
  //   Memory[1] = 32'h0062E233;
    
  //   // Add more initializations if needed
  // end
endmodule
