module not_32(a, out);
    input [31:0] a;
    output [31:0] out;

    assign out = ~a;
endmodule

module zero_extend(a, out);
    input [15:0] a;
    output [31:0] out;

    assign out = {16'b0000000000000000, a[15:0]};
endmodule