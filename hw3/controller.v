module decoder(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input [5:0] opcode;
    output reg memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output reg [1:0] ALUop;

    supply0 zero;
    supply1 one;

    always begin
        case (opcode)
            6'b000000 : begin
                memtoreg = 0;
                memwrite = 0;
                branch = 0;
                ALUsrc = 0;
                regdst = 1;
                regwrite = 1;
                ALUop[1] = 1;
                ALUop[0] = 0;
                end
            6'b100011 : begin
                memtoreg = 1;
                memwrite = 0;
                branch = 0;
                ALUsrc = 1;
                regdst = 0;
                regwrite = 1;
                ALUop[1] = 0;
                ALUop[0] = 0;
                end
            6'b101011 : begin
                memtoreg = 1'bx;
                memwrite = 1;
                branch = 0;
                ALUsrc = 1;
                regdst = 1'bx;
                regwrite = 0;
                ALUop[1] = 0;
                ALUop[0] = 0;
                end
            6'b000100 : begin
                memtoreg = 1'bx;
                memwrite = 0;
                branch = 1;
                ALUsrc = 0;
                regdst = 1'bx;
                regwrite = 0;
                ALUop[1] = 0;
                ALUop[0] = 1;
                end
        endcase
    end
endmodule