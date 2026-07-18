module full_adder(input A,B,C, output sum,carry);
assign sum =(A^B^C);
assign carry = (A&B|B&C|A&C);
endmodule
