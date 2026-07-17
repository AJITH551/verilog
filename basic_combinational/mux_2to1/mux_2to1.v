module mux2to1(input a,b,sel,output y);
assign y=(~sel&a)|(sel&b);
endmodule
