`timescale 1ns/1ps
module instr_mem (input [31:0] A ,output [31:0] RD);

reg [31:0] memory[0:255];

initial begin
$readmemh("Machine_Code.txt" , memory);
end

assign RD = memory[A[9:2]];

endmodule
