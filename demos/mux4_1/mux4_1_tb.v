module mux4_1_tb;

reg a,b,c,d,sel1,sel2;
wire y;

mux4_1 uut (
    .a(a), .b(b), .c(c), .d(d), .sel1(sel1), .sel2(sel2), .y(y)
);

initial begin

a = 1; b=0; c=0; d=1;

sel1 = 0; sel2 = 0;
#10;
$display("%d %d | %d", sel1, sel2, y);

sel1 = 0; sel2 = 1;
#10;
$display("%d %d | %d", sel1, sel2, y);

sel1 = 1; sel2 = 0;
#10;
$display("%d %d | %d", sel1, sel2, y);

sel1 = 1; sel2 = 1;
#10;
$display("%d %d | %d", sel1, sel2, y);

end

endmodule