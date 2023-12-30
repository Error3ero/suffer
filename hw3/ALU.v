

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

    assign out = a & b;
endmodule

module or_32(a, b, out);
    input [31:0] a, b;
    output [31:0] out;

    assign out = a | b;
endmodule

module ALU(a, b, ALUcontrol, out, zero);
    input [31:0] a, b;
    input [2:0] ALUcontrol;
    output [31:0] out;
    output zero;
    assign zero = a == b;

    wire [31:0] inverted, bmux, aandb, aorb, sum, zerosum, muxc0, muxc1;

    not_32 n(b, inverted);

    mux2_32 mux1(b, inverted, ALUcontrol[2], bmux);
    adder adder1(a, bmux, sum);
    zero_extend zero1(sum, zerosum);
    and_32 and1(a, bmux, aandb);
    or_32 or1(a, bmux, aorb);

    mux2_32 mux2(aorb, sum, ALUcontrol[1], muxc0);
    mux2_32 mux3(aandb, zerosum, ALUcontrol[1], muxc1);
    mux2_32 mux4(muxc0, muxc1, ALUcontrol[0], out);
endmodule