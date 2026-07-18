module encoder4to2(input d0,d1,d2,d3,output Y0,Y1);
assign Y0=d2|d3;
assign Y1=d1|d3;
endmodule


