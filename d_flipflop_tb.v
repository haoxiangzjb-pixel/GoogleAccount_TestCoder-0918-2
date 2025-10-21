// Testbench for D-Flip-Flop
module d_flipflop_tb;

// Inputs
reg clk;
reg rst;
reg d;

// Outputs
wire q;
wire q_bar;

// Instantiate the D-Flip-Flop module
d_flipflop uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10 time unit clock period
end

// Test stimulus
initial begin
    // Initialize inputs
    rst = 1;
    d = 0;
    
    // Reset the flip-flop
    #10;
    rst = 0;
    
    // Test various input combinations
    #10 d = 1;     // Set D to 1
    #20 d = 0;     // Set D to 0
    #20 d = 1;     // Set D to 1
    #20 d = 0;     // Set D to 0
    
    // Test reset functionality
    #10 rst = 1;   // Reset
    #10 rst = 0;   // Release reset
    #10 d = 1;     // Set D to 1 after reset
    
    // End simulation
    #20 $finish;
end

// Monitor signals
initial begin
    $monitor("Time: %0t | CLK: %b | RST: %b | D: %b | Q: %b | Q_BAR: %b", 
             $time, clk, rst, d, q, q_bar);
end

endmodule