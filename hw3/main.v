`include "controller.v"
`include "ALU.v"

module main();
    reg [5:0] a = 6'b100101;
    reg [5:0] b = 6'b000000;
    wire c;
    assign c = (a == 6'b000000) ? 0 :
               (a == 6'b100101) ? 1 :
                                 'bx;

    initial begin
        $display("peins %d", c);
        a = 6'b011010;
        $display("peins %d", c);
        $display("peins %b", a);
    end
endmodule

module and_gate(a, b, out);
  input wire a, b;
  output wire out;

  wire nand_out;

  nand_gate nand_gate1(a, b, nand_out);
  not_gate not_gate1(nand_out, out);
endmodule

module nand_gate(a, b, out);
  input wire a, b;
  output out;

  supply1 pwr;
  supply0 gnd;

  wire nmos1_out;

  pmos pmos1(out, pwr, a);
  pmos pmos2(out, pwr, b);

  nmos nmos1(nmos1_out, gnd, b);
  nmos nmos2(out, nmos1_out, a);
  // pmos pmos1(out, pwr, a);
  // nmos nmos1(out, gnd, a);
endmodule


module not_gate(a, out);
  input wire a;
  output out;

  supply1 pwr;
  supply0 gnd;

  // 1 - сток, 2 - исток, 3 - база
  pmos pmos1(out, pwr, a);
  nmos nmos1(out, gnd, a);
endmodule

