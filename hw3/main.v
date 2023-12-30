`include "controller.v"
`include "util.v"
`include "ALU.v"
module main();
  reg [31:0] a = 214;
  reg [31:0] b = 21455;
  wire [31:0] res;
  reg [2:0] control = 3'b110;
  wire zero;

  ALU alu1(a, b, control, res, zero);

  initial begin
    $display("%b", res);
    $display("%b", zero);
  end
endmodule

