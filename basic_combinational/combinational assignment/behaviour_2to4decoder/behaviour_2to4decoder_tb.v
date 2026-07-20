module encoder_tb;
reg i0,i1,i2,i3;
wire [1:0]y;
encoder uut(.i0(i0),.i1(i1),.i2(i2),.i3(i3),.y(y));
initial begin
$monitor ("i0=%b i1=%b i2=%b i3=%b y=%b",i0,i1,i2,i3,y);
i0=1;i1=0;i2=0;i3=0;#10;
i0=0;i1=1;i2=0;i3=0;#10; 
i0=0;i1=0;i2=1;i3=0;#10; 
i0=0;i1=0;i2=0;i3=1;#10;
i0=1;i1=0;i2=1;i3=0;#10;
$finish;
end 
endmodule   
