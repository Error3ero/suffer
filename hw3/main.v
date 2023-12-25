`include "controller.v"
`include "ALU.v"

module main();
    reg [15:0] a = 16'b1010111010100001;
    wire b = a == 16'b1010111010100001;

    initial begin
        $display("peins %d", b);
    end
endmodule
