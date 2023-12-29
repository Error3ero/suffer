//`include "controller.v"
`include "util.v"
module main();
    reg [16:0] a = 4;
    wire [31:0] b;
    sign_extend s(a, b);
    initial begin
      $display("%b", b);
    end
endmodule
