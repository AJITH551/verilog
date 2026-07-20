module qa_1_tb;
reg a,b,c;
wire out;
top_module uut(.a(a),.b(b),.c(c),.out(out));
initial begin
$monitor("A=%b,B=%b,c=%b,out=%b",a,b,c,out);
a=0;b=0;c=0;#10;
a=0;b=0;c=1;#10;
a=0;b=1;c=0;#10;
a=0;b=1;c=1;#10;
a=1;b=0;c=0;#10;
a=1;b=0;c=1;#10;
a=1;b=1;c=0;#10;
a=1;b=1;c=1;#10;


$finish;
end
endmodule 
