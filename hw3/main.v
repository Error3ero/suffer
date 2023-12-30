`include "controller.v"
`include "util.v"
`include "ALU.v"
module main();
  integer a = 214;
  integer b = 21455;
  wire [31:0] res;
  reg [2:0] control;
  wire zero;

  ALU alu1(a, b, control, res, zero);

  initial begin
    control = 3'b010;
    $display("%b", res);
    $display("%b", zero);

    control = 3'b110;
    $display("%b", res);
    $display("%b", zero);
  end
endmodule

