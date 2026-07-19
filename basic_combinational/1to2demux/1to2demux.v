module demux_1to2(input d,s, output y0,y1);
assign y0=~s&d;
assign y1=s&d;
endmodule
