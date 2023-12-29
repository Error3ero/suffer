module pc(clk, pc_next, pc);
    input clk;
    input [31:0] pc_next;
    output reg [31:0] pc;
    always @(posedge clk) begin
        pc = pc_next;
        $display("pc_next %b", pc_next);
    end
endmodule