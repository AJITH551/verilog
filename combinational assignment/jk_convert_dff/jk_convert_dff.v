module jk_using_dff (
    input clk,
    input reset,
    input J,
    input K,
    output reg Q
);

wire D;

// JK to D conversion
assign D = (J & ~Q) | (~K & Q);

// D Flip-Flop
always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
