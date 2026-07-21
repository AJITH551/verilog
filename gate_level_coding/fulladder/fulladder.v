module fulladder(input A,B,C,output sum,carry);
wire S1,S2,S3,S4;
xor(S1,A,B);
xor(S2,A,C);
and(S3,B,C);
and(S4,A,B);
or(carry,S2,S3);
endmodule

