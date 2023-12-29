// TODO: redo
module decoder(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
  input [5:0] opcode;
  output memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  output [1:0] ALUop;

  wire [7:0] res;

  reg [7:0] rtyper = 8'b11000010;
  reg [7:0] lwr = 8'b10100100;
  reg [7:0] swr = 8'b0x101x00;
  reg [7:0] beqr = 8'b0x010x01;

  wire [7:0] rtype, lw, sw, beq;

  regToWire rtw1(8'b11000010, lw)

  assign regwrite = res[7];
  assign regdst = res[6];
  assign ALUsrc = res[5];
  assign branch = res[4];
  assign memwrite = res[3];
  assign memtoreg = res[2];
  assign ALUop = res[1:0];

endmodule

module ALUDecoder(ALUop, funct, ALUcontrol);
    input [1:0] ALUop;
    input [5:0] funct;
    output [2:0] ALUcontrol;

    reg [2:0] ac;

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

    assign ALUcontrol = ac;
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

module regToWire6(a, out);
  input [5:0] a;
  output [5:0] out;

  assign out = a;
endmodule