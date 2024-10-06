module adder_subtractor(
    input [63:0] a,          // 64-bit input a
    input [63:0] b,          // 64-bit input b
    input sub,               // Subtraction control signal (1 for subtraction)
    output [63:0] s,         // 64-bit sum/difference output
    output cout              // Carry-out/borrow-out output
);
    
    wire [63:0] b_sub;       // Modified b for subtraction

    // If sub is 1, perform two's complement on b (invert b)
    assign b_sub = b ^ {64{sub}};

    // Instantiate the adder (your adder module)
    bka u_bka(
        .a(a),
        .b(b_sub),
        .cin(sub),    // Use the sub signal as carry-in
        .s(s),
        .cout(cout)
    );

endmodule
