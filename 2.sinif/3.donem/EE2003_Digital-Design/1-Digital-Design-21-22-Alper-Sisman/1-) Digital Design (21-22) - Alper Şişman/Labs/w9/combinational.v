module combinational(a, b, sel, out);

input a, b, sel;
output out;

reg out;

always @ (a or b or sel)

begin
if (sel) out = a;
else out = b;
end

endmodule
