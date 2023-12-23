`include "controller.v"

module main();
    reg [5:0] opcode;
    wire  memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    wire [1:0] ALUop;
    reg clk;

    decoder decoder1(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

    initial begin
        opcode = 6'b000000;
        clk = 0;
        clk = 1;
        $display("000000");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);

        opcode = 6'b100011;
        clk = 0;
        clk = 1;
        $display("100011");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);

        opcode = 6'b101011;
        clk = 0;
        clk = 1;
        $display("101011");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);

        opcode = 6'b000100;
        clk = 0;
        clk = 1;
        $display("000100");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);
    end
endmodule