module half_subtractor(
input a,b,
output diff,borrow);
xor(diff,a,b);
not(w1,a);
and(borrow,w1,b);
endmodule
