module alu_task;

reg [3:0] a,b,c;

reg [9:0] add,sub,mul,div;

task alu;

input[3:0] x,y,z;

begin

add=x+y+z;

sub=x-y-z;

mul=x*y*z;

div=x/y/z;

end

endtask


initial begin

a=5;b=6;c=4;

alu(a,b,c);

$monitor("addition =%d,subtraction=%b,multiplication=%d;division=%d",add,sub,mul,div);

end

endmodule



