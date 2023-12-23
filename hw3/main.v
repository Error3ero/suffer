`include "controller.v"
`include "util.v"

module main();
    reg [5:0] opcode;

    wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    wire [1:0] ALUop;

    reg clk;

    wire b;

    decoder d(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);

    test t(opcode, b);

    initial begin
        opcode[5] = 0;
        opcode[4] = 0;
        opcode[3] = 0;
        opcode[2] = 0;
        opcode[1] = 0;
        opcode[0] = 0;
        clk = 0;
        clk = 1;
        clk = opcode == 6'b000000;
        $display("statement = %d", clk);
        $display("memtoreg = %d, memwrite = %d, branch = %d, ALUsrc = %d, regdst = %d, regwrite = %d, ALUop1 = %d, ALUop0 = %d", clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);

        $display("TESTS BITCH = %d", b);

        opcode[5] = 1;
        opcode[4] = 0;
        opcode[3] = 0;
        opcode[2] = 0;
        opcode[1] = 1;
        opcode[0] = 1;
        clk = 0;
        clk = 1;
        clk = opcode == 6'b100011;
        $display("statement = %d", clk);
        $display("memtoreg = %d, memwrite = %d, branch = %d, ALUsrc = %d, regdst = %d, regwrite = %d, ALUop1 = %d, ALUop0 = %d", clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);

        opcode[5] = 1;
        opcode[4] = 0;
        opcode[3] = 1;
        opcode[2] = 0;
        opcode[1] = 1;
        opcode[0] = 1;
        clk = 0;
        clk = 1;
        clk = opcode == 6'b001011;
        $display("statement = %d", clk);
        $display("memtoreg = %d, memwrite = %d, branch = %d, ALUsrc = %d, regdst = %d, regwrite = %d, ALUop1 = %d, ALUop0 = %d", clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);

        opcode[5] = 0;
        opcode[4] = 0;
        opcode[3] = 0;
        opcode[2] = 1;
        opcode[1] = 0;
        opcode[0] = 0;
        clk = 0;
        clk = 1;
        clk = opcode == 6'b010100;
        $display("statement = %d", clk);
        $display("memtoreg = %d, memwrite = %d, branch = %d, ALUsrc = %d, regdst = %d, regwrite = %d, ALUop1 = %d, ALUop0 = %d", clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);
    end
endmodule

module test(a, out);
    input [5:0] a;
    output out;

    assign out = a == 6'b000000 ? 1 : 0;
endmodule
