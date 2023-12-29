//`include "controller.v"
`include "util.v"
module main();
    reg [31:0] a = 32'b00000000000000000000000000001000;
    wire [31:0] b;
    shl_2 s(a, b);
    initial begin
      $display("%b", b);
    end
endmodule
