//`include "controller.v"
`include "util.v"
module main();
    reg [31:0] a = 32'b00000000000000000000000000000000;
    wire [31:0] b;
    adder adder1(a, 4, b);
    initial begin
      $display("%d", b);
    end
endmodule
