module data_memory(a, we, clk, wd, rd);
  // we - флаг записи
  // clk - сигнал синхронизации
  input we, clk;
  // адрес, к которому происходит обращение
  input [31:0] a;
  // данные для записи
  input [31:0] wd;
  // данные, полученные в результате чтения
  output [31:0] rd;

  // непосредственно память, 2048 ячеек по 32 бита
  reg [31:0] ram[0:2047];

  // изначально память заполняется нулями
  integer i;
  initial begin
    for (i = 0; i < 2048; i = i + 1) begin
      ram[i] = 0;
   	end
  end

  // чтение происходит из элемента массива по a / 4, т.к.
  // адресация побайтовая, а ячейки массива по 32 бита (4 байта)
  assign rd = ram[a / 4];

  // запись на фронте сигнала синхронизации
  always @ (posedge clk) begin
    // при we = 1
    if (we) ram[a / 4] = wd;
  end
endmodule

module instruction_memory(a, rd);
  // адрес, к которому происходит обращение
  input [31:0] a;
  // данные, полученные в результате чтения
  output [31:0] rd;
  // непосредственно память, 64 ячейки по 32 бита
  reg [31:0] ram[0:63];

  // память заполняется двоичными данными из
  // файла intructions.dat
  initial begin
    $readmemb("instructions.dat", ram);
    //$display("instr mem init");
  end

  // чтение происходит из элемента массива по a / 4, т.к.
  // адресация побайтовая, а ячейки массива по 32 бита (4 байта)
  assign rd = ram[a / 4];
//  always @* begin
//    $display("instruction %b", rd);
//  end
endmodule

