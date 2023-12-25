`include "controller.v"
`include "util.v"
`include "ALU.v"

module main();
    reg [15:0] a = 16'b1010111010100001;
    wire [31:0] b;
    zero_extend ze(a, b);

    initial begin
        $display("peins %b", b);
    end
endmodule
