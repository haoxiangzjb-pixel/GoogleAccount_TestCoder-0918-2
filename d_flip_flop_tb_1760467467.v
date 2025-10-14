// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module d_flip_flop_tb;
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    // Assuming the D Flip-Flop module is named 'd_flip_flop'
    // with ports clk, reset, d (input) and q (output).
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5 time units (10ns period)
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10; // Wait for 10ns
        reset = 0; // Release reset

        // Apply test vectors
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // End simulation
        #20 $finish;
    end

    // Optional: Monitor signals
    initial begin
        $monitor("Time: %0t ns, CLK: %b, RESET: %b, D: %b, Q: %b", $time, clk, reset, d, q);
    end

endmodule