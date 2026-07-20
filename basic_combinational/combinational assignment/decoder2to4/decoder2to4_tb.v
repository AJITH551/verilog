module decoder_2to4_tb;
reg i0,i1;
wire y0,y1,y2,y3;
decoder_2to4 uut(.i0(i0),.i1(i1),.y0(y0),.y1(y1),.y2(y2),.y3(y3));
initial begin
$monitor("i0=%b,i1=%b,y0=%b,y1=%b,y2=%b,y3=%b",i0,i1,y0,y1,y2,y3);
i1=0;i0=0;#10;
i1=0;i0=1;#10;
i1=1;i0=0;#10;
i1=1;i0=1;#10;
$finish;
end endmodule

