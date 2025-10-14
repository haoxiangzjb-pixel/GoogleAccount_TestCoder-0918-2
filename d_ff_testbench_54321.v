`timescale 1ns / 1ps

module d_ff_testbench_54321;

    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation: 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5ns
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst_n = 0;
        d = 0;
        #10; // Wait for some time

        // De-assert reset
        rst_n = 1;
        #10;

        // Apply test vectors
        d = 1; #20;
        d = 0; #20;
        d = 1; #20;
        d = 0; #20;
        d = 1; #20;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | D: %b | Q: %b", $time, d, q);
    end

endmodule