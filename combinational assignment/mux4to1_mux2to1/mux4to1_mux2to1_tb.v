module mux4to1_tb;
reg i0,i1,i2,i3;
reg s0,s1;
wire y;
mux4to1 uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y));
initial begin
i0 = 0; i1 = 1; i2 = 0; i3 = 1;
$monitor("s1=%b s0=%b y=%b", s1, s0, y);
s1=0;s0=0;#10;
s1=0;s0=1;#10;
s1=1;s0=0;#10;
s1=1;s0=1;#10;
$finish;
end
endmodule

