//`include "controller.v"
`include "util.v"
module main();
    wire [31:0] a = 11;
    wire [31:0] b;
    shl_2 s(a, b);
    assign b = {a[29:0], 2'b00};
    initial begin
      $display("%b", i);
    end
endmodule
