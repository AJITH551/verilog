module d_ff(input clk,rst,d,
output reg y);
always @(negedge clk or negedge rst) begin
if(!rst)
   y<=1'b0;
else
   y<=d;
end
endmodule
