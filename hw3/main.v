//`include "controller.v"
`include "util.v"
module main();
    reg [5:0] opcode = 6'b000000;

    wire b;
    //assign b = opcode == 6'b111111 ? 1 : 0;




    initial begin
      $display("%b", b);
    end
endmodule
