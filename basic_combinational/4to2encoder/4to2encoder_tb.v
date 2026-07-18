module encoder4to1;
reg d0,d1,d2,d3;
wire Y0,Y1;
encoder4to2  uut(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.Y0(Y0),.Y1(Y1));
initial begin
$monitor("d0=%b,d1=%b,d2=%b,d3=%b,y0=%b,y1=%b",d0,d1,d2,d3,Y0,Y1);
d0=1;d1=0;d2=0;d3=0;#10;
d0=0;d1=1;d2=0;d3=0;#10;
d0=0;d1=0;d2=1;d3=0;#10;
d0=0;d1=0;d2=0;d3=1;#10;
$finish;
end
endmodule
