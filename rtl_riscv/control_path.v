`timescale 1ns/1ps
`include"main_decoder.v"
`include"ALU_decoder.v"
module control_path(
  
    input   [6:0]    op,
    input   [2:0]    funct3,
    input            zero, funct7,
    output  [2:0]    alucontrol,
    output           memwrite, alusrc, regwrite,
    output  [1:0]    pcsrc, immsrc, resultsrc
);

wire [1:0] aluop;

main_decoder main_dec_inst(.op(op),.zero(zero),.memwrite(memwrite),.alusrc(alusrc),.regwrite(regwrite),.resultsrc(resultsrc),.immsrc(immsrc),.pcsrc(pcsrc),.aluop(aluop));

ALU_decoder alu_dec_inst(.opbit5(op[5]),.funct7bit5(funct7),.funct3(funct3),.aluop(aluop),.alucontrol(alucontrol));

endmodule
