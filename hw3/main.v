`include "controller.v"
`include "ALU.v"

module main();
    reg [15:0] a = 16'b1010111010100001;
    reg [15:0] b = 16'b1010111010000001;
    wire c = a == b;

    initial begin
        $display("peins %d", c);
    end
endmodule

