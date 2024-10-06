module comp(
    input [3:0] a, input [3:0] b,
    output isbig, iseq, issmall
);

wire eq3, eq2, eq1, eq0;

assign eq3 = a[3] ~^ b[3];
assign eq2 = a[2] ~^ b[2];
assign eq1 = a[1] ~^ b[1];
assign eq0 = a[0] ~^ b[0];

assign isbig =  (a[3] & ~b[3]) |
                (a[2] & ~b[2] & eq3) |
                (a[1] & ~b[1] & eq3 & eq2) |
                (a[0] & ~b[0] & eq3 & eq2 & eq1);

assign iseq = eq0 & eq1 & eq2 & eq3;

assign issmall = ~(isbig | iseq);


endmodule