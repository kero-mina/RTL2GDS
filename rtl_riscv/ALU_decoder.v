`timescale 1ns/1ps
module ALU_decoder(input opbit5,funct7bit5,input [2:0] funct3,input [1:0] aluop,output reg [2:0] alucontrol);

wire Rtype_sub;
assign Rtype_sub = funct7bit5 & opbit5;

always@(*)
begin
case (aluop)
2'b00 : alucontrol = 3'b000; //add
2'b01 : alucontrol = 3'b001; //sub
2'b10 : 
begin
case(funct3)
            3'b000: if(Rtype_sub)
                      alucontrol = 3'b001; //sub
                    else
                      alucontrol = 3'b000; //add,addi

            3'b110: alucontrol = 3'b011;   //or,ori
            3'b111: alucontrol = 3'b010;   //and,andi
            3'b010: alucontrol = 3'b100;
            default : alucontrol = 3'b000;
endcase
end
default : alucontrol = 3'b000; 
            

endcase
end

endmodule
