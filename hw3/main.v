`include "controller.v"
`include "ALU.v"

module main();
    reg [15:0] a = 16'b1010111010100001;
    reg [15:0] b = 16'b1010111010000001;
    wire c;

    test t(a, b, c);

    initial begin
        $display("peins %d", c);
    end
endmodule

module test(a, b, out);
  input [15:0] a, b;
  output out;
  assign out = a == b;
endmodule