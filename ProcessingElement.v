`timescale 1ns / 1ps

module ProcessingElement #(
    parameter DATA_WIDTH = 16,
    parameter ACC_WIDTH  = 32
)(
    input wire clk,
    input wire rst,
    input wire en,

    input wire signed [DATA_WIDTH-1:0] a_in,
    input wire signed [DATA_WIDTH-1:0] b_in,

    input wire signed [ACC_WIDTH-1:0] psum_in,

    output reg signed [DATA_WIDTH-1:0] a_out,
    output reg signed [DATA_WIDTH-1:0] b_out,

    output wire signed [ACC_WIDTH-1:0] psum_out
);

reg signed [DATA_WIDTH-1:0] A_reg;
reg signed [DATA_WIDTH-1:0] B_reg;

always @(posedge clk) begin

    if(rst) begin

        A_reg <= 0;
        B_reg <= 0;

        a_out <= 0;
        b_out <= 0;

    end

    else if(en) begin

        // Store incoming operands
        A_reg <= a_in;
        B_reg <= b_in;

        // Forward previous values
        a_out <= A_reg;
        b_out <= B_reg;

    end

end

MAC #(
    .DATA_WIDTH(DATA_WIDTH),
    .ACC_WIDTH(ACC_WIDTH)
)
MAC_inst
(
    .clk(clk),
    .rst(rst),
    .en(en),

    .a(A_reg),
    .b(B_reg),

    .psum_in(psum_in),

    .psum_out(psum_out)
);

endmodule
