/*module jk_ff_tb;

reg j;
reg k;
reg clk;
wire q;

// Instantiate the JK Flip-Flop
jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q);
);

// Clock Generation
always #5 clk = ~clk;

initial
begin

$monitor("Time=%0t clk=%b J=%b K=%b Q=%b",
              $time, clk, j, k, q);
    // Initialize
    clk = 0;
    j = 0;
    k = 0;

    // Apply test vectors

    #10 j = 0; k = 0;   // No Change

    #10 j = 0; k = 1;   // Reset

    #10 j = 1; k = 0;   // Set

    #10 j = 1; k = 1;   // Toggle

    #10 j = 1; k = 1;   // Toggle Again

    #10 j = 0; k = 0;   // Hold

    #20 $finish;
end

endmodule*/

module jk_ff_tb;

reg j;
reg k;
reg clk;
wire q;

// Instantiate the JK Flip-Flop
jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .q(q)
);

// Clock Generation
always #5 clk = ~clk;

initial
begin
    $monitor("Time=%0t clk=%b J=%b K=%b Q=%b",
              $time, clk, j, k, q);

    // Initialize
    clk = 0;
    j = 0;
    k = 0;

    // Apply test vectors
    #10 j = 0; k = 0;   // Hold
    #10 j = 0; k = 1;   // Reset
    #10 j = 1; k = 0;   // Set
    #10 j = 1; k = 1;   // Toggle
    #10 j = 1; k = 1;   // Toggle Again
    #10 j = 0; k = 0;   // Hold

    #20 $finish;
end

endmodule
