// TODO: redo
module decoder(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
  input [5:0] opcode;
  output memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  output [1:0] ALUop;

  reg rw, rd, as, br, mw, mtr;
  reg [1:0] aop;

    always @* begin
        case (opcode)
            6'b000000: begin
                rw = 1;
                rd = 1;
                as = 0;
                br = 0;
                mw = 0;
                mtr = 0;
                aop[1] = 1;
                aop[0] = 0;
            end
            6'b100011: begin
                rw = 1;
                rd = 0;
                as = 1;
                br = 0;
                mw = 0;
                mtr = 1;
                aop[1] = 0;
                aop[0] = 0;
            end
            6'b101011: begin
                rw = 0;
                as = 1;
                br = 0;
                mw = 1;
                aop[1] = 0;
                aop[0] = 0;
            end
            6'b000100: begin
                rw = 0;
                as = 0;
                br = 1;
                mw = 0;
                aop[1] = 0;
                aop[0] = 1;
            end
        endcase
    end

    assign regwrite = rw;
    assign regdst = rd;
    assign ALUsrc = as;
    assign branch = br;
    assign memwrite = mw;
    assign memtoreg = mtr;
    assign ALUop = aop;

endmodule

module ALUDecoder(ALUop, funct, ALUcontrol);
    input [1:0] ALUop;
    input [5:0] funct;
    output [2:0] ALUcontrol;

    wire [2:0] ac;

    always @* begin
        if (ALUop[0] == 1) begin
            ac[2] = 1;
            ac[1] = 1;
            ac[0] = 0;
        end
        case (ALUop)
            2'b00: begin
                ac[2] = 0;
                ac[1] = 1;
                ac[0] = 0;
            end
            2'b10, 2'b11: begin
                case (funct)
                    6'b100000: begin
                ac[2] = 0;
                ac[1] = 1;
                ac[0] = 0;
                    end
                    6'b100010: begin
                ac[2] = 1;
                ac[1] = 1;
                ac[0] = 0;
                    end
                    6'b100100: begin
                ac[2] = 0;
                ac[1] = 0;
                ac[0] = 0;
                    end
                    6'b100101: begin
                ac[2] = 0;
                ac[1] = 0;
                ac[0] = 1;
                    end
                    6'b101010: begin
                ac[2] = 1;
                ac[1] = 1;
                ac[0] = 1;
                    end
                endcase
            end
        endcase
    end
endmodule


// TODO: remove aluop output
module control(opcode, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUcontrol);
    input clk;
    input [5:0] opcode;
    input [5:0] funct;
    output memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    wire [1:0] ALUop;
    output [2:0] ALUcontrol;

    decoder d(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    ALUDecoder a(ALUop, funct, ALUcontrol);
endmodule