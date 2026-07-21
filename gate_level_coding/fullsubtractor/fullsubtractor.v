module full_subtractor(
input a,b,c,
output diff,borrow);
wire w1,w2,w3,w4,w5;
xor(w1,a,b);
xor(diff,w1,c);
not(w2,a);
and(w3,w2,b);
not(w4,w1);
and(w5,w4,c);
or(borrow,w3,w5);
endmodule
