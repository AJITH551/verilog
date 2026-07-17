module mux4to1_tb;
reg I0,I1,I2,I3,A,B;
wire Y;
mux_4to1 uut(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.A(A),.B(B),.Y(Y));
initial begin
$monitor("I0=%b,I1=%b,I2=%b,I3=%b,A=%b,B=%b,Y=%b",I0,I1,I2,I3,A,B,Y);
A=0;B=0;#10;
A=0;B=1;#10;
A=1;B=0;#10;
A=1;B=1;#10;
$finish;
end
endmodule

