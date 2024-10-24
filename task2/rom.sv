module rom #(
    parameter   ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)(
    input logic                     clk,
    input logic [ADDRESS_WIDTH-1:0] addr,
    //input logic [ADDRESS_WIDTH-1:0] addr2,
    input logic [ADDRESS_WIDTH-1:0] offset,
    output logic [DATA_WIDTH-1:0]   dout1,
    output logic [DATA_WIDTH-1:0]   dout2
);

logic [DATA_WIDTH-1:0] rom_array1[2**ADDRESS_WIDTH-1:0];
//logic [DATA_WIDTH-1:0] rom_array2[2**ADDRESS_WIDTH-1:0];

initial begin
    $display("Loading rom.");
    $readmemh("sinerom.mem", rom_array1);
    //$readmemh("sinerom.mem", rom_array2);
end;

always_ff @(posedge clk) begin
    //output is synchronous
    dout1 <= rom_array1[addr];
    dout2 <= rom_array1[addr + offset];
end

endmodule
