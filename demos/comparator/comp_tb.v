module comp_tb;

// Declare inputs to the DUT (Device Under Test)
reg [3:0] a, b;

// Declare outputs from the DUT
wire isbig, iseq, issmall;

// Instantiate the comparator module
comp uut (
    .a(a),
    .b(b),
    .isbig(isbig),
    .iseq(iseq),
    .issmall(issmall)
);

initial begin
    // Test case 1: a = 4'b0000, b = 4'b0000 (a == b)
    a = 4'b0000;
    b = 4'b0000;
    #10; // Wait for some time for the result to propagate
    $display("Test case 1: a = %b, b = %b | isbig = %b, iseq = %b, issmall = %b", a, b, isbig, iseq, issmall);
    
    // Test case 2: a = 4'b0101, b = 4'b0011 (a > b)
    a = 4'b0101;
    b = 4'b0011;
    #10;
    $display("Test case 2: a = %b, b = %b | isbig = %b, iseq = %b, issmall = %b", a, b, isbig, iseq, issmall);
    
    // Test case 3: a = 4'b0011, b = 4'b0101 (a < b)
    a = 4'b0011;
    b = 4'b0101;
    #10;
    $display("Test case 3: a = %b, b = %b | isbig = %b, iseq = %b, issmall = %b", a, b, isbig, iseq, issmall);
    
    // Test case 4: a = 4'b1111, b = 4'b1111 (a == b)
    a = 4'b1111;
    b = 4'b1111;
    #10;
    $display("Test case 4: a = %b, b = %b | isbig = %b, iseq = %b, issmall = %b", a, b, isbig, iseq, issmall);
    
    // Test case 5: a = 4'b1010, b = 4'b0110 (a > b)
    a = 4'b1010;
    b = 4'b0110;
    #10;
    $display("Test case 5: a = %b, b = %b | isbig = %b, iseq = %b, issmall = %b", a, b, isbig, iseq, issmall);
    
    // Test case 6: a = 4'b0111, b = 4'b1001 (a < b)
    a = 4'b0111;
    b = 4'b1001;
    #10;
    $display("Test case 6: a = %b, b = %b | isbig = %b, iseq = %b, issmall = %b", a, b, isbig, iseq, issmall);

    // End simulation
    $finish;
end

endmodule
