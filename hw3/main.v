//`include "controller.v"
`include "util.v"
module main();
    reg [4:0] a = 11;
    reg [4:0] b = 1;
    wire c = a == 11;

    wire moma;

    assign moma = c ? 0 : 1;

    initial begin
      $display("%b", moma);
    end
endmodule
