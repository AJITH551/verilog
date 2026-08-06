module t_ff (input clk,t,output reg q);

always@(posedge clk)
begin
if (t==1'b0)
q<=q;//hold
else
q<=~q;//toggle
end

endmodule

