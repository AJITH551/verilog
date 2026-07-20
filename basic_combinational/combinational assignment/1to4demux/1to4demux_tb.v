module demux_tb;
reg s0,s1,i;
wire y0,y1,y2,y3;
demux uut(.s0(s0),.s1(s1),.i(i),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
initial begin
$monitor("s1=%b s0=%b i=%b y0=%b y1=%b y2=%b y3=%b",s1,s0,i,y0,y1,y2,y3);
s1=0;s0=0;i=1;#10;
s1=0;s0=1;i=1;#10; 
s1=1;s0=0;i=1;#10; 
s1=1;s0=1;i=1;#10;
$finish;
end
endmodule 
