// Testbench for D Flip-Flop
module test_d_flipflop;
  
  // Inputs
  reg clk;
  reg reset;
  reg d;
  
  // Output
  wire q;
  
  // Instantiate the D Flip-Flop module
  d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
  end
  
  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Apply reset
    #10;
    reset = 0;
    
    // Test different input combinations
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    d = 1;
    #10;
    d = 0;
    #10;
    
    // Additional reset test
    reset = 1;
    #10;
    reset = 0;
    #10;
    
    // Final test
    d = 1;
    #20;
    
    // End simulation
    $finish;
  end
  
  // Monitor output
  initial begin
    $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
  end

endmodule