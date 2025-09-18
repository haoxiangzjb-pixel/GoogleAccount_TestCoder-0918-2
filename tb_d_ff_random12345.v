// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_d_ff;

    // Declare inputs and outputs
    reg clk;
    reg rst_n;
    reg d;
    wire q;
    wire qn;

    // Instantiate the D Flip-Flop
    d_ff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        rst_n = 0;
        d = 0;

        // Apply reset
        #10 rst_n = 1;

        // Test D input changes
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