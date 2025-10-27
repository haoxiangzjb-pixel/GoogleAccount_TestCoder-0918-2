// Testbench for D Flip-Flop
module d_ff_testbench;
  
  // Declaration of signals
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;

  // Instantiate the D Flip-Flop module
  // Note: You'll need to have the actual D flip-flop module named 'd_ff'
  d_ff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );

  // Generate clock signal
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles with reset active
    #15;
    reset = 0;
    
    // Apply test vectors
    #10 d = 1;
    #20 d = 0;
    #20 d = 1;
    #20 d = 0;
    #20 d = 1;
    
    // Test reset functionality
    #10 reset = 1;
    #10 reset = 0;
    #10 d = 1;
    #20 d = 0;
    
    // End simulation
    #20 $finish;
  end

  // Monitor output signals
  initial begin
    $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_BAR: %b", 
             $time, clk, reset, d, q, q_bar);
  end

endmodule