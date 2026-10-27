
`timescale 1ns/1ps

module test;

reg rd_clk;
reg wr_clk;
reg rst;
reg clr;
reg we;
reg re;
reg [7:0] din;

wire [7:0] dout;
wire full;
wire empty;
wire full_n;
wire empty_n;
wire [1:0] level;

reg [7:0] buffer [0:255];
integer wr_count;
integer rd_count;
integer i;

generic_fifo_dc #(8, 4, 9) uut (
    .rd_clk(rd_clk),
    .wr_clk(wr_clk),
    .rst(rst),
    .clr(clr),
    .din(din),
    .we(we),
    .dout(dout),
    .re(re),
    .full(full),
    .empty(empty),
    .full_n(full_n),
    .empty_n(empty_n),
    .level(level)
);

initial begin
    rd_clk = 0;
    wr_clk = 0;
    rst = 0;
    clr = 0;
    we = 0;
    re = 0;
    din = 0;
    wr_count = 0;
    rd_count = 0;

    repeat (5) @(posedge wr_clk);
    repeat (2) @(posedge rd_clk);

    @(negedge wr_clk);
    rst = 1;

    repeat (5) @(posedge rd_clk);

    $display("FIFO TEST STARTED");

    for (i = 0; i < 17; i = i + 1)
        write_data(i + 8'h20);

    repeat (5) @(posedge rd_clk);

    for (i = 0; i < wr_count; i = i + 1)

        read_data();

    if (wr_count == rd_count)
        $display("FIFO TEST PASSED");
    else
        $display("FIFO TEST FAILED: writes=%0d reads=%0d",
                 wr_count, rd_count);

    #20;
    $finish;
end

always #5 rd_clk = ~rd_clk;
always #10 wr_clk = ~wr_clk;

task write_data;
    input [7:0] data;
    begin
        @(negedge wr_clk);

        if (!full) begin
            din = data;
            we = 1;

            @(posedge wr_clk);
            #1;

            buffer[wr_count] = data;
            $display("WRITE: Index=%0d Data=%h",
                     wr_count, data);

            wr_count = wr_count + 1;
            we = 0;
        end
        else begin
            $display("FIFO FULL at Time=%0t", $time);
        end
    end
endtask

task read_data;
    begin
        @(negedge rd_clk);
        re = 1;

        @(posedge rd_clk);
        #2;

        if (dout !== buffer[rd_count]) begin
            $display(
                "ERROR: Index=%0d Expected=%h Actual=%h Time=%0t",
                rd_count, buffer[rd_count], dout, $time
            );
        end
        else begin
            $display(
                "READ OK: Index=%0d Data=%h",
                rd_count, dout
            );
        end

        rd_count = rd_count + 1;
        re = 0;
    end
endtask

endmodule
