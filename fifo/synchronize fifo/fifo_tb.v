/*module fifo_tb;

reg clk,rst_n,wr_en,rd_en;
reg[7:0]data_in;
wire[7:0]data_out;
wire full,empty;
fifo uut(
.clk(clk),
.rst_n(rst_n),
.wr_en(wr_en),
.rd_en(rd_en),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty));
initial begin
clk=0;
forever#5 clk=~clk;
end
initial begin
rst_n=0;
wr_en=0;
rd_en=0;
data_in=0;
repeat(4)begin@(posedge clk);
wr_en=0;
  data_in = data_in + 8'h01;
repeat(4)begin@(posedge clk);
rd_en=1;
end
rd_en=0;
#20
$finish;
end
initial begin
	  $monitor( "rst_n=%b wr_en=%b rd_en=%b data_in=%h data_out=%h full=%b empty=%b",
             rst_n, wr_en, rd_en, data_in, data_out, full, empty);
     end
endmodule*/
module fifo_tb;

reg clk, rst_n, wr_en, rd_en;
reg [7:0] data_in;

wire [7:0] data_out;
wire full, empty;

fifo uut (
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin

    // Initial condition
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    data_in = 8'h00;

    // Reset
    #20;
    rst_n = 1;

    // Write 4 data values
    repeat(4) begin
        @(posedge clk);
        wr_en = 1;
        data_in = data_in + 8'h01;
    end

    // Stop write
    @(posedge clk);
    wr_en = 0;

    // Read 4 data values
    repeat(4) begin
        @(posedge clk);
        rd_en = 1;
    end

    // Stop read
    @(posedge clk);
    rd_en = 0;

    #20;
    $finish;

end

// Monitor
initial begin
    $monitor("Time=%0t rst_n=%b wr_en=%b rd_en=%b data_in=%h data_out=%h full=%b empty=%b",
             $time, rst_n, wr_en, rd_en, data_in, data_out, full, empty);
end

endmodule
