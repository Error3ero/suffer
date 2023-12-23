`include "controller.v"
`include "util.v"

module main();
    reg [5:0] opcode;
    reg memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    reg [1:0] ALUop;
    reg clk;

    decoder decoder1(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

    initial begin

    end
endmodule