// Testbench for D Flip-Flop
module d_flipflop_testbench;
  
  // Declare inputs and outputs
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;
  
  // Instantiate the D Flip-Flop module
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
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
  end
  
  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles
    #10;
    reset = 0;  // Release reset
    
    // Test different input combinations
    #10;
    d = 1;
    #20;
    d = 0;
    #20;
    d = 1;
    #20;
    reset = 1;  // Reset the flip-flop
    #10;
    reset = 0;
    d = 1;
    #20;
    
    // Finish simulation
    $finish;
  end
  
  // Monitor outputs
  initial begin
    $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_BAR: %b", 
             $time, clk, reset, d, q, q_bar);
  end

endmodule