module nand_using_mux (
    input a,
    input b,
    output reg y
);

always @(*) begin
    if (a == 1'b0)
        y = 1'b1;
    else
        y = ~b;
end

endmodule
