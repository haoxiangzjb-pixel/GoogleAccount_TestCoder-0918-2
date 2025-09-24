// Testbench for D Flip-Flop
`timescale 1ns / 1ps
module tb_d_flip_flop;

    // Inputs
    reg clk;
    reg rst_n;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period is 10 time units (5ns high, 5ns low)
    end

    // Test stimulus
    initial begin
        // Initialize
        rst_n = 0; // Reset is active low, so start with 0 to reset
        d = 0;
        #15; // Wait for a few clock cycles in reset

        // De-assert reset
        rst_n = 1;
        #10; // Wait for one clock cycle after reset

        // Apply test vectors
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // End simulation
        #20;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t ns, CLK: %b, RST_N: %b, D: %b, Q: %b", $time, clk, rst_n, d, q);
    end

endmodule