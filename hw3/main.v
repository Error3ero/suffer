`include "controller.v"
//`include "util.v"
module main();
  reg [5:0] opc = 6'b000000;
  reg [5:0] funct;
  wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  wire [2:0] ALUcontrol;
  reg clk;
  control c1(clk, opc, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUcontrol);

  initial begin
    #5;
    clk = 1;
    #5;
    clk = 0;
        $display("memtoreg %b", memtoreg);
        $display("memwrite %b", memwrite);
        $display("branch %b", branch);
        $display("ALUsrc %b", ALUsrc);
        $display("regdst %b", regdst);
        $display("regwrite %b", regwrite);
       // $display("aluop %b", ALUOp);
    opc = 6'b100011;
    #5;
    clk = 1;
    #5;
    clk = 0;
        $display("memtoreg %b", memtoreg);
        $display("memwrite %b", memwrite);
        $display("branch %b", branch);
        $display("ALUsrc %b", ALUsrc);
        $display("regdst %b", regdst);
        $display("regwrite %b", regwrite);
        //$display("aluop %b", ALUOp);
    opc = 6'b101011;
    #5;
    clk = 1;
    #5;
    clk = 0;
            $display("memtoreg %b", memtoreg);
            $display("memwrite %b", memwrite);
            $display("branch %b", branch);
            $display("ALUsrc %b", ALUsrc);
            $display("regdst %b", regdst);
            $display("regwrite %b", regwrite);
    opc = 6'b000100;
    #5;
    clk = 1;
    #5;
    clk = 0;
            $display("memtoreg %b", memtoreg);
            $display("memwrite %b", memwrite);
            $display("branch %b", branch);
            $display("ALUsrc %b", ALUsrc);
            $display("regdst %b", regdst);
            $display("regwrite %b", regwrite);
  end
endmodule

