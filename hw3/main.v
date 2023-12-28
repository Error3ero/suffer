`include "controller.v"
`include "ALU.v"

module main();
    wire a = 0;
    wire b = 1;

    wire c = a && b;

    initial begin
        $display("peins %d", c);
    end
endmodule

module and_gate(a, b, out);
  input a, b;
  output out;
  assign out = a & b;
endmodule
