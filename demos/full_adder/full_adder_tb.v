module tb_full_adder;

  // Testbench signals
  reg a, b, cin;      // Inputs to the full adder
  wire sum, cout;     // Outputs from the full adder

  // Instantiate the full adder module
  full_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Test procedure
  initial begin
    // Monitor the outputs whenever a, b, or cin changes
    $monitor("a = %b, b = %b, cin = %b | sum = %b, cout = %b", a, b, cin, sum, cout);

    // Test cases
    a = 0; b = 0; cin = 0; #10;  // Expected: sum = 0, cout = 0
    a = 0; b = 1; cin = 0; #10;  // Expected: sum = 1, cout = 0
    a = 1; b = 0; cin = 0; #10;  // Expected: sum = 1, cout = 0
    a = 1; b = 1; cin = 0; #10;  // Expected: sum = 0, cout = 1

    a = 0; b = 0; cin = 1; #10;  // Expected: sum = 1, cout = 0
    a = 0; b = 1; cin = 1; #10;  // Expected: sum = 0, cout = 1
    a = 1; b = 0; cin = 1; #10;  // Expected: sum = 0, cout = 1
    a = 1; b = 1; cin = 1; #10;  // Expected: sum = 1, cout = 1

    $finish; // End simulation
  end

endmodule
