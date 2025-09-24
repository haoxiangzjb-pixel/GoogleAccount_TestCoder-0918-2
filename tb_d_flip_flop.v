// Тестовая плата Verilog для D-триггера
`timescale 1ns / 1ps

module tb_d_flip_flop ();
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test data input changes
        d = 1;
        #20;
        d = 0;
        #20;
        d = 1;
        #20;

        // Assert reset
        reset = 1;
        #10;

        // Deassert reset and continue
        reset = 0;
        d = 1;
        #20;
        d = 0;
        #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns, CLK: %b, RESET: %b, D: %b, Q: %b", $time, clk, reset, d, q);
    end

endmodule
