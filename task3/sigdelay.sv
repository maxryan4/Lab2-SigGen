module sigdelay #(
    parameter   A_WIDTH = 9,
                D_WIDTH = 8
)(
    input logic                     clk,    // clock
    input logic                     rst,    // reset
    input logic                     wr,     // write
    input logic                     rd,     // read
    input logic [D_WIDTH-1:0]       offset,
    input logic [A_WIDTH-1:0]       mic_signal,  // output data1
    output logic [A_WIDTH-1:0]      delayed_signal   // output data2
);

    logic [A_WIDTH-1:0] address;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .count (address)
);

ram sigRam (
    .clk (clk),
    .wr_en (wr),
    .wr_addr (address),
    .din (mic_signal),
    .rd_en (rd),
    .rd_addr (address + offset),
    .dout (delayed_signal)
);

endmodule
