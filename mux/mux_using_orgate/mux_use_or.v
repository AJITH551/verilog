module mux_or (input a,input b,output reg y
);
always @(*) begin
    if (a == 0)
        y = b;
    else
        y = 1;
end

endmodule
