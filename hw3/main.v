`include "controller.v"
`include "util.v"
`include "ALU.v"
module main();
  wire [3:0] a;
  assign a[3] = 0;
  assign a[2] = 0;
  assign a[1] = 0;
  assign a[0] = 0;

  wire [3:0] b;
    assign b[3] = 0;
    assign b[2] = 0;
    assign b[1] = 0;
    assign b[0] = 0;

    wire c;
    assign c = a == b;

  initial $display("%b", c);
endmodule

