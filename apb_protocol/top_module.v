
module apb_top(
    input clk,
    input reset,
    input write,
    input transfer,
    input [7:0] addr,
    input [7:0] data_in,
    output [7:0] read_out
);

    // APB signals between master and slave
    wire        psel;
    wire        penable;
    wire        pwrite;
    wire [7:0]  paddr;
    wire [7:0]  pwdata;

    wire        pready;
    wire [7:0]  prdata;

    // APB Master
    apb_master u_master (
        .clk       (clk),
        .reset     (reset),

        .write     (write),
        .transfer  (transfer),
        .addr      (addr),
        .data_in   (data_in),

        .pready    (pready),
        .prdata    (prdata),

        .psel      (psel),
        .penable   (penable),
        .pwrite    (pwrite),
        .paddr     (paddr),
        .pwdata    (pwdata),
        .read_out  (read_out)
    );

    // APB Slave
    apb_slave u_slave (
        .clk       (clk),
        .reset     (reset),

        .psel      (psel),
        .penable   (penable),
        .paddr     (paddr),
        .pwdata    (pwdata),
        .pwrite    (pwrite),

        .pready    (pready),
        .prdata    (prdata)
    );

endmodule
