// Mux 4:1 using 2:1

module mux2to1(input i0,i1,s0,output y);

assign y=~s0&i0|s0&i1;

endmodule

module mux4to1(input i0,i1,i2,i3,s0,s1,output y);
wire a,b;

// 1st 2to1 mux

mux2to1 a1(.i0(i0),.i1(i1),.s0(s0),.y(a));

//2nd 2 to1 mux

mux2to1 a2(.i0(i2),.i1(i3),.s0(s0),.y(b));

//3rd 2 to1 mux

mux2to1 a3(.i0(a),.i1(b),.s0(s1),.y(y));

endmodule

