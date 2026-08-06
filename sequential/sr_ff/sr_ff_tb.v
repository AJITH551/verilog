`timescale 1ns/1ps

module sr_flipflop_tb;

    reg clk;
    reg reset;
    reg S;
    reg R;
    wire Q;

    // Instantiate the SR Flip-Flop
    sr_flipflop uut (
        .clk(clk),
        .reset(reset),
        .S(S),
        .R(R),
        .Q(Q)
    );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize
        clk   = 0;
        reset = 1;
        S     = 0;
        R     = 0;

        // Apply reset
        #10;
        reset = 0;

        // No Change (S=0, R=0)
        S = 0; R = 0;
        #10;

        // Set (S=1, R=0)
        S = 1; R = 0;
        #10;

        // No Change
        S = 0; R = 0;
        #10;

        // Reset (S=0, R=1)
        S = 0; R = 1;
        #10;

        // Invalid State (S=1, R=1)
        S = 1; R = 1;
        #10;

        // Back to No Change
        S = 0; R = 0;
        #10;

        $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("Time=%0t reset=%b S=%b R=%b Q=%b",
                 $time, reset, S, R, Q);
    end

endmodule
