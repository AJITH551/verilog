module full_subtractor_tb;
reg a,b,c;
wire diff,borrow;
full_subtractor fs1(
.a(a),.b(b),.c(c),.diff(diff),.borrow(borrow));
initial begin 
a=0;b=0;c=0;#10;
a=0;b=0;c=1;#10;
a=0;b=1;c=0;#10;
a=0;b=1;c=1;#10;
a=1;b=0;c=0;#10;
a=1;b=0;c=1;#10;
a=1;b=1;c=0;#10;
a=1;b=1;c=1;#10;
end
initial begin
$monitor("time=%0t a=%b,c=%b,diff=%b,borrow=%b",$time,a,b,c,diff,borrow);
#80 $finish;
end
endmodule
