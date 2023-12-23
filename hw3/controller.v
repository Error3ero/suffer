module decoder(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input [5:0] opcode;
    output reg memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output reg [1:0] ALUop;

    always begin
        case (opcode)
            6'b000000 : begin
                memtoreg = 0;
                memwrite = 0;
                branch = 0;
                ALUsrc = 0;
                regdst = 1;
                regwrite = 1;
                ALUop = 2'b10;
                end
            6'b100011 : begin
                memtoreg = 1;
                memwrite = 0;
                branch = 0;
                ALUsrc = 1;
                regdst = 0;
                regwrite = 1;
                ALUop = 2'b00;
                end
            6'b101011 : begin
                memtoreg = x;
                memwrite = 1;
                branch = 0;
                ALUsrc = 1;
                regdst = x;
                regwrite = 0;
                ALUop = 2'b00;
                end
            6'b000100 : begin
                memtoreg = x;
                memwrite = 0;
                branch = 1;
                ALUsrc = 0;
                regdst = x;
                regwrite = 0;
                ALUop = 2'b01;
                end
        endcase
    end
endmodule