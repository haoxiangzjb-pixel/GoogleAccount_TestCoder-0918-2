// Testbench for D Flip-Flop
module d_flip_flop_tb;
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period of 10 time units
    end

    // Apply test vectors
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test data
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #20; // Wait for a few more cycles

        $finish; // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t, CLK: %b, RESET: %b, D: %b, Q: %b", $time, clk, reset, d, q);
    end
endmodule