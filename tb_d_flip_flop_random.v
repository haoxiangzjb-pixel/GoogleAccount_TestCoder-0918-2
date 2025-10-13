// Testbench for D Flip-Flop
module tb_d_flip_flop;
  reg clk;
  reg reset;
  reg d;
  wire q, q_not;

  // Instantiate the D Flip-Flop module
  // Assuming the D-FF module is defined in a file called d_flip_flop.v
  d_flip_flop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_not(q_not)
  );

  // Clock generation: 10 time units period
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clk every 5 time units
  end

  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    #10; // Wait for 10 time units

    reset = 0; // Deassert reset
    #10;
    $display("Time: %0t, Reset: %b, D: %b, Q: %b, Q_N: %b", $time, reset, d, q, q_not);

    d = 1; // Set D high
    #10;
    $display("Time: %0t, Reset: %b, D: %b, Q: %b, Q_N: %b", $time, reset, d, q, q_not);

    d = 0; // Set D low
    #10;
    $display("Time: %0t, Reset: %b, D: %b, Q: %b, Q_N: %b", $time, reset, d, q, q_not);

    d = 1; // Set D high again
    #20; // Wait for two clock cycles
    $display("Time: %0t, Reset: %b, D: %b, Q: %b, Q_N: %b", $time, reset, d, q, q_not);

    reset = 1; // Assert reset
    #10;
    $display("Time: %0t, Reset: %b, D: %b, Q: %b, Q_N: %b", $time, reset, d, q, q_not);

    $finish; // End simulation
  end

endmodule