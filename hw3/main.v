`include "controller.v"
`include "util.v"

module main();
    wire a;
    assign a = 0;
    wire b;
    wire [3:0] v;

    test t(a, v);
    assign b = v == 4'b1111;

    initial $display("%d, %d", a, b);
endmodule

module test(a, out);
    input a;
    output [3:0] out;

    assign out[3] = a;
    assign out[1] = a;
    assign out[2] = a;
    assign out[0] = a;
endmodule