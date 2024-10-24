module counter #(
parameter WIDTH = 8
)(
// interface signals
input logic clk, // clock
input logic rst, // reset
input logic en, // counter enable
input logic [WIDTH-1:0] incr, // counter increment amount
output logic [WIDTH-1:0] count // count output
);

always_ff @ (posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else if (en) count <= count + incr;
endmodule
