//`include "controller.v"
`include "util.v"
module main();
    wire [31:0] a;
    assign a[0] = 1;
    assign a[1] = 1;
    assign a[2] = 1;
    assign a[3] = 1;
    assign a[4] = 1;
    assign a[5] = 1;
    assign a[6] = 1;
    assign a[7] = 1;
    assign a[8] = 1;
    assign a[9] = 1;
    assign a[10] = 0;
    assign a[11] = 0;
    assign a[12] = 0;
    assign a[13] = 0;
    assign a[14] = 0;
    assign a[15] = 0;
    assign a[16] = 0;
    assign a[17] = 0;
    assign a[18] = 0;
    assign a[19] = 0;
    assign a[20] = 1;
    assign a[21] = 1;
    assign a[22] = 1;
    assign a[23] = 1;
    assign a[24] = 1;
    assign a[25] = 1;
    assign a[26] = 1;
    assign a[27] = 1;
    assign a[28] = 1;
    assign a[29] = 1;
    assign a[30] = 0;
    assign a[31] = 0;
    wire [31:0] b;
    shl_2 s(a, b);
    assign b = {a[29:0], 2'b00};
    initial begin
      $display("%b", b);
    end
endmodule
