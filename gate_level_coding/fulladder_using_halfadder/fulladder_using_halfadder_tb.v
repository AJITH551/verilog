module  fulladder_using_halfadder_tb;
reg A,B,C;
wire sum,carry;
fulladder_using_halfadder uut(.A(A),.B(B),.C(C),.sum(sum),.carry(carry));
initial begin
$monitor("A=%b,B=%b,C=%b,sum=%b,carry=%b",A,B,C,sum,carry);
A=0;B=0;C=0;#10;
A=0;B=0;C=1;#10;
A=0;B=1;C=0;#10;
A=0;B=1;C=1;#10;
A=1;B=0;C=0;#10;
A=1;B=0;C=1;#10;
A=1;B=1;C=0;#10;
A=1;B=1;C=1;#10;
$finish;
end
endmodule
