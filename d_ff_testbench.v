// Verilog Testbench for D Flip-Flop
module d_ff_testbench;
    reg clk;
    reg reset;
    reg d;
    wire q, q_bar;

    // Instantiate the D Flip-Flop module
    d_ff uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period
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

        // End simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t, CLK: %b, RESET: %b, D: %b, Q: %b, Q_BAR: %b", $time, clk, reset, d, q, q_bar);
    end

endmodule