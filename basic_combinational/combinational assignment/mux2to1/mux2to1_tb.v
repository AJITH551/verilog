module mux_2to1_tb;
reg s,i0,i1;
wire y;
mux uut(.s(s),.i0(i0),.i1(i1),.y(y));
initial begin
i0=1;i1=0;s=0;#10;
i0=1;i1=0;s=0;#10;
i0=1;i1=0;s=1;#10;
i0=1;i1=1;s=1;#10;
$finish;
end
initial begin
$monitor("s=%b i0=%b i1=%b y=%b",s,i0,i1,y); 
end
endmodule
