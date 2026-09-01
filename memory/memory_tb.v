module memory_tb;

    reg clk;
    reg we;
    reg re;
    reg [2:0] address;
    reg [7:0] data_in;

    wire [7:0] data_out;

    
    memory uut (
        .clk(clk),
        .we(we),
        .re(re),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

  
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        we = 0;
        re = 0;
        address = 0;
        data_in = 0;
	

       
        #10;
        we = 1;
        address = 4;
        data_in = 8'b10101010;


        #10;
        we = 0;

        #10;
        re = 1;
        address = 4;

        #10;
        re = 0;

        #10;
        $finish;

    end
    initial begin
	    $monitor("clk=%b,we=%b,re=%b,address=%b,data_in=%b,data_out=%b",clk,we,re,address,data_in,data_out);
    end
endmodule
