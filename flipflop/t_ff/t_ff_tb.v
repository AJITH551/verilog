module t_ff_tb;

reg clk;
reg t;
wire q;

t_ff uut(
    .clk(clk),
    .t(t),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

initial
begin
    $monitor("Time=%0t clk=%b t=%b q=%b",
             $time, clk, t, q);

    clk = 0;
    t = 0;

    #10 t = 1;   // Toggle
    #20 t = 0;   // Hold
    #20 t = 1;   // Toggle
    #20 t = 1;   // Continue toggling
    #20 t = 0;   // Hold

    #20 $finish;
end

endmodule
