//`include "controller.v"
`include "util.v"
module main();
    wire [2:0] a;
    assign a[2] = 1;
    assign a[1] = 0;
    assign a[0] = 1;
    wire [31:0] b;
    assign b = {{31{1'b0}}, 1'b1};
    initial begin
      $display("%b", b);
    end
endmodule
