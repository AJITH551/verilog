module mux_4to1(input I0,I1,I2,I3,A,B, output Y);
assign y = (~A&~B&I0)|(~A&B&I1)|(A&~B&I2)|(A&B&I3);
endmodule
