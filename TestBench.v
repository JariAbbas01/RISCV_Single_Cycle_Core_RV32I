module TB();

reg clk=0, reset;

Single_Cycle_Top Single_Cycle_Top(
    .clk(clk),
    .reset(reset)
);

always begin
  clk = ~clk;
  #50;
end

initial begin
  reset = 1'b1;
  #100;
  reset = 1'b0;
  #4000;
  $finish;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0);
end

endmodule