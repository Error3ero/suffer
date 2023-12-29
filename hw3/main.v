`include "controller.v"

module main();
    inout a, b, c, d, e, f;
    inout [1:0] g;
    reg [5:0] opcode = 6'b000000;
    decoder dc(opcode, a, b, c, d, e, f, g);

    initial begin
      $display("%b", a);
      $display("%b", b);
      $display("%b", c);
      $display("%b", d);
      $display("%b", e);
      $display("%b", f);
      $display("%b", g);
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

