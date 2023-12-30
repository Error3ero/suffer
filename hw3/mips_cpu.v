`include "util.v"
`include "control_module.v"

module mips_cpu(clk, pc, pc_new, instruction_memory_a, instruction_memory_rd, data_memory_a, data_memory_rd, data_memory_we, data_memory_wd,
                register_a1, register_a2, register_a3, register_we3, register_wd3, register_rd1, register_rd2);
  // сигнал синхронизации
  input clk;
  // текущее значение регистра PC
  inout [31:0] pc;
  // новое значение регистра PC (адрес следующей команды)
  output [31:0] pc_new;
  // we для памяти данных
  output data_memory_we;
  // адреса памяти и данные для записи памяти данных
  output [31:0] instruction_memory_a, data_memory_a, data_memory_wd;
  // данные, полученные в результате чтения из памяти
  inout [31:0] instruction_memory_rd, data_memory_rd;
  // we3 для регистрового файла
  output register_we3;
  // номера регистров
  output [4:0] register_a1, register_a2, register_a3;
  // данные для записи в регистровый файл
  output [31:0] register_wd3;
  // данные, полученные в результате чтения из регистрового файла
  inout [31:0] register_rd1, register_rd2;

  assign instruction_memory_a = pc;

  wire [5:0] opcode = instruction_memory_rd[31:26];
  wire [5:0] funct = instruction_memory_rd[5:0];
  wire [4:0] r1 = instruction_memory_rd[25:21];
  wire [4:0] r2 = instruction_memory_rd[20:16];
  wire [4:0] wr1 = instruction_memory_rd[20:16];
  wire [4:0] wr2 = instruction_memory_rd[15:11];
  wire [15:0] imm = instruction_memory_rd[15:0];

  wire MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite;
  wire [2:0] ALUControl;

  control control1(opcode, funct, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, ALUControl);

  assign register_a1 = r1;
  assign register_a2 = r2;

  wire [4:0] WriteReg;
  mux2_5 mux0(wr1, wr2, RegDst, WriteReg);

  assign register_a3 = WriteReg;

  wire [31:0] Signimm;
  sign_extend se(imm, Signimm);

  wire [31:0] SrcA = register_rd1;
  wire [31:0] SrcB;

  mux2_32 mux1(register_rd2, Signimm, ALUSrc, SrcB);

  wire [31:0] ALUresult;
  wire zero;
  alu alu1(SrcA, SrcB, ALUControl, ALUresult, zero);

  assign register_we3 = RegWrite;
  assign data_memory_a = ALUresult;
  assign data_memory_wd = register_rd2;
  assign data_memory_we = MemWrite;

  wire [31:0] Result;
  mux2_32 mux2(ALUresult, data_memory_rd, MemtoReg, Result);

  assign register_wd3 = Result;

  wire PCsrc;
  and_gate and1(Branch, zero, PCsrc);

  wire [31:0] PCPlus4, sheld, PCbranch;
  adder adder1(pc, 4, PCPlus4);
  shl_2 shl(Signimm, sheld);

  adder adder2(PCPlus4, sheld, PCbranch)
  mux2_32 mux3(PCPlus4, PCbranch, PCsrc, pc_new);


  // TODO: implementation
endmodule
