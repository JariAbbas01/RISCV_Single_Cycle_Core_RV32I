module MUX(a,b,s,o);
input [31:0] a,b;
input s;
output [31:0] o;

assign o = (s) ? b : a;

endmodule