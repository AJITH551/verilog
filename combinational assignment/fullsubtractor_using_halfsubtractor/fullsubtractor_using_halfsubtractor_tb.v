module fullsubtractor_using_halfsubtractor_tb;
reg a,b,c;
wire dif,bor;
fullsubtractor uut(.a(a),.b(b),.c(c),.dif(dif),.bor(bor));
initial begin
	$monitor("a=%b,b=%b,c=%b,dif=%b,bor=%b",a,b,c,dif,bor);
{a,b,c}=3'b000;#10;
{a,b,c}=3'b001;#10;
{a,b,c}=3'b010;#10;
{a,b,c}=3'b011;#10;
{a,b,c}=3'b100;#10;
{a,b,c}=3'b101;#10;
{a,b,c}=3'b110;#10;
{a,b,c}=3'b111;#10;
$finish;
end
endmodule

