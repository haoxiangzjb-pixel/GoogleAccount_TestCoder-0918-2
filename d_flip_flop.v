// D Flip-Flop module
module d_flip_flop (
    input  clk,
    input  rst_n,
    input  d,
    output reg q,
    output reg q_bar
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 1'b0;
            q_bar <= 1'b1;
        end
        else begin
            q <= d;
            q_bar <= ~d;
        end
    end
endmodule