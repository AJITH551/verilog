module d_ff_tb;

reg clk;
reg d;
wire q;
d_ff uut(
    .clk(clk),
    .d(d),
    .q(q)
);
always #5 clk = ~clk;
  

initial begin
	$monitor("Time=%0t clk=%b d=%b q=%b", $time, clk, d, q);
    clk = 0;
    d = 0;

    #10 d = 1;
    #10 d = 0;
    #10 d = 1;

    #20 $finish;
end

endmodule
