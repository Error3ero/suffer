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








  wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, PCSrc, zero;
  wire [31:0] srcB, signimm, PCBranch, pcp4, sh2, ALUResult, readData, regwd3, regrd2;
  wire [2:0] ALUcontrol;
  wire [5:0] opcode, funct;

  instruction_memory im(instruction_memory_a, instruction_memory_rd);
  assign register_a1 = instruction_memory_rd[25:21];
  assign register_a2 = instruction_memory_rd[20:16];
  assign data_memory_a = ALUResult;
  assign data_memory_we = branch;
  assign data_memory_rd = readData;
  assign register_wd3 = regwd3;
  assign regrd2 = register_rd2;
  assign opcode = instruction_memory_rd[31:26];
  assign funct = instruction_memory_rd[5:0];


  adder addpc(pc, 4 , pcp4);
  register_file rf(clk, register_we3, instruction_memory_rd[25:21], instruction_memory_rd[20:16], register_a3, regwd3, register_rd1, register_rd2);
  mux2_5 wr(instruction_memory_rd[20:16], instruction_memory_rd[15:11], regdst, register_a3);
  mux2_32 srcb(regrd2, signimm, ALUsrc, srcB);
  control c(opcode, funct, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUcontrol);
  sign_extend se(instruction_memory_rd[15:0], signimm);
  shl_2 s2(signimm, sh2);
  adder pcb(sh2, pcp4, PCBranch);
  mux2_32 newpc(pcp4, PCBranch, PCSrc, pc_new);
  ALU alu(register_rd1, srcB, ALUcontrol, data_memory_a, zero);
  and_gate and_gate(zero, branch, PCSrc);
  pc pcr(clk, pc_new, pc);
  data_memory dm(ALUResult, branch, clk, register_rd2, readData);
  mux2_32 res(ALUResult, readData, memtoreg, regwd3);


  // TODO: implementation
endmodule
