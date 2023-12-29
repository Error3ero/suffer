//`include "controller.v"
`include "util.v"
module main();
    reg [4:0] a = 11;
    reg [4:0] b = 1;
    reg c = 1;

    wire [4:0] moma;

    mux2_5 xui(a, b, c, moma);


    initial begin
      $display("%b", moma);
    end
endmodule
