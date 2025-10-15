module tb_d_flipflop;
    logic clk;
    logic reset;
    logic d;
    logic q;

    // Instantiate the D flip-flop
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
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

        // Test data input
        d = 1;
        #20;

        d = 0;
        #20;

        d = 1;
        #20;

        // Assert reset
        reset = 1;
        #10;

        // De-assert reset and check
        reset = 0;
        d = 0;
        #10;

        $finish; // End simulation
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t, Reset: %b, D: %b, Q: %b", $time, reset, d, q);
    end

endmodule