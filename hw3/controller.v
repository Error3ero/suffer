module decoder(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input clk;
    input [5:0] opcode;
    output memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output [1:0] ALUop;

    always @ (posedge clk) begin
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
                memtoreg = 0;
                memwrite = 1'bx;
                branch = 1;
                ALUsrc = 0;
                regdst = 1;
                regwrite = 1'bx;
                ALUop[1] = 0;
                ALUop[0] = 0;
                end
            6'b000100 : begin
                memtoreg = 0;
                memwrite = 1'bx;
                branch = 0;
                ALUsrc = 1;
                regdst = 0;
                regwrite = 1'bx;
                ALUop[1] = 0;
                ALUop[0] = 1;
                end
        endcase
    end
endmodule