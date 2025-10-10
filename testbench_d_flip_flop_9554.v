// Testbench for D Flip-Flop
module testbench_d_flip_flop;
    reg clk;
    reg rst_n;
    reg d;
    wire q;
    wire q_bar;

    // Instantiate the D Flip-Flop
    d_flip_flop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize
        $display("Time\tclk\trst_n\td\tq\tq_bar");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, rst_n, d, q, q_bar);

        // Assert reset
        rst_n = 0;
        d = 0;
        #10;
        assert (q == 0 && q_bar == 1) else $error("Reset failed!");
        $display("Reset test passed.");

        // Deassert reset and test input 0
        rst_n = 1;
        d = 0;
        #10;
        @(posedge clk); // Wait for next clock edge
        assert (q == 0 && q_bar == 1) else $error("D=0 test failed!");
        $display("D=0 test passed.");

        // Test input 1
        d = 1;
        #10;
        @(posedge clk); // Wait for next clock edge
        assert (q == 1 && q_bar == 0) else $error("D=1 test failed!");
        $display("D=1 test passed.");

        // Test input 0 again
        d = 0;
        #10;
        @(posedge clk); // Wait for next clock edge
        assert (q == 0 && q_bar == 1) else $error("D=0 (again) test failed!");
        $display("D=0 (again) test passed.");

        // Finish simulation
        #20;
        $finish;
    end

endmodule