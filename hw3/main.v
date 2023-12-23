`include "controller.v"
`include "util.v"

module main();
    reg [3:0] b;

    wire [1:0] a;


    initial begin
        assign a[0] = 1;
        b[3] = 1;
        b[0] = 0;
        b[2] = 0;
        $display("a = %d%d", a[1], a[0]);

        b[3] = 0;
        b[0] = 1;
        b[2] = 0;
        $display("a = %d%d", a[1], a[0]);
    end

//    reg [5:0] opcode;
//    wire  memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
//    wire [1:0] ALUop;
//    reg clk;
//
//    decoder decoder1(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
//
//    initial begin
//        //opcode = 6'b000000;
//        opcode[5] = 0;
//        opcode[4] = 0;
//        opcode[3] = 0;
//        opcode[2] = 0;
//        opcode[1] = 0;
//        opcode[0] = 0;
//        clk = 1;
//        clk = 0;
//        $display("000000");
//        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);
//
//        //opcode = 6'b100011;
//        opcode[5] = 1;
//        opcode[4] = 0;
//        opcode[3] = 0;
//        opcode[2] = 0;
//        opcode[1] = 1;
//        opcode[0] = 1;
//        clk = 1;
//        clk = 0;
//        $display("100011");
//        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);
//
//        //opcode = 6'b101011;
//        opcode[5] = 1;
//        opcode[4] = 0;
//        opcode[3] = 1;
//        opcode[2] = 0;
//        opcode[1] = 1;
//        opcode[0] = 1;
//        clk = 1;
//        clk = 0;
//        $display("101011");
//        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);
//
//        //opcode = 6'b000100;
//        opcode[5] = 0;
//        opcode[4] = 0;
//        opcode[3] = 0;
//        opcode[2] = 1;
//        opcode[1] = 0;
//        opcode[0] = 0;
//        clk = 1;
//        clk = 0;
//        $display("000100");
//        $display("memtoreg: %d, memwrite: %d, branch: %d, ALUsrc: %d, regdst: %d, regwrite: %d, ALUop: %d%d", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop[1], ALUop[0]);
//    end
endmodule