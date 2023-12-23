module decoder(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input clk;
    input [5:0] opcode;
    output wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output wire [1:0] ALUop;

    assign memtoreg = opcode == 6'b000000 ? 0 :
            opcode == 6'b100011 ? 1 :
            opcode == 6'b101011 ? 0 :
            opcode == 6'b000100 ? 0 : 1'bx;

    assign memwrite = opcode == 6'b000000 ? 0 :
                opcode == 6'b100011 ? 0 : 1'bx;

    assign branch = opcode == 6'b000000 ? 0 :
                opcode == 6'b100011 ? 0 :
                opcode == 6'b101011 ? 1 :
                opcode == 6'b000100 ? 0 : 1'bx;

    assign ALUsrc = opcode == 6'b000000 ? 0 :
                opcode == 6'b100011 ? 1 :
                opcode == 6'b101011 ? 0 :
                opcode == 6'b000100 ? 1 : 1'bx;

    assign regdst = opcode == 6'b000000 ? 1 :
                opcode == 6'b100011 ? 0 :
                opcode == 6'b101011 ? 1 :
                opcode == 6'b000100 ? 0 : 1'bx;

    assign regwrite = opcode == 6'b000000 ? 1 :
                opcode == 6'b100011 ? 1 : 1'bx;

    assign ALUop[1] = opcode == 6'b000000 ? 1 :
                opcode == 6'b100011 ? 0 :
                opcode == 6'b101011 ? 0 :
                opcode == 6'b000100 ? 0 : 1'bx;

    assign ALUop[0] = opcode == 6'b000000 ? 0 :
                opcode == 6'b100011 ? 0 :
                opcode == 6'b101011 ? 0 :
                opcode == 6'b000100 ? 1 : 1'bx;
endmodule