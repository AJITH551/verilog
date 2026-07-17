module grey_to_binary_tb;
reg[3:0]G;
wire[3:0]B;
grey_to_binary dut(.B(B),.G(G));
initial begin
$monitor("B=%b,G=%b",B,G);
G=11;
end
endmodule
