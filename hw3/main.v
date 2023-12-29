//`include "controller.v"
`include "util.v"
module main();
    reg [31:0] a = 4;
    wire [31:0] b;
    //shl_2 s(a, b);
    assign b = {a[29:0], 2'b11};
    initial begin
      $display("%b", a[29:0]);
      $display("%b", b);
    end
endmodule
