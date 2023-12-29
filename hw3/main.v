//`include "controller.v"
`include "util.v"
module main();
    reg [31:0] a = 11;

    reg [29:0] interm = a[29:0];
    wire [31:0] b;
//    shl_2 s(a, b);
    assign b = {interm[29:0], 2'b00};
    initial begin
      $display("%b", b);
    end
endmodule
