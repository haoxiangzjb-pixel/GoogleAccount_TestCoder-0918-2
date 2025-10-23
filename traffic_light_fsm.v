// 交通灯控制器 - 使用有限状态机
module traffic_light_fsm (
    input wire clk,           // 时钟信号
    input wire reset,         // 复位信号
    output reg [2:0] ns_light, // 南北方向灯 (bit2:红, bit1:黄, bit0:绿)
    output reg [2:0] ew_light  // 东西方向灯 (bit2:红, bit1:黄, bit0:绿)
);

// 定义状态
parameter RED_NS = 3'b001,     // 南北方向红灯
          GREEN_EW = 3'b010,   // 东西方向绿灯
          YELLOW_EW = 3'b011,  // 东西方向黄灯
          RED_EW = 3'b100,     // 东西方向红灯
          GREEN_NS = 3'b101,   // 南北方向绿灯
          YELLOW_NS = 3'b110;  // 南北方向黄灯

// 状态寄存器
reg [2:0] current_state, next_state;

// 计数器用于控制灯的时间长度
reg [21:0] counter;  // 使用22位计数器，可以计数到约400万

// 时钟分频 - 假设输入时钟为50MHz，需要1秒的时钟周期
// 50MHz时钟需要计数50,000,000次得到1秒
parameter COUNT_MAX = 24'd50_000_000;  // 1秒的计数值

// 状态转移逻辑
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= RED_NS;
        counter <= 0;
    end else begin
        if (counter < COUNT_MAX) begin
            counter <= counter + 1;
        end else begin
            counter <= 0;
            current_state <= next_state;
        end
    end
end

// 确定下一个状态
always @(*) begin
    case (current_state)
        RED_NS: next_state = GREEN_NS;           // 红灯(南北) -> 绿灯(南北)
        GREEN_NS: next_state = YELLOW_NS;        // 绿灯(南北) -> 黄灯(南北)
        YELLOW_NS: next_state = RED_EW;          // 黄灯(南北) -> 红灯(东西)
        RED_EW: next_state = GREEN_EW;           // 红灯(东西) -> 绿灯(东西)
        GREEN_EW: next_state = YELLOW_EW;        // 绿灯(东西) -> 黄灯(东西)
        YELLOW_EW: next_state = RED_NS;          // 黄灯(东西) -> 红灯(南北)
        default: next_state = RED_NS;
    endcase
end

// 输出逻辑 - 控制灯的状态
always @(*) begin
    case (current_state)
        // 南北方向通行，东西方向停止
        RED_NS: begin
            ns_light = 3'b100;  // 南北红灯
            ew_light = 3'b001;  // 东西红灯
        end
        GREEN_NS: begin
            ns_light = 3'b001;  // 南北绿灯
            ew_light = 3'b100;  // 东西红灯
        end
        YELLOW_NS: begin
            ns_light = 3'b010;  // 南北黄灯
            ew_light = 3'b100;  // 东西红灯
        end
        // 东西方向通行，南北方向停止
        RED_EW: begin
            ns_light = 3'b100;  // 南北红灯
            ew_light = 3'b001;  // 东西红灯
        end
        GREEN_EW: begin
            ns_light = 3'b100;  // 南北红灯
            ew_light = 3'b001;  // 东西绿灯
        end
        YELLOW_EW: begin
            ns_light = 3'b100;  // 南北红灯
            ew_light = 3'b010;  // 东西黄灯
        end
        default: begin
            ns_light = 3'b100;  // 南北红灯
            ew_light = 3'b001;  // 东西红灯
        end
    endcase
end

endmodule

// 测试模块
module traffic_light_tb;
    reg clk, reset;
    wire [2:0] ns_light, ew_light;
    
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    // 产生时钟信号 (快速仿真用)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10个时间单位一个周期
    end
    
    // 初始化和测试
    initial begin
        reset = 1;
        #20;
        reset = 0;
        
        // 运行几个周期
        #5000;
        $display("Simulation finished");
        $finish;
    end
    
    // 监控信号变化
    initial begin
        $monitor("Time=%0t ns_light=%b ew_light=%b", $time, ns_light, ew_light);
    end
endmodule