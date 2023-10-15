`timescale 1ns/1ps
`include"data_path.v"
`include"control_path.v"
module top(
    input clk,rst,
    input [31:0] instr,readdata,
    output [31:0] aluresult,pc,writedata,
    output memwrite
 );

// interconnection 

 wire  regwrite , alusrc, zero;
 wire [2:0] alucontrol ; 
 wire [1:0] pcsrc,immsrc,resultsrc ;

//DataPath
data_path D_Path (
        .clk(clk), 
        .rst(rst),
        .instr (instr),
        .readdata (readdata),
        .pc(pc),
        .aluresult (aluresult), 
        .writedata (writedata),
        .alusrc (alusrc), 
        .regwrite (regwrite), 
        .pcsrc(pcsrc),
        .immsrc (immsrc), 
        .resultsrc (resultsrc),
        .alucontrol (alucontrol),
        .zero(zero)
    );

// control unit
control_path Con_Uni (
        .op(instr[6:0]),
        .funct3(instr[14:12]), 
        .funct7(instr[30]), 
        .zero(zero), 
        .pcsrc(pcsrc), 
        .resultsrc(resultsrc), 
        .memwrite(memwrite), 
        .alusrc(alusrc), 
        .regwrite(regwrite), 
        .immsrc(immsrc), 
        .alucontrol(alucontrol)
    );

endmodule
