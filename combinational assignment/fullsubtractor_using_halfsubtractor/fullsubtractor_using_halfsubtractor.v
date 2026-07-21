module fullsubtractor_using_halfsubtractor(input a,b,output dif,bor);
assign dif=a^b;
assign bor=~a&b;
endmodule

module fullsubtractor(input a,b,c, output dif,bor);
wire y1,y2,y3;
//1st halfsubtractor
fullsubtractor_using_halfsubtractor a1(.a(a),.b(b),.dif(y1),.bor(y2));
//2nd half subtractor
fullsubtractor_using_halfsubtractor a2(.a(y1),.b(c),.dif(dif),.bor(y3));

assign bor=y2|y3;
endmodule
 

