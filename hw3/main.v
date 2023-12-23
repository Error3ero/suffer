`include "controller.v"
`include "util.v"

module main();
    wire a;
    assign a = 0;
    wire b;
    assign b = 1 == 0;

    initial $display("%d, %d", a, b);
endmodule

module test(a, out);
    input a;
    output [3:0];


endmodule