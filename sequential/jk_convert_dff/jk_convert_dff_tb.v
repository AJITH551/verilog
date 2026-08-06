`timescale 1ns/1ps

module jk_using_dff_tb;

    reg clk;
    reg reset;
    reg J;
    reg K;
    wire Q;

    // Instantiate the module
    jk_using_dff uut (
        .clk(clk),
        .reset(reset),
        .J(J),
        .K(K),
        .Q(Q)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        J = 0;
        K = 0;

        // Reset the flip-flop
        #10;
        reset = 0;

        // 00 -> No Change
        J = 0; K = 0;
        #10;

        // 10 -> Set
        J = 1; K = 0;
        #10;

        // 00 -> No Change
        J = 0; K = 0;
        #10;

        // 01 -> Reset
        J = 0; K = 1;
        #10;

        // 11 -> Toggle
        J = 1; K = 1;
        #10;

        // 11 -> Toggle again
        J = 1; K = 1;
        #10;

        // 10 -> Set
        J = 1; K = 0;
        #10;

        // 01 -> Reset
        J = 0; K = 1;
        #10;

        $finish;
    end

    // Display values
    initial begin
        $monitor("Time=%0t | Reset=%b | J=%b | K=%b | Q=%b",
                  $time, reset, J, K, Q);
    end

endmodule
