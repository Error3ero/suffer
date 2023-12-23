module decoder(clk, opcode, memtoreg, memwrite, branch, ALUsrc, regdst, regwrite, ALUop);
    input clk;
    input [5:0] opcode;
    output memtoreg, memwrite, branch, ALUsrc, regdst, regwrite;
    output [1:0] ALUop;
    
    supply0 zero;
    supply1 one;

    always @ (posedge clk) begin
        case (opcode)
            6'b000000 : begin
                assign memtoreg = zero;
                assign memwrite = zero;
                assign branch = zero;
                assign ALUsrc = zero;
                assign regdst = one;
                assign regwrite = one;
                assign ALUop[1] = one;
                assign ALUop[0] = zero;
                end
            6'b100011 : begin
                memtoreg = one;
                memwrite = zero;
                branch = zero;
                ALUsrc = one;
                regdst = zero;
                regwrite = one;
                ALUop[1] = zero;
                ALUop[0] = zero;
                end
            6'b101011 : begin
                memtoreg = zero;
                //memwrite = one'bx;
                branch = one;
                ALUsrc = zero;
                regdst = one;
                //regwrite = one'bx;
                ALUop[1] = zero;
                ALUop[0] = zero;
                end
            6'b000100 : begin
                memtoreg = zero;
                //memwrite = one'bx;
                branch = zero;
                ALUsrc = one;
                regdst = zero;
                //regwrite = one'bx;
                ALUop[1] = zero;
                ALUop[0] = one;
                end
        endcase
    end
endmodule