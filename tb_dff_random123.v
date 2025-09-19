// Verilog Testbench for D Flip-Flop
// File name: tb_dff_random123.v

`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk;
    reg rst;
    reg d;

    // Outputs
    wire q;
    wire qn; // Optional, if your DFF has a complement output

    // Instantiate the Unit Under Test (UUT)
    // Assuming the DFF module is named 'dff'
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
        // .qn(qn) // Uncomment if using complement output
    );

    // Clock generation
    always #5 clk = ~clk; // 100MHz clock

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        d = 0;

        // Wait 10 ns for global reset to finish
        #10;
        rst = 0;

        // Apply stimulus
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // Hold final state
        #10;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time = %0t | clk = %b | rst = %b | d = %b | q = %b", $time, clk, rst, d, q);
    end

endmodule