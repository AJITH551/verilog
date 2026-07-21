module half_sub_tb;
reg a,b;
wire diff,borrow;
half_subtractor HS1(
.a(a),
.b(b),
.diff(diff),
.borrow(borrow)
);
initial begin
$monitor("time=%0t a=%b,b=%b,diff=%b,borrow=%b",$time,a,b,diff,borrow);
end
initial begin
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
#40;
$finish;
end
endmodule
