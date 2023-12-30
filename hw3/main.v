`include "controller.v"
//`include "util.v"
module main();
  reg [5:0] opc = 6'b000000;

  wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  wire [1:0] ALUop;
  wire [3:0] ponos;
  assign ponos[3] = 1;
  assign ponos[2] = 0;
  assign ponos[1] = 1;
  assign ponos[0] = 0;

  decoder dc(opc, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);



  initial begin
    $display("sadwefwe %b", ponos);
    $display("ptidurok   %b", opc == 6'b000000);
    $display("%b, %b, %b, %b, %b, %b, %b", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
  end
endmodule

