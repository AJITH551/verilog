`timescale 1ns/1ps

module tb_top_module;

    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate the DUT
    top_module uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        in = 0;

        // Release reset
        #10 reset = 0;

        // Apply input sequence: 1011
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;   // 1011 detected

        // Apply another sequence: 1011
        in = 0; #10;
        in = 1; #10;
        in = 0; #10;
        in = 1; #10;
        in = 1; #10;   // 1011 detected again

        #20;
        $finish;
    end

    // Display values
    initial begin
        $monitor("Time=%0t  Reset=%b  In=%b  Out=%b",
                  $time, reset, in, out);
    end

endmodule
