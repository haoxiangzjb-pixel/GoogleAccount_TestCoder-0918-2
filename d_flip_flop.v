// D Flip-Flop Module
module d_flip_flop (
    input  clk,
    input  rst_n, // Active-low reset
    input  d,
    output reg q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 1'b0; // Reset output to 0
        end else begin
            q <= d;    // Update output with input D
        end
    end

endmodule