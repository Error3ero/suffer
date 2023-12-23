`include "controller.v"
`include "util.v"

module main();
    wire a;
    a = 1;

    initial $display("%d", a);
endmodule