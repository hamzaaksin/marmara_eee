module sequential(a, b, sel, clk, out);

input a, b, sel, clk;
output out;

reg out;

always @ (posedge clk)

begin
if (sel) out <= a;
else out <= b;
end

endmodule
