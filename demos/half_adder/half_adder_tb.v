module half_adder_tb;

reg A, B;
wire Sum, Carry;

half_adder uut (
    .A(A),
    .B(B),
    .Sum(Sum),
    .Carry(Carry)
);

initial begin

A = 0; B = 0;
#10;
$display("%d %d -> %d %d", A, B, Sum, Carry);

A = 0; B = 1;
#10;
$display("%d %d -> %d %d", A, B, Sum, Carry);

A = 1; B = 0;
#10;
$display("%d %d -> %d %d", A, B, Sum, Carry);

A = 1; B = 1;
#10;
$display("%d %d -> %d %d", A, B, Sum, Carry);

end

endmodule