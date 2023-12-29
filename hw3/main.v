`include "controller.v"
//`include "util.v"
module main();
  reg [5:0] opc = 6'b000000;

  wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  wire [1:0] ALUop;

  decoder dc(opc, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);



  initial begin
    $display("ptidurok   %b", opc == 6'b000000);
    $display("%b, %b, %b, %b, %b, %b, %b", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
  end
endmodule

