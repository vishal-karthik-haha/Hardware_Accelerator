`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2026 17:46:08
// Design Name: 
// Module Name: MAC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MAC #(
    parameter DATA_WIDTH = 16,
    parameter ACC_WIDTH  = 32
)(
    input  wire clk,
    input  wire rst,
    input  wire en,

    input  wire signed [DATA_WIDTH-1:0] a,
    input  wire signed [DATA_WIDTH-1:0] b,

    output reg  signed [ACC_WIDTH-1:0]  acc_out
);

    reg signed [2*DATA_WIDTH-1:0] product_reg;
    always@(posedge clk) begin
        if(rst) begin
            product_reg <= 0;
            acc_out <= 0;
        end
        
        else begin
            product_reg <= a*b;
            acc_out <= acc_out + product_reg;
         end
        
      end

endmodule
