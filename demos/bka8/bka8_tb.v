`timescale 1ns / 1ps

module bka8_tb;

  // Inputs
  reg [7:0] a;
  reg [7:0] b;

  // Outputs
  wire [7:0] s;
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  bka8 uut (
    .a(a), 
    .b(b), 
    .s(s), 
    .cout(cout)
  );

  // Test vectors and expected results
  reg [7:0] test_vectors_a[0:9];
  reg [7:0] test_vectors_b[0:9];
  reg [7:0] expected_sum[0:9];
  reg expected_cout[0:9];

  integer i;

  // Function to print results
  task print_results;
    input [7:0] a, b;
    input [7:0] expected_s;
    input expected_cout;
    begin
      $display("a: %b, b: %b", a, b);
      $display("Expected sum: %b, Expected cout: %b", expected_s, expected_cout);
      $display("Actual sum  : %b, Actual cout  : %b\n", s, cout);
      if (s !== expected_s || cout !== expected_cout) begin
        $display("ERROR in Test Case!");
      end
    end
  endtask

  initial begin
    // Test Case Initialization using Python-generated values
    test_vectors_a[0] = 8'd218;
    test_vectors_b[0] = 8'd9;
    expected_sum[0] = 8'd227;
    expected_cout[0] = 0;

    test_vectors_a[1] = 8'd13;
    test_vectors_b[1] = 8'd125;
    expected_sum[1] = 8'd138;
    expected_cout[1] = 0;

    test_vectors_a[2] = 8'd62;
    test_vectors_b[2] = 8'd186;
    expected_sum[2] = 8'd248;
    expected_cout[2] = 0;

    test_vectors_a[3] = 8'd173;
    test_vectors_b[3] = 8'd138;
    expected_sum[3] = 8'd55;
    expected_cout[3] = 1;

    test_vectors_a[4] = 8'd51;
    test_vectors_b[4] = 8'd18;
    expected_sum[4] = 8'd69;
    expected_cout[4] = 0;

    test_vectors_a[5] = 8'd16;
    test_vectors_b[5] = 8'd166;
    expected_sum[5] = 8'd182;
    expected_cout[5] = 0;

    test_vectors_a[6] = 8'd45;
    test_vectors_b[6] = 8'd100;
    expected_sum[6] = 8'd145;
    expected_cout[6] = 0;

    test_vectors_a[7] = 8'd106;
    test_vectors_b[7] = 8'd89;
    expected_sum[7] = 8'd195;
    expected_cout[7] = 0;

    test_vectors_a[8] = 8'd102;
    test_vectors_b[8] = 8'd142;
    expected_sum[8] = 8'd244;
    expected_cout[8] = 0;

    test_vectors_a[9] = 8'd72;
    test_vectors_b[9] = 8'd235;
    expected_sum[9] = 8'd51;
    expected_cout[9] = 1;

    // Apply test cases
    for (i = 0; i < 10; i = i + 1) begin
      a = test_vectors_a[i];
      b = test_vectors_b[i];
      #10;
      print_results(a, b, expected_sum[i], expected_cout[i]);
    end

    // Finish simulation
    #10 $finish;
  end

endmodule
