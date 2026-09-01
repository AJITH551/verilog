module xor_using_mux (
    input a,
    input b,
    output reg y
);

always @(*) begin
    if (a == 1'b0)
        y = b;
    else
        y = ~b;
end

endmodule
