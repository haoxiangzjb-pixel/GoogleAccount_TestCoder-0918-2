`timescale 1ns/1ps

module d_flipflop_tb;

    reg clk;
    reg reset;
    reg d;
    wire q;

    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period
    end

    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10;

        // Release reset and test
        reset = 0;
        #10;

        // Test input changes
        d = 1;
        #20;

        d = 0;
        #20;

        d = 1;
        #20;

        // End simulation
        #20;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t ns, Reset: %b, D: %b, Q: %b", $time, reset, d, q);
    end

endmodule