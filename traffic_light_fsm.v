// Traffic Light Controller using Finite State Machine
// Controls traffic lights for main road and side road
// Main road: green for 50 seconds, yellow for 5 seconds, red for 55 seconds
// Side road: red for 55 seconds, green for 50 seconds, yellow for 5 seconds

module traffic_light_fsm (
    input wire clk,
    input wire reset,
    output reg [2:0] main_light,    // 3-bit: Red, Yellow, Green
    output reg [2:0] side_light     // 3-bit: Red, Yellow, Green
);

    // Light state definitions
    parameter RED = 3'b100;
    parameter YELLOW = 3'b010;
    parameter GREEN = 3'b001;
    
    // States for the FSM
    parameter MAIN_GREEN = 3'd0,    // Main road green, side road red
              MAIN_YELLOW = 3'd1,   // Main road yellow, side road red
              SIDE_GREEN = 3'd2,    // Main road red, side road green
              SIDE_YELLOW = 3'd3;   // Main road red, side road yellow
    
    // Internal signals
    reg [2:0] current_state, next_state;
    reg [31:0] counter;             // Counter for timing
    reg [31:0] max_count;           // Max count for current state
    
    // Clock divider to create 1-second intervals (assuming 50MHz clock)
    reg [24:0] clk_div;
    wire clk_1hz;
    
    // 1Hz clock generation (assuming 50MHz input clock)
    always @(posedge clk) begin
        if (reset)
            clk_div <= 0;
        else if (clk_div == 25000000)  // 50,000,000 / 2 = 25,000,000 for 1 sec
            clk_div <= 0;
        else
            clk_div <= clk_div + 1;
    end
    
    assign clk_1hz = (clk_div == 25000000) ? 1 : 0;

    // State register
    always @(posedge clk) begin
        if (reset)
            current_state <= MAIN_GREEN;
        else
            current_state <= next_state;
    end
    
    // Counter for timing each state
    always @(posedge clk_1hz or posedge reset) begin
        if (reset) begin
            counter <= 0;
        end
        else if (current_state != next_state) begin  // State changed, reset counter
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
        end
    end
    
    // Determine next state based on current state and timer
    always @(*) begin
        case (current_state)
            MAIN_GREEN: begin
                if (counter >= 50)  // 50 seconds for main green
                    next_state = MAIN_YELLOW;
                else
                    next_state = MAIN_GREEN;
            end
            
            MAIN_YELLOW: begin
                if (counter >= 5)   // 5 seconds for main yellow
                    next_state = SIDE_GREEN;
                else
                    next_state = MAIN_YELLOW;
            end
            
            SIDE_GREEN: begin
                if (counter >= 50)  // 50 seconds for side green
                    next_state = SIDE_YELLOW;
                else
                    next_state = SIDE_GREEN;
            end
            
            SIDE_YELLOW: begin
                if (counter >= 5)   // 5 seconds for side yellow
                    next_state = MAIN_GREEN;
                else
                    next_state = SIDE_YELLOW;
            end
            
            default: next_state = MAIN_GREEN;
        endcase
    end
    
    // Output logic - set light states based on current state
    always @(*) begin
        case (current_state)
            MAIN_GREEN: begin
                main_light = GREEN;
                side_light = RED;
            end
            
            MAIN_YELLOW: begin
                main_light = YELLOW;
                side_light = RED;
            end
            
            SIDE_GREEN: begin
                main_light = RED;
                side_light = GREEN;
            end
            
            SIDE_YELLOW: begin
                main_light = RED;
                side_light = YELLOW;
            end
            
            default: begin
                main_light = RED;
                side_light = RED;
            end
        endcase
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    wire [2:0] main_light;
    wire [2:0] side_light;
    
    // Instantiate the traffic light FSM
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .main_light(main_light),
        .side_light(side_light)
    );
    
    // Generate 50MHz clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // 10ns period = 50MHz
    end
    
    // Initialize and run simulation
    initial begin
        reset = 1;
        #100;
        reset = 0;
        
        // Run for 250 seconds of simulation time
        #2500000000;  // 250 seconds at 50MHz clock
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns | Main: %b | Side: %b | State: %s", 
                 $time, main_light, side_light, 
                 (uut.current_state == uut.MAIN_GREEN) ? "MAIN_GREEN" :
                 (uut.current_state == uut.MAIN_YELLOW) ? "MAIN_YELLOW" :
                 (uut.current_state == uut.SIDE_GREEN) ? "SIDE_GREEN" :
                 (uut.current_state == uut.SIDE_YELLOW) ? "SIDE_YELLOW" : "UNKNOWN");
    end
    
    // Write VCD file for waveform viewing
    initial begin
        $dumpfile("traffic_light_fsm.vcd");
        $dumpvars(0, tb_traffic_light_fsm);
    end
endmodule