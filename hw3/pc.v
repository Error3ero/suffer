module pc(clk, pc_next, pc);
    input clk;
    input [31:0] pc_next;
    output [31:0] pc;
    reg [31:0] pcr;
    always @(posedge clk) begin
        pcr = pc_next;
    end
    assign pc = pcr;
endmodule