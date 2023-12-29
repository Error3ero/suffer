//`include "controller.v"
`include "util.v"
module main();
    reg [5:0] opcode = 6'b000000;
    wire c1;
    assign c1 = opcode == 6'b000000;
    reg b[1:0];
    assign b = c1 ? 2'b01 : 2'b10;




    initial begin
      $display("%b", c1);
      $display("%b", b);
    end
endmodule
