module control(opcode, funct, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, ALUControl);
  input [5:0] opcode, funct;
  output MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite;
  output [2:0] ALUControl;

  reg mtr, mw, br, asrc, rd, rw;
  reg [1:0] ALUop;
  reg [2:0] acont;

  always @* begin
    case (opcode)
      6'b000000: begin
        rw = 1;
        rd = 1;
        asrc = 0;
        br = 0;
        mw = 0;
        mtr = 0;
        ALUop = 2'b10;
      end
      6'b110001: begin
        rw = 1;
        rd = 0;
        asrc = 1;
        br = 0;
        mw = 0;
        mtr = 1;
        ALUop = 2'b00;
      end
      6'b110101: begin
        rw = 0;
        rd = 0;
        asrc = 1;
        br = 0;
        mw = 1;
        mtr = 0;
        ALUop = 2'b00;
      end
      6'b001000: begin
        rw = 0;
        rd = 0;
        asrc = 0;
        br = 1;
        mw = 0;
        mtr = 0;
        ALUop = 2'b01;
      end
    endcase

    if (ALUop == 2'b00) acont = 3'b010;
    else if (ALUop == 2'b01) acont = 3'b110;
    else if (ALUop == 2'b11) acont = 3'b110;
    else if (ALUop == 2'b10) begin
      case (funct)
        6'b100000: acont = 3'b010;
        6'b100010: acont = 3'b110;
        6'b100100: acont = 3'b000;
        6'b100101: acont = 3'b001;
        6'b101010: acont = 3'b111;
      endcase
    end
  end

  assign MemtoReg = mtr;
  assign MemWrite = mw;
  assign Branch = br;
  assign ALUSrc = asrc;
  assign RegDst = rd;
  assign RegWrite = rw;
  assign ALUControl = acont;
endmodule