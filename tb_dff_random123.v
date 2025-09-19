// Verilog Testbench for D Flip-Flop
// File name: tb_dff_random123.v

`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    dff uut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        d = 0;

        // Display initial state
        $display("Time\tCLK\tD\tQ");
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        // Apply test vectors
        #10 d = 1;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        #10 d = 0;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        #10 d = 1;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        #10 d = 0;
        $display("%0t\t%b\t%b\t%b", $time, clk, d, q);

        // Finish simulation
        #20 $finish;
    end

endmodule