module mux(input s,
input i0,i1,
output y);
wire w1,w2;
and(w1,~s,i0);
and(w2,s,i1);
or(y,w1,w2);
endmodule
