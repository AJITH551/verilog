module encoder(input i0,i1,i2,i3,
output reg [1:0]y);
always @(*) begin
if(i3)
   y=2'b11;
else if(i2)
   y=2'b10;
else if(i1)
   y=2'b01;
else
   y=2'b00;
end
endmodule
	
	
