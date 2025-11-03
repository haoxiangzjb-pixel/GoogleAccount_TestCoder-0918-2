// Testbench for D Flip-Flop
`timescale 1ns/1ps

module dff_testbench;
  
  // D Flip-Flop inputs and outputs
  reg clk;
  reg reset;
  reg d;
  wire q, q_bar;
  
  // Instantiate the D Flip-Flop module
  // Assuming a simple positive edge triggered D flip-flop with async reset
  dff dff_inst (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation - 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle every 5ns to get 10ns period
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles with reset active
    #15;
    
    // Deassert reset
    reset = 0;
    
    // Apply test patterns
    #10 d = 1;     // Set D to 1
    #20 d = 0;     // Set D to 0
    #20 d = 1;     // Set D to 1
    #20 d = 0;     // Set D to 0
    #20 d = 1;     // Set D to 1
    
    // Test reset functionality
    #10 reset = 1; // Assert reset
    #10 reset = 0; // Deassert reset
    #10 d = 0;     // Set D to 0
    #20 d = 1;     // Set D to 1
    
    // End simulation
    #30 $finish;
  end
  
  // Monitor important signals
  initial begin
    $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_BAR: %b", 
             $time, clk, reset, d, q, q_bar);
  end
  
endmodule

// Simple D Flip-Flop module for testing (if not already defined elsewhere)
module dff (
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_bar
);

  assign q_bar = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule