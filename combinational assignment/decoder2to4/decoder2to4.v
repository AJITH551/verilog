module decoder_2to4(input i0,i1,output y0,y1,y2,y3);
assign y0=~i1&~i0;
assign y1=~i1&i0;
assign y2=i1&~i0;
assign y3=i1&i0;
endmodule

