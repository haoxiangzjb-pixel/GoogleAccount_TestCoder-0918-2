// Traffic Light Controller using Finite State Machine
// Controls a basic traffic light sequence: Red -> Green -> Yellow -> Red

module traffic_light_controller (
    input wire clk,           // System clock
    input wire reset,         // Active high reset
    output reg [2:0] lights   // 3-bit output: [2] Red, [1] Yellow, [0] Green
);

    // Define states for the traffic light FSM
    typedef enum logic [1:0] {
        RED_STATE   = 2'b00,  // Red light on
        GREEN_STATE = 2'b01,  // Green light on
        YELLOW_STATE = 2'b10  // Yellow light on
    } state_t;

    state_t current_state, next_state;

    // Counter for timing control (assuming 1Hz clock for demo)
    reg [23:0] counter;  // 24-bit counter for longer timing periods
    parameter RED_TIME = 24'd5000000;     // Red light duration (5 seconds at 10MHz clock)
    parameter GREEN_TIME = 24'd3000000;   // Green light duration (3 seconds at 10MHz clock)
    parameter YELLOW_TIME = 24'd1000000;  // Yellow light duration (1 second at 10MHz clock)

    // State register
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED_STATE;
            counter <= 24'd0;
        end else begin
            current_state <= next_state;
            if (current_state != next_state) begin
                counter <= 24'd0;  // Reset counter when changing states
            end else begin
                counter <= counter + 1;
            end
        end
    end

    // Next state logic
    always_comb begin
        case (current_state)
            RED_STATE: begin
                if (counter >= RED_TIME) begin
                    next_state = GREEN_STATE;
                end else begin
                    next_state = RED_STATE;
                end
            end
            
            GREEN_STATE: begin
                if (counter >= GREEN_TIME) begin
                    next_state = YELLOW_STATE;
                end else begin
                    next_state = GREEN_STATE;
                end
            end
            
            YELLOW_STATE: begin
                if (counter >= YELLOW_TIME) begin
                    next_state = RED_STATE;
                end else begin
                    next_state = YELLOW_STATE;
                end
            end
            
            default: next_state = RED_STATE;
        endcase
    end

    // Output logic - set the lights based on current state
    always_comb begin
        case (current_state)
            RED_STATE: lights = 3'b100;      // Red on (bit 2)
            GREEN_STATE: lights = 3'b001;    // Green on (bit 0)
            YELLOW_STATE: lights = 3'b010;   // Yellow on (bit 1)
            default: lights = 3'b100;        // Default to red
        endcase
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_controller;
    reg clk;
    reg reset;
    wire [2:0] lights;
    
    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .lights(lights)
    );
    
    // Generate a 10MHz clock (100ns period for simulation)
    initial begin
        clk = 0;
        forever #50 clk = ~clk;  // Toggle every 50ns (100ns period)
    end
    
    // Test sequence
    initial begin
        $display("Time, Lights (R Y G), State");
        $monitor("%0t, %b, %s", $time, lights, 
                 (lights == 3'b100) ? "RED" :
                 (lights == 3'b001) ? "GREEN" : 
                 (lights == 3'b010) ? "YELLOW" : "UNKNOWN");
        
        reset = 1;
        #100;
        reset = 0;
        
        // Run simulation for several cycles
        #10000000;  // Run for 10ms
        
        $finish;
    end
endmodule