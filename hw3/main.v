`include "controller.v"

module main();
    reg [5:0] opcode;
    wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    wire [1:0] ALUop;

    decoder decoder1(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

    initial begin
        opcode = 6'b000000;
        $display("000000");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

        opcode = 6'b100011;
        $display("100011");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

        opcode = 6'b101011;
        $display("101011");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

        opcode = 6'b000100;
        $display("000100");
        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    end
endmodule