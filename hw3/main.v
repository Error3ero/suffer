`include "controller.v"
//`include "util.v"
module main();
  reg [5:0] opc = 6'b000000;
  wire opcode, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  wire [2:0] ALUcontrol;
  reg clk;
  control c1(opc, opcode, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUcontrol);

  initial begin
    #5;
    clk = 0;
    #5;
    clk = 1;
    opcode = 6'b1000101;
    #5;
    clk = 0;
    #5;
    clk = 1;
    opcode = 6'b1010101;
    #5;
    clk = 0;
    #5;
    clk = 1;
    opcode = 6'b000100;
  end
endmodule

