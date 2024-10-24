module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    input logic                 clk,    // clock
    input logic                 rst,    // reset
    input logic                 en,     // enable
    input logic [D_WIDTH-1:0]   incr,   // increment for addr counter
    input logic [D_WIDTH-1:0]   offset,
    output logic [D_WIDTH-1:0]   dout1,   // output data
    output logic [D_WIDTH-1:0]   dout2    // output data
);

    logic [A_WIDTH-1:0]         address; // interconnect wire
    //logic [A_WIDTH-1:0]         address2; // interconnect wire

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address)
);

rom sineRom (
    .clk (clk),
    .addr (address),
    //.addr2 (address2),
    .dout1 (dout1),
    .dout2 (dout2),
    .offset (offset)
);

endmodule
