module pc(clk, pc_next, pc);
    input clk;
    input [31:0] pc_next;
    output reg [31:0] pc;
    always @(posedge clk)
        pc <= pc_next;
endmodule