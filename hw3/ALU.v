module not_32(a, out);
    input [31:0] a;
    output [31:0] out;

    assign out = ~a;
endmodule

module zero_extend(a, out);
    input [31:0] a;
    output [31:0] out;

    assign out = {31'b0000000000000000000000000000000, a[31]};
endmodule

module and_32(a, b, out);
    input [31:0] a, b;
    output [31:0] out;

    and_gate a0(a[0], b[0], out[0]);
    and_gate a1(a[1], b[1], out[1]);
    and_gate a2(a[2], b[2], out[2]);
    and_gate a3(a[3], b[3], out[3]);
    and_gate a4(a[4], b[4], out[4]);
    and_gate a5(a[5], b[5], out[5]);
    and_gate a6(a[6], b[6], out[6]);
    and_gate a7(a[7], b[7], out[7]);
    and_gate a8(a[8], b[8], out[8]);
    and_gate a9(a[9], b[9], out[9]);
    and_gate a10(a[10], b[10], out[10]);
    and_gate a11(a[11], b[11], out[11]);
    and_gate a12(a[12], b[12], out[12]);
    and_gate a13(a[13], b[13], out[13]);
    and_gate a14(a[14], b[14], out[14]);
    and_gate a15(a[15], b[15], out[15]);
    and_gate a16(a[16], b[16], out[16]);
    and_gate a17(a[17], b[17], out[17]);
    and_gate a18(a[18], b[18], out[18]);
    and_gate a19(a[19], b[19], out[19]);
    and_gate a20(a[20], b[20], out[20]);
    and_gate a21(a[21], b[21], out[21]);
    and_gate a22(a[22], b[22], out[22]);
    and_gate a23(a[23], b[23], out[23]);
    and_gate a24(a[24], b[24], out[24]);
    and_gate a25(a[25], b[25], out[25]);
    and_gate a26(a[26], b[26], out[26]);
    and_gate a27(a[27], b[27], out[27]);
    and_gate a28(a[28], b[28], out[28]);
    and_gate a29(a[29], b[29], out[29]);
    and_gate a30(a[30], b[30], out[30]);
    and_gate a31(a[31], b[31], out[31]);
endmodule



module or_32(a, b, out);
    input [31:0] a, b;
    output [31:0] out;

    or_gate a0(a[0], b[0], out[0]);
    or_gate a1(a[1], b[1], out[1]);
    or_gate a2(a[2], b[2], out[2]);
    or_gate a3(a[3], b[3], out[3]);
    or_gate a4(a[4], b[4], out[4]);
    or_gate a5(a[5], b[5], out[5]);
    or_gate a6(a[6], b[6], out[6]);
    or_gate a7(a[7], b[7], out[7]);
    or_gate a8(a[8], b[8], out[8]);
    or_gate a9(a[9], b[9], out[9]);
    or_gate a10(a[10], b[10], out[10]);
    or_gate a11(a[11], b[11], out[11]);
    or_gate a12(a[12], b[12], out[12]);
    or_gate a13(a[13], b[13], out[13]);
    or_gate a14(a[14], b[14], out[14]);
    or_gate a15(a[15], b[15], out[15]);
    or_gate a16(a[16], b[16], out[16]);
    or_gate a17(a[17], b[17], out[17]);
    or_gate a18(a[18], b[18], out[18]);
    or_gate a19(a[19], b[19], out[19]);
    or_gate a20(a[20], b[20], out[20]);
    or_gate a21(a[21], b[21], out[21]);
    or_gate a22(a[22], b[22], out[22]);
    or_gate a23(a[23], b[23], out[23]);
    or_gate a24(a[24], b[24], out[24]);
    or_gate a25(a[25], b[25], out[25]);
    or_gate a26(a[26], b[26], out[26]);
    or_gate a27(a[27], b[27], out[27]);
    or_gate a28(a[28], b[28], out[28]);
    or_gate a29(a[29], b[29], out[29]);
    or_gate a30(a[30], b[30], out[30]);
    or_gate a31(a[31], b[31], out[31]);
endmodule

module equals(a, b, out);
  input [31:0] a, b;
  output out;

  assign out = a == b;
endmodule

module ALU(a, b, ALUcontrol, out, zero);
    input [31:0] a, b;
    input [2:0] ALUcontrol;
    output [31:0] out;
    output zero;
    wire trash;

    wire [31:0] inverted, bmux, aandb, aorb, sum, zerosum, muxc0, muxc1;
    equals eq(a, b, zero);
    not_32 n(b, inverted);

    mux2_32 mux1(b, inverted, ALUcontrol[2], bmux);
    adder adder1(a, bmux, sum);
    zero_extend zero1(sum, zerosum);
    and_32 and1(a, bmux, aandb);
    or_32 or1(a, bmux, aorb);

    mux2_32 mux2(aorb, sum, ALUcontrol[1], muxc0);
    mux2_32 mux3(aandb, zerosum, ALUcontrol[1], muxc1);
        mux2_32 mux3(aandb, zerosum, ALUcontrol[1], muxc1);

    mux2_32 mux4(muxc0, muxc1, ALUcontrol[0], out);

    initial begin
      $display("sum %b", sum);
      $display("or %b", aorb);
      $display("and %b", aandb);
      $display("zerosum %b", zerosum);
      $display("ALUcontrol %b", ALUcontrol[1]);

      $display("muxc0 %b", muxc0);
      $display("muxc1 %b", muxc1);
      $display("out %b", out);
    end
endmodule