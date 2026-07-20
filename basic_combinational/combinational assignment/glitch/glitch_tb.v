module glitch_tb;
reg pclk_62,pclk_250;
reg [1:0]rate;
wire pclk;
glitch uut(.pclk_62_5mhz(pclk_62),.pclk_250mhz(pclk_250),.rate(rate),.pclk(pclk));
initial begin
$monitor("time =%0t pclk_62=%b pclk_250=%b rate=%b pclk=%b",$time,pclk_62,pclk_250,rate,pclk);
end
initial begin
pclk_62=0;
forever #8 pclk_62=~pclk_62;
end
initial begin
pclk_250=0;
forever #2 pclk_250=~pclk_250;
end
initial begin
rate=2'b00;#10;
rate=2'b10;#10;
rate=2'b01;#10;
$finish;
end
endmodule
