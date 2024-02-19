module Register_File (
    input [4:0] A1, A2, A3,
    input clk, reset, WE3,
    input [31:0] WD3,
    output reg [31:0] RD1, RD2
);

// Creating Memory
reg [31:0] Register [0:31]; // Modify range to [0:31]

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (integer i = 0; i < 32; i = i + 1) begin
            Register[i] <= 32'h00000000; // Initialize registers to zero upon reset
        end
    end else begin
        if (WE3) begin
            Register[A3] <= WD3; // Write data WD3 to register specified by A3
        end
    end
end

always @(*) begin
    Register[0] = 32'b0;
    RD1 = Register[A1];
    RD2 = Register[A2]; 
end


// initial begin
//     Register[5] = 32'h00000002; // x5 = 2
//     Register[6] = 32'h00000003; // x6 = 3
//     Register[7] = 32'h00000004; // x7 = 4
//     Register[8] = 32'h00000005; // x8 = 5
//     Register[9] = 32'h00000006; // x9 = 6
//     Register[10] = 32'h00000007; // x10 = 7
//     Register[11] = 32'h00000008; // x11 = 8
//     Register[12] = 32'h00000009; // x12 = 9
//     Register[13] = 32'h0000000A; // x13 = 10
//     Register[14] = 32'h0000000B; // x14 = 11
// end

endmodule
