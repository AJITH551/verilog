module memory(input clk,input we,input re,input[2:0]address,input[7:0]data_in,output reg[7:0]data_out);
reg[7:0]mem[0:7];
always @(posedge clk)begin
if(we)
mem[address]<=data_in;
if(re)
data_out<=mem[address];

end 
endmodule



