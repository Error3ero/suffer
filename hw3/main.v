`include "controller.v"
`include "util.v"

module main();
    wire a;
    reg [1:0] b = 2'b10;
    assign a = b == 2'b00 ? 1 : 0;

    initial $display("%d", a);
endmodule