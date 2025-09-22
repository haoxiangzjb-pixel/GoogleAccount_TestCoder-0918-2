// Verilog Testbench for D Flip-Flop
// File: dff_testbench_random_name.v

`timescale 1ns / 1ps

module dff_testbench;

    // Declare signals for testing
    reg clk;
    reg rst_n;
    reg d;
    wire q;
    wire qn;

    // Instantiate the D Flip-Flop module (assuming it's named dff)
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        d = 0;

        // Apply reset
        #15 rst_n = 1;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t: clk = %b, rst_n = %b, d = %b, q = %b, qn = %b", $time, clk, rst_n, d, q, qn);
    end

endmodule