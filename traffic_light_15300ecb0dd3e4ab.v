// Traffic Light Controller using Finite State Machine
module traffic_light_fsm (
    input wire clk,
    input wire reset,
    output reg [2:0] ns_light,  // North-South lights: [2] = Red, [1] = Yellow, [0] = Green
    output reg [2:0] ew_light   // East-West lights: [2] = Red, [1] = Yellow, [0] = Green
);

    // Define states
    typedef enum reg [2:0] {
        NS_GREEN  = 3'b000,  // North-South Green, East-West Red
        NS_YELLOW = 3'b001,  // North-South Yellow, East-West Red
        EW_GREEN  = 3'b010,  // North-South Red, East-West Green
        EW_YELLOW = 3'b011,  // North-South Red, East-West Yellow
        ALL_RED   = 3'b100   // All Red (safety state)
    } state_t;
    
    state_t current_state, next_state;
    
    // Counter for timing control
    reg [23:0] counter;  // 24-bit counter for longer timing periods
    parameter NS_GREEN_TIME = 24'd5000000;  // Time for NS green (adjust as needed)
    parameter NS_YELLOW_TIME = 24'd1000000; // Time for NS yellow
    parameter EW_GREEN_TIME = 24'd5000000;  // Time for EW green
    parameter EW_YELLOW_TIME = 24'd1000000; // Time for EW yellow
    parameter ALL_RED_TIME = 24'd500000;    // Time for all red (safety)
    
    // State register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= NS_GREEN;
            counter <= 24'd0;
        end else begin
            if (counter < 24'd1) begin  // Just changed state, reset counter
                current_state <= next_state;
                counter <= 24'd0;
            end else begin
                counter <= counter + 24'd1;
            end
        end
    end
    
    // Next state logic
    always_comb begin
        case (current_state)
            NS_GREEN: 
                if (counter >= NS_GREEN_TIME)
                    next_state = NS_YELLOW;
                else
                    next_state = NS_GREEN;
                    
            NS_YELLOW:
                if (counter >= NS_YELLOW_TIME)
                    next_state = EW_GREEN;
                else
                    next_state = NS_YELLOW;
                    
            EW_GREEN:
                if (counter >= EW_GREEN_TIME)
                    next_state = EW_YELLOW;
                else
                    next_state = EW_GREEN;
                    
            EW_YELLOW:
                if (counter >= EW_YELLOW_TIME)
                    next_state = NS_GREEN;
                else
                    next_state = EW_YELLOW;
                    
            ALL_RED:
                if (counter >= ALL_RED_TIME)
                    next_state = NS_GREEN;
                else
                    next_state = ALL_RED;
                    
            default:
                next_state = NS_GREEN;
        endcase
    end
    
    // Output logic - set traffic light states based on current state
    always_comb begin
        case (current_state)
            NS_GREEN: begin
                ns_light = 3'b001;  // NS Green ON
                ew_light = 3'b100;  // EW Red ON
            end
            NS_YELLOW: begin
                ns_light = 3'b010;  // NS Yellow ON
                ew_light = 3'b100;  // EW Red ON
            end
            EW_GREEN: begin
                ns_light = 3'b100;  // NS Red ON
                ew_light = 3'b001;  // EW Green ON
            end
            EW_YELLOW: begin
                ns_light = 3'b100;  // NS Red ON
                ew_light = 3'b010;  // EW Yellow ON
            end
            ALL_RED: begin
                ns_light = 3'b100;  // NS Red ON
                ew_light = 3'b100;  // EW Red ON
            end
            default: begin
                ns_light = 3'b100;  // NS Red ON (safe state)
                ew_light = 3'b100;  // EW Red ON (safe state)
            end
        endcase
    end
    
endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end
    
    // Test sequence
    initial begin
        $display("Time, NS_Light, EW_Light, State Description");
        $monitor("%0t, NS=%b, EW=%b", $time, ns_light, ew_light);
        
        reset = 1;
        #20;
        reset = 0;
        
        // Run simulation for sufficient time to see all states
        #150000000;  // Run for a long time to see multiple cycles
        
        $finish;
    end
    
endmodule