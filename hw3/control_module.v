module control(opcode, funct, MemtoReg, MemWrite, BranchN, BranchE, ALUSrc, RegDst, RegWrite, Jump, Jal, Jr, ALUControl);
  input [5:0] opcode, funct;
  output MemtoReg, MemWrite, BranchN, BranchE, ALUSrc, RegDst, RegWrite, Jump, Jal, Jr;
  output [2:0] ALUControl;

  reg mtr, mw, brn, bre, asrc, rd, rw, jmp, jl, jr;
  reg [1:0] ALUop;
  reg [2:0] acont;

  always @* begin
    case (opcode)
      6'b000000: begin
        rw = 1;
        rd = 1;
        asrc = 0;
        brn = 0;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 0;
        jl = 0;
        jr = 0;
        ALUop = 2'b10;
      end
      6'b100011: begin
        rw = 1;
        rd = 0;
        asrc = 1;
        brn = 0;
        bre = 0;
        mw = 0;
        mtr = 1;
        jmp = 0;
        jl = 0;
        jr = 0;
        ALUop = 2'b00;
      end
      6'b101011: begin
        rw = 0;
        rd = 0;
        asrc = 1;
        brn = 0;
        bre = 0;
        mw = 1;
        mtr = 0;
        jmp = 0;
        jl = 0;
        jr = 0;
        ALUop = 2'b00;
      end
      6'b000100: begin
        rw = 0;
        rd = 0;
        asrc = 0;
        brn = 1;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 0;
        jl = 0;
        jr  = 0;
        ALUop = 2'b01;
      end
      6'b000101: begin
        rw = 0;
        rd = 0;
        asrc = 0;
        brn = 1;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 0;
        jl = 0;
        jr = 0;
        ALUop = 2'b01;
      end
      6'b001000: begin
        rw = 1;
        rd = 0;
        asrc = 0;
        brn = 0;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 0;
        jl = 0;
        jr = 0;
        ALUop = 2'b00;
      end
      6'b001100: begin
        rw = 1;
        rd = 0;
        asrc = 0;
        brn = 0;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 0;
        jl = 0;
        jr = 0;
        ALUop = 2'b11;
      end
      6'b000010: begin
        rw = 0;
        rd = 0;
        asrc = 0;
        brn = 0;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 1;
        jl = 0;
        jr = 0;
        ALUop = 2'b10;
      end
      6'b000011: begin
        rw = 1;
        rd = 0;
        asrc = 0;
        brn = 0;
        bre = 0;
        mw = 0;
        mtr = 0;
        jmp = 1;
        jl = 1;
        jr = 0;
        ALUop = 2'b10;
      end
    endcase

    if (ALUop == 2'b00) acont = 3'b010;
    else if (ALUop == 2'b01) acont = 3'b110;
    else if (ALUop == 2'b11) acont = 3'b000;
    else if (ALUop == 2'b10) begin
      case (funct)
        6'b100000: acont = 3'b010;
        6'b100010: acont = 3'b110;
        6'b100100: acont = 3'b000;
        6'b100101: acont = 3'b001;
        6'b101010: acont = 3'b111;
        6'b001000: begin
          rw = 0;
          jl = 1;
        end
      endcase
    end
  end

  assign MemtoReg = mtr;
  assign MemWrite = mw;
  assign BranchN = brn;
  assign BranchE = bre;
  assign ALUSrc = asrc;
  assign RegDst = rd;
  assign RegWrite = rw;
  assign Jump = jmp;
  assign Jal = jl;
  assign Jr = jr;
  assign ALUControl = acont;
endmodule