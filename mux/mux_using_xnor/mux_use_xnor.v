module xnor_using_mux (
    input a,
    input b,
    output y
);

assign y = a ? b : ~b;

endmodule
