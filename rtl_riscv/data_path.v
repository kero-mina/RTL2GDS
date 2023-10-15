`timescale 1ns/1ps
`include"register_32_bits.v"
`include"mux3_1.v"
`include"adder_32_bits.v"
`include"regfile_32_bits.v"
`include"immediate_generate.v"
`include"mux2_1.v"
`include"ALU.v"
module data_path(input clk,rst,
input [31:0] instr,readdata,
input alusrc,regwrite,
input [1:0] pcsrc,immsrc,resultsrc,
input [2:0] alucontrol,
output [31:0] pc,aluresult,writedata,
output zero);

wire [31:0] pcnext,immext,data1,data2,result,pcplus4,pctarget;

register_32_bits pc_reg_inst(.clk(clk),.rst(rst),.pc_in(pcnext),.pc_out(pc));

mux3_1 pc_next_mux(.in1(pcplus4),.in2(pctarget),.in3(result),.s(pcsrc),.y(pcnext));

adder_32_bits adder_inst_pcplus4(.in1(pc),.in2(32'd4),.out(pcplus4));

adder_32_bits adder_inst_pctarget(.in1(pc),.in2(immext),.out(pctarget));

regfile_32_bits reg_file_inst(.clk(clk),.rst(rst),.WE3(regwrite),.A1(instr[19:15]),.A2(instr[24:20]),.A3(instr[11:7]),.WD3(result),.RD1(data1),.RD2(writedata));

immediate_generate imm_gen_inst(.instr(instr[31:7]),.immsrc(immsrc),.immext(immext));

mux3_1 mux3_1_inst(.in1(aluresult),.in2(readdata),.in3(pcplus4),.s(resultsrc),.y(result));

mux2_1 mux2_1_inst(.in1(writedata),.in2(immext),.sel(alusrc),.out(data2));

ALU ALU_inst(.data1(data1),.data2(data2),.sel(alucontrol),.aluresult(aluresult),.zero(zero));
endmodule

