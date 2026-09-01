module mux_2to1(input i0,input i1,input s,output reg y);
always @(*)begin
if(s==0)
y=i0;
else
y=i1;
end 
endmodule
