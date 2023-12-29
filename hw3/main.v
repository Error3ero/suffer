//`include "controller.v"
`include "util.v"
module main();
    reg [4:0] a = 11;
    reg [4:0] b = 1;
    reg c = 1;

    wire [4:0] moma, aw, bw;

    regToWire r1(a, aw);
    regToWire r2(b, bw);

    assign moma = c ? bw : aw;




    initial begin
      $display("%b", moma);
    end
endmodule

module regToWire(a, out);
  input [4:0] a;
  output [4:0] out;

  assign out = a;
endmodule