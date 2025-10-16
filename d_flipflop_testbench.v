// Testbench for D Flip-Flop
module d_flipflop_testbench;

    // Inputs
    reg clk;
    reg reset;
    reg d;
    
    // Outputs
    wire q;
    wire q_not;
    
    // Instantiate the D Flip-Flop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_not(q_not)
    );
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        
        // Wait for a few clock cycles with reset active
        #15;
        
        // Deassert reset
        reset = 0;
        
        // Apply test vectors
        #10 d = 1;     // Set D to 1
        #20 d = 0;     // Set D to 0
        #20 d = 1;     // Set D to 1
        #20 d = 0;     // Set D to 0
        #20 d = 1;     // Set D to 1
        
        // Test reset functionality
        #10 reset = 1; // Assert reset
        #20 reset = 0; // Deassert reset
        #10 d = 0;     // Set D to 0
        
        // Final check
        #20;
        
        // End simulation
        $display("Simulation completed");
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_NOT: %b", 
                 $time, clk, reset, d, q, q_not);
    end

endmodule

// D Flip-Flop Module (for reference/testing)
module d_flipflop (
    input clk,
    input reset,
    input d,
    output reg q,
    output wire q_not
);

    assign q_not = ~q;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else
            q <= d;
    end

endmodule