module decoder(opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input [5:0] opcode;
    output wire memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output wire [1:0] ALUop;

    reg [7:0] toOut;

    assign memtoreg = toOut[7];
    assign memwrite = toOut[6];
    assign branch = toOut[5];
    assign ALUsrc = toOut[4];
    assign regdst = toOut[3];
    assign regwrite = toOut[2];
    assign ALUop[1] = toOut[1];
    assign ALUop[0] = toOut[0];

    supply0 zero;
    supply1 one;

    always begin
        case (opcode)
            6'b000000 : begin
                toOut[7] = 0;
                toOut[6] = 0;
                toOut[5] = 0;
                toOut[4] = 0;
                toOut[3] = 1;
                toOut[2] = 1;
                toOut[1] = 1;
                toOut[0] = 0;
                end
            6'b100011 : begin
                toOut[7] = 1;
                toOut[6] = 0;
                toOut[5] = 0;
                toOut[4] = 1;
                toOut[3] = 0;
                toOut[2] = 1;
                toOut[1] = 0;
                toOut[0] = 0;
                end
            6'b101011 : begin
                toOut[7] = 0;
                toOut[6] = 1'bx;
                toOut[5] = 1;
                toOut[4] = 0;
                toOut[3] = 1;
                toOut[2] = 1'bx;
                toOut[1] = 0;
                toOut[0] = 0;
                end
            6'b000100 : begin
                toOut[7] = 0;
                toOut[6] = 1'bx;
                toOut[5] = 0;
                toOut[4] = 1;
                toOut[3] = 0;
                toOut[2] = 1'bx;
                toOut[1] = 0;
                toOut[0] = 1;
                end
        endcase
    end
endmodule