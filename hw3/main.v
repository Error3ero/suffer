//`include "controller.v"
`include "util.v"
module main();
    reg [4:0] a = 11;
    reg [4:0] b = 1;
    reg c = 1;
    parameter pidaras = 5'b11011;

    wire [4:0] moma, aw, bw;

    regToWire r1(pidaras, aw);
    regToWire r2(b, bw);

    assign moma = 1 == 2 ? bw : c ? aw : bw;



    initial begin
      $display("%b", pidaras);
    end
endmodule

module regToWire(a, out);
  input [4:0] a;
  output [4:0] out;

  assign out = a;
endmodule