module top_module(
    input clk,
    input reset,
    input in,
    output reg out
);

parameter A = 3'd0,
          B = 3'd1,
          C = 3'd2,
          D = 3'd3,
          E = 3'd4;

reg [2:0] state, next_state;

//
// Next-state logic
//
always @(*) begin
    case (state)

        A: begin
            if (in)
                next_state = B;
            else
                next_state = A;
        end

        B: begin
            if (in)
                next_state = B;
            else
                next_state = C;
        end

        C: begin
            if (in)
                next_state = D;
            else
                next_state = A;
        end

        D: begin
            if (in)
                next_state = E;
            else
                next_state = C;
        end

        E: begin
            if (in)
                next_state = B;   // Overlapping
            else
                next_state = C;   // Overlapping
        end

        default:
            next_state = A;

    endcase
end

//
// State register
//
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= A;
    else
        state <= next_state;
end

//
// Output logic (Moore FSM)
//
always @(*) begin
    case(state)
        E: out = 1'b1;
        default: out = 1'b0;
    endcase
end

endmodule
