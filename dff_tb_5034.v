// Testbench for D Flip-Flop
`include "dff.v"

module dff_tb;
    reg clk;
    reg rst;
    reg d;
    wire q;

    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;
        d = 0;

        // Apply stimulus
        #10 rst = 1; // Reset
        #10 rst = 0; d = 1; // Release reset, set D
        #10 d = 0; // Change D
        #10 d = 1; // Change D
        #10 d = 0; // Change D
        #10 $finish; // End simulation
    end

    always #5 clk = ~clk; // Clock toggles every 5 time units

endmodule