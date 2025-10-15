// Testbench for D Flip-Flop
`timescale 1ns/1ps

module d_flipflop_tb();
  
  // Internal signals
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;
  
  // Instantiate the D Flip-Flop module
  // Note: This assumes the D flip-flop module is named 'd_flipflop'
  // with inputs clk, reset, d and outputs q, q_bar
  d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation - 10ns period (100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5 time units
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles
    #15;
    
    // Release reset
    reset = 0;
    
    // Apply test vectors
    #10 d = 1;      // Set D to 1
    #20 d = 0;      // Set D to 0
    #20 d = 1;      // Set D to 1
    #20 d = 0;      // Set D to 0
    #20 d = 1;      // Set D to 1
    
    // End simulation
    #20 $finish;
  end
  
  // Monitor signals
  initial begin
    $monitor("Time: %0t | Reset: %b | D: %b | Q: %b | Q_Bar: %b", 
             $time, reset, d, q, q_bar);
  end

endmodule