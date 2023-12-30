module control(clk, opcode, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUcontrol);
  input clk;
  input [5:0] opcode;
  input [5:0] funct;
  output reg memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
  output reg [2:0] ALUcontrol;
  reg [1:0] ALUOp;

  always @(posedge clk) begin
    $display("opcode %b", opcode);
    case (opcode)
      6'b000000: begin
        memtoreg = 0;
        memwrite = 0;
        branch = 0;
        ALUsrc = 0;
        regdst = 1;
        regwrite = 1;
        ALUOp = 2'b10;
        case (funct)
          6'b100000 : ALUcontrol = 3'b010;
          6'b100010 : ALUcontrol = 3'b110;
          6'b100100 : ALUcontrol = 3'b000;
          6'b100101 : ALUcontrol = 3'b001;
          6'b101010 : ALUcontrol = 3'b111;
        endcase
      end
      6'b110001: begin
        memtoreg = 1;
        memwrite = 0;
        branch = 0;
        ALUsrc = 1;
        regdst = 0;
        regwrite = 1;
        ALUOp = 2'b00;
        ALUcontrol = 3'b010;
      end
      6'b110101: begin
        memtoreg = 1'bx;
        memwrite = 1;
        branch = 0;
        ALUsrc = 1;
        regdst = 1'bx;
        regwrite = 0;
        ALUOp = 2'b00;
        ALUcontrol = 3'b010;
      end
      6'b001000: begin
        memtoreg = 1'bx;
        memwrite = 0;
        branch = 1;
        ALUsrc = 0;
        regdst = 1'bx;
        regwrite = 0;
        ALUOp = 2'b01;
        ALUcontrol = 3'b110;
      end
    endcase
  end
endmodule
