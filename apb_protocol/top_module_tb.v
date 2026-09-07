`timescale 1ns/1ps

module apb_top_tb;

    reg         clk;
    reg         reset;
    reg         write;
    reg         transfer;
    reg  [7:0]  addr;
    reg  [7:0]  data_in;

    wire [7:0]  read_out;

    apb_top dut (
        .clk      (clk),
        .reset    (reset),
        .write    (write),
        .transfer (transfer),
        .addr     (addr),
        .data_in  (data_in),
        .read_out (read_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset    = 1;
        write    = 0;
        transfer = 0;
        addr     = 8'h00;
        data_in  = 8'h00;

        #20;
        reset = 0;

        // WRITE 1
        @(posedge clk);
        #1;
        write    = 1;
        transfer = 1;
        addr     = 8'h10;
        data_in  = 8'hAB;

        @(posedge clk);
        #1;
        transfer = 0;

        #20;

        // READ 1
        @(posedge clk);
        #1;
        write    = 0;
        transfer = 1;
        addr     = 8'h10;

        @(posedge clk);
        #1;
        transfer = 0;

        #20;

        $display("--------------------------------");
        $display("READ 1");
        $display("Address  = %h", addr);
        $display("READ_OUT = %h", read_out);

        // WRITE 2
        @(posedge clk);
        #1;
        write    = 1;
        transfer = 1;
        addr     = 8'h20;
        data_in  = 8'h55;

        @(posedge clk);
        #1;
        transfer = 0;

        #20;

        // READ 2
        @(posedge clk);
        #1;
        write    = 0;
        transfer = 1;
        addr     = 8'h20;

        @(posedge clk);
        #1;
        transfer = 0;

        #20;

        $display("--------------------------------");
        $display("READ 2");
        $display("Address  = %h", addr);
        $display("READ_OUT = %h", read_out);
        $display("--------------------------------");

        #20;
        $finish;

    end

    initial begin
        $dumpfile("apb_top.vcd");
        $dumpvars(0, apb_top_tb);
    end

endmodule
