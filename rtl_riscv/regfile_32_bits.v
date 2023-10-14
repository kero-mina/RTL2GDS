`timescale 1ns/1ps
module regfile_32_bits 
(
    input                          clk, rst, WE3 ,
    input   [4:0]    A1, A2, A3,
    input   [31:0]            WD3,
    output  [31:0]            RD1, RD2
);

reg [31:0] register [0:31];
integer i;

assign  RD1 = register[A1];
assign  RD2 = register[A2];

always @(posedge clk, negedge rst)
begin
if(~rst) begin
for(i = 0; i < 32; i = i + 1)
register[i] <= 32'b0;
end

else if (WE3)
register[A3] <= WD3;

end

endmodule 
