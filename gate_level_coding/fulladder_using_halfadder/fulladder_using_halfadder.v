module fulladder_using_halfadder (
    input A, B, C,
    output sum, carry
);

wire S1, S2, S3;

xor (S1, A, B);
xor (sum, S1, C);

and (S2, A, B);
and (S3, C, S1);

or (carry, S3, S2);

endmodule
