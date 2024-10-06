module mux4_1(
    input a, b, c, d, sel1, sel2,
    output y
);

assign y =  (~sel1 & ~ sel2 & a ) | 
            (~sel1 & sel2 & b ) |
            (sel1 & ~ sel2 & c ) |
            (sel1 & sel2 & d ) ;

endmodule