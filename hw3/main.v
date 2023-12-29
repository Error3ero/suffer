//`include "controller.v"
`include "util.v"
module main();
    wire [2:0] a;
    assign a[2] = 1;
    assign a[1] = 0;
    assign a[0] = 1;
    wire [31:0] b;
    shl_2 s(a, b);
    initial begin
      $display("%b", b);
    end
endmodule
