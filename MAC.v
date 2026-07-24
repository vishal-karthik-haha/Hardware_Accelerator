`timescale 1ns / 1ps

module MAC #(
    parameter DATA_WIDTH = 16,
    parameter ACC_WIDTH  = 32
)(
    input wire clk,
    input wire rst,
    input wire en,

    input wire signed [DATA_WIDTH-1:0] a,
    input wire signed [DATA_WIDTH-1:0] b,

    input wire signed [ACC_WIDTH-1:0] psum_in,

    output reg signed [ACC_WIDTH-1:0] psum_out
);

reg signed [2*DATA_WIDTH-1:0] product_reg;

always @(posedge clk) begin

    if(rst) begin
        product_reg <= 0;
        psum_out    <= 0;
    end

    else if(en) begin
        product_reg <= a * b;
        psum_out    <= psum_in + product_reg;
    end

end

endmodule
