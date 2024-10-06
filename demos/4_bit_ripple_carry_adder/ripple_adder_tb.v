`timescale 1ns / 1ps

module tb_4b_rc_adder;

    // Declare inputs as reg type
    reg [3:0] a;
    reg [3:0] b;
    reg cin;

    // Declare outputs as wire type
    wire [3:0] sum;
    wire cout;

    // Instantiate the ripple carry adder
    ripple_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Initial block for test vectors
    initial begin
        // Monitor the inputs and outputs
        $monitor("Time: %0t | a = %b | b = %b | cin = %b | sum = %b | cout = %b", $time, a, b, cin, sum, cout);

        // Test case 1: 0000 + 0000
        a = 4'b0000; b = 4'b0000; cin = 0;
        #10;
        
        // Test case 2: 0001 + 0001
        a = 4'b0001; b = 4'b0001; cin = 0;
        #10;

        // Test case 3: 0101 + 1010
        a = 4'b0101; b = 4'b1010; cin = 0;
        #10;

        // Test case 4: 1111 + 1111 with carry-in
        a = 4'b1111; b = 4'b1111; cin = 1;
        #10;

        // Test case 5: Random large values with carry-in
        a = 4'b1100; b = 4'b0111; cin = 1;
        #10;

        // Finish simulation
        $finish;
    end
endmodule
