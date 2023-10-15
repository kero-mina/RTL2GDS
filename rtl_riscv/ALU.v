`timescale 1ns/1ps
module ALU(input [31:0] data1, data2, input [2:0] sel, output reg [31:0] aluresult,output reg zero);

always @(*)
begin
case(sel)

3'b000: aluresult = data1 + data2; //add
3'b001: aluresult = data1 - data2; //sub
3'b010: aluresult = data1 & data2; //and
3'b011: aluresult = data1 | data2; //or
3'b100: begin
if(data1 < data2)
          aluresult = 32'b1;
else
          aluresult = 32'b0;
        end     
default : aluresult = 0;

endcase
zero = (aluresult==0)? 1'b1 : 1'b0;
end

endmodule
