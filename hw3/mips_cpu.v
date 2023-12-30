//`include "util.v"
//`include "pc.v"
//`include "controller.v"
//`include "memory.v"
//`include "register_file.v"

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

  wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, zero, PCSrc;
  wire [2:0] ALUControl;
  wire [4:0] WriteReg;
  wire [31:0] Signimm, SrcB, ALUResult, Result, toAdder, PCPlus4, PCBranch;

  control controller(clk, instruction_memory_rd[31:26], instruction_memory_rd[5:0], memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUControl);
  assign register_we3 = regwrite;
  assign data_memory_we = memwrite;

  assign instruction_memory_a = pc;

  mux2_5 towrreg(instruction_memory_rd[20:16], instruction_memory_rd[15:11], regdst, WriteReg);
  assign register_a3 = WriteReg;

  sign_extend signextend(instruction_memory_rd[15:0], Signimm);
  mux2_32 toSrcB(register_rd2, Signimm, ALUsrc, SrcB);

  assign data_memory_wd = register_rd2;

  ALU alu1(register_rd1, SrcB, ALUControl, ALUResult, zero);
  assign data_memory_a = ALUResult;

  mux2_32 toResult(ALUResult, data_memory_rd, memtoreg, Result);
  assign register_wd3 = Result;

  and_gate and_gate1(zero, branch, PCSrc);

  adder adder0(pc, 4, PCPlus4);
  shl_2 shl2(Signimm, toAdder);
  adder adder1(toAdder, PCPlus4, PCBranch);
  mux2_32 toPC(PCPlus4, PCBranch, PCSrc, pc_new);

  always @ (posedge clk) begin
    $display("pc %b", pc);
    $display("pc_new %b", pc_new);
    $display("instruction_memory_rd[31:26] %b", instruction_memory_rd[31:26]);
    $display("instruction_memory_rd[5:0] %b", instruction_memory_rd[5:0]);
    $display("%b, %b, %b %b, %b, %b, %b", memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUControl);
  end
  // TODO: implementation
endmodule
