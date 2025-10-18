// Testbench for D-FlipFlop
`timescale 1ns/1ps

module dff_testbench;
  reg clk, reset, d;
  wire q, q_bar;

  // Instantiate the D-FlipFlop module
  d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles
    #20;
    
    // Release reset
    reset = 0;
    
    // Apply test vectors
    #10 d = 1;     // Set D to 1
    #20 d = 0;     // Set D to 0
    #20 d = 1;     // Set D to 1
    #20 d = 0;     // Set D to 0
    
    // Test with reset
    #10 reset = 1; // Assert reset
    #20 reset = 0; // Deassert reset
    #10 d = 1;     // Set D to 1
    
    // End simulation
    #50 $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("Time=%0t, CLK=%b, RESET=%b, D=%b, Q=%b, Q_BAR=%b", 
             $time, clk, reset, d, q, q_bar);
  end

endmodule