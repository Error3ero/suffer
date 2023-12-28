`include "controller.v"
`include "ALU.v"

module main();
    wire a = 0;
    wire b = 1;

    wire c;
    assign c = (a == b) == (a == 1);
    initial begin
        $display("peins %d", c);
    end
endmodule

