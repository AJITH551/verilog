module d_ff_tb;
reg clk,rst,d;
wire y;
d_ff uut(.clk(clk),.rst(rst),.d(d),.y(y));
initial begin
clk=1;
forever #5 clk=~clk;
end
initial begin
$monitor("time=%0t rst=%b clk=%b d=%b y=%b",$time,rst,clk,d,y);
rst=0;
d=0;
#10 rst=1;
#10 d=1;
#10 d=0;
#10 d=1;
#10 d=0;
#10$finish;
end
endmodule
