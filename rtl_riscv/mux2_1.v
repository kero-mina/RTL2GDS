`timescale 1ns/1ps
module mux2_1(input sel,input [31:0] in1,in2 , output reg [31:0] out);

always @(*)
begin
if(sel)
out = in2;
else
out = in1;
end

endmodule
