module qa_2(
    input a,
    input b,
    input c,
    input d,
    output out  );
    assign out=~a&~d|~b&~c|b&c&d|a&c&d;

endmodule

