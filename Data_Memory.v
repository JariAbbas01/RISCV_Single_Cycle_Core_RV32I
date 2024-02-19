module Data_Memory (
  input clk, reset, WE,
  input [31:0] A, WD,
  output reg [31:0] RD
);

  // RAM
  reg [31:0] RAM [1023:0];

  always @(posedge clk or posedge reset)
  begin
    if (reset) begin
      RD <= 32'h00000000;
    end
    else if (WE) begin
      RAM[A] <= WD;
    end
    RD <= RAM[A];
  end

endmodule