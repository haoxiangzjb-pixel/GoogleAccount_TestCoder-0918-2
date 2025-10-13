// Testbench for D Flip-Flop
module tb_d_flip_flop;

    // Declare signals
    reg clk;
    reg rst;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );

    // Clock generation: 10 time units period
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        $display("Starting D Flip-Flop Test");
        $monitor("Time: %0t, clk: %b, rst: %b, d: %b, q: %b", $time, clk, rst, d, q);

        // Initial state
        rst = 1;
        d = 0;
        #10; // Wait for a few time units

        // Release reset
        rst = 0;
        #10;

        // Test sequence
        d = 1; // Set D high
        #20;
        d = 0; // Set D low
        #20;
        d = 1; // Set D high again
        #20;

        // End simulation
        $display("Test completed.");
        $finish;
    end

endmodule