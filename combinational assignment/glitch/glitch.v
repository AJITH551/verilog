module glitch(input pclk_62_5mhz,pclk_250mhz,
input [1:0]rate,
output reg pclk);
always @(*) begin
if(rate==2'b00)
    pclk=pclk_62_5mhz;
else if(rate==2'b10)
    pclk=pclk_250mhz;
else
    pclk=1'b0;
end
endmodule  
