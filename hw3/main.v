`include "controller.v"
`include "util.v"
`include "ALU.v"
module main();
  reg [31:0] a = 4;
  reg [31:0] b = 71;
  wire [31:0] c;
  not_32 we(a, c);

  initial $display("%b", c);
endmodule

