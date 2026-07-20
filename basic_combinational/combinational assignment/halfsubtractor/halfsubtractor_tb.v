module halfsubtractor_tb;
reg a,b;
wire dif,bor;
halfsubtractor uut(.a(a),.b(b),.dif(dif),.bor(bor));
initial begin
$monitor ("a=%b,b=%b,dif=%b,bor=%b",a,b,dif,bor);
a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;
$finish;
end 
endmodule

