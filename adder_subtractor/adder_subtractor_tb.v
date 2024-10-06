module adder_subtractor_tb;
    
    reg [63:0] a;            // 64-bit input a
    reg [63:0] b;            // 64-bit input b
    reg sub;                 // Subtraction control signal
    wire [63:0] s;           // 64-bit sum/difference output
    wire cout;               // Carry-out/borrow-out output
    
    integer i;
    reg [63:0] test_cases_a [0:9];  // Array of input A values
    reg [63:0] test_cases_b [0:9];  // Array of input B values
    reg test_cases_sub [0:9];       // Array of subtraction control signals

    // Instantiate the adder_subtractor module
    adder_subtractor uut(
        .a(a),
        .b(b),
        .sub(sub),
        .s(s),
        .cout(cout)
    );

    initial begin
        // Initialize test cases (decimal values)
        test_cases_a[0] = 100;  test_cases_b[0] = 50;   test_cases_sub[0] = 0;  // 100 + 50
        test_cases_a[1] = 12345; test_cases_b[1] = 54321; test_cases_sub[1] = 0; // 12345 + 54321
        test_cases_a[2] = 50000; test_cases_b[2] = 20000; test_cases_sub[2] = 1; // 50000 - 20000
        test_cases_a[3] = 987654; test_cases_b[3] = 123456; test_cases_sub[3] = 1; // 987654 - 123456
        test_cases_a[4] = 0; test_cases_b[4] = 100000; test_cases_sub[4] = 0; // 0 + 100000
        test_cases_a[5] = 1000000; test_cases_b[5] = 1000000; test_cases_sub[5] = 1; // 1000000 - 1000000
        test_cases_a[6] = 999; test_cases_b[6] = 888; test_cases_sub[6] = 0; // 999 + 888
        test_cases_a[7] = 1000000000; test_cases_b[7] = 999999999; test_cases_sub[7] = 0; // 1000000000 + 999999999
        test_cases_a[8] = 123456789; test_cases_b[8] = 987654321; test_cases_sub[8] = 1; // 123456789 - 987654321
        test_cases_a[9] = 555555; test_cases_b[9] = 444444; test_cases_sub[9] = 1; // 555555 - 444444

        // Apply test cases
        for (i = 0; i < 10; i = i + 1) begin
            a = test_cases_a[i];
            b = test_cases_b[i];
            sub = test_cases_sub[i];
            
            // Wait for changes to propagate
            #10;

            // Display results in decimal format
            $display("Test case %0d: a = %0d, b = %0d, sub = %b, result = %0d, cout = %b", 
                     i, a, b, sub, s, cout);
        end
    end

endmodule
