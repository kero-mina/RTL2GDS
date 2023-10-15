`timescale 1ns/1ps
module register_32_bits (input clk,rst, input [31:0] pc_in,  output reg [31:0] pc_out);

always @(posedge clk, negedge rst)
begin
if (~rst)
pc_out <= 32'b0;
else
pc_out <= pc_in;
end

endmodule
