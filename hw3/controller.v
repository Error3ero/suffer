module decoder(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input clk;
    input [5:0] opcode;
    output reg memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output reg [1:0] ALUop;

    always @ (posedge clk) begin
        case (opcode)
            6'b000000: begin
                regwrite = 1;
                regdst = 1;
                ALUsrc = 0;
                branch = 0;
                memwrite = 0;
                memtoreg = 0;
                ALUop[1] = 1;
                ALUop[0] = 0;
            end
            6'b100011: begin
                regwrite = 1;
                regdst = 0;
                ALUsrc = 1;
                branch = 0;
                memwrite = 0;
                memtoreg = 1;
                ALUop[1] = 0;
                ALUop[0] = 0;
            end
            6'b101011: begin
                regwrite = 0;
                ALUsrc = 1;
                branch = 0;
                memwrite = 1;
                ALUop[1] = 0;
                ALUop[0] = 0;
            end
            6'b000100: begin
                regwrite = 0;
                ALUsrc = 0;
                branch = 1;
                memwrite = 0;
                ALUop[1] = 0;
                ALUop[0] = 1;
            end
        endcase
    end
endmodule

module ALUDecoder(clk, ALUop, funct, ALUcontrol);
    input clk;
    input [1:0] ALUop;
    input [5:0] funct;
    output reg [2:0] ALUcontrol;

    always @ (posedge clk) begin
        if (ALUop[0] == 1) begin
            ALUcontrol[2] = 1;
            ALUcontrol[1] = 1;
            ALUcontrol[0] = 0;
        end
        case (ALUop)
            2'b00: begin
                ALUcontrol[2] = 0;
                ALUcontrol[1] = 1;
                ALUcontrol[0] = 0;
            end
            2'b10, 2'b11: begin
                case (funct)
                    6'b100000: begin
                ALUcontrol[2] = 0;
                ALUcontrol[1] = 1;
                ALUcontrol[0] = 0;
                    end
                    6'b100010: begin
                ALUcontrol[2] = 1;
                ALUcontrol[1] = 1;
                ALUcontrol[0] = 0;
                    end
                    6'b100100: begin
                ALUcontrol[2] = 0;
                ALUcontrol[1] = 0;
                ALUcontrol[0] = 0;
                    end
                    6'b100101: begin
                ALUcontrol[2] = 0;
                ALUcontrol[1] = 0;
                ALUcontrol[0] = 1;
                    end
                    6'b101010: begin
                ALUcontrol[2] = 1;
                ALUcontrol[1] = 1;
                ALUcontrol[0] = 1;
                    end
                endcase
            end
        endcase
    end
endmodule

module control(clk, opcode, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop, ALUcontrol);
    input clk;
    input [5:0] opcode;
    input [5:0] funct;
    output memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output [1:0] ALUop;
    output [2:0] ALUcontrol;

    decoder d(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    ALUDecoder a(clk, ALUop, funct, ALUcontrol);
endmodule