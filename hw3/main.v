`include "controller.v"
`include "ALU.v"

module main();
    reg [15:0] a = 16'b1010111010100001;
    reg [15:0] b = 16'b1010111010100001;
    wire c;
    assign c = a == b ? 1 : 0;

    initial begin
        $display("peins %d", c);
    end
endmodule
