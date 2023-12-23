`include "controller.v"
`include "util.v"

module main();
    wire a;
    ponos p(1, a);


    initial begin
        $display("%d", a);
    end
endmodule


module ponos(a, out);
    input a;
    output out;

    assign out = a ? 1 : 0;
endmodule