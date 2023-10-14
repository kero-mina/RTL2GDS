`timescale 1ns/1ps
module main_decoder(input [6:0] op,input zero,
output reg memwrite,alusrc,regwrite,
output reg [1:0] resultsrc,immsrc,
output [1:0] pcsrc,
output reg [1:0] aluop );

reg branch,jump;

    always@ (*) begin
        case (op)
            //lw
            7'b000_0011: begin regwrite = 1'b1; immsrc = 2'b00; alusrc = 1'b1; memwrite = 1'b0; resultsrc = 2'b01; branch = 1'b0; aluop = 2'b00; jump = 1'b0 ; end
            //sw
            7'b010_0011: begin regwrite = 1'b0; immsrc = 2'b01; alusrc = 1'b1; memwrite = 1'b1; resultsrc = 2'bxx; branch = 1'b0; aluop = 2'b00; jump = 1'b0 ; end
            //R-Type
            7'b011_0011: begin regwrite = 1'b1; immsrc = 2'bxx; alusrc = 1'b0; memwrite = 1'b0; resultsrc = 2'b00; branch = 1'b0; aluop = 2'b10; jump = 1'b0 ; end   
            //beq
            7'b110_0011: begin regwrite = 1'b0; immsrc = 2'b10; alusrc = 1'b0; memwrite = 1'b0; resultsrc = 2'bxx; branch = 1'b1; aluop = 2'b01; jump = 1'b0 ; end
            //I-Type
            7'b001_0011: begin regwrite = 1'b1; immsrc = 2'b00; alusrc = 1'b1; memwrite = 1'b0; resultsrc = 2'b00; branch = 1'b0; aluop = 2'b10; jump = 1'b0 ; end
            //jal
            7'b110_1111: begin regwrite = 1'b1; immsrc = 2'b11; alusrc = 1'bx; memwrite = 1'b0; resultsrc = 2'b10; branch = 1'b0; aluop = 2'bxx; jump = 1'b1 ; end

            default:     begin regwrite = 1'b0; immsrc = 2'b00; alusrc = 1'b0; memwrite = 1'b0; resultsrc = 1'b0;  branch = 1'b0; aluop = 2'b00; jump = 1'b0 ; end
        endcase

    end

    assign branch_sig = branch & zero; 
    assign pcsrc = branch_sig | jump ; 
endmodule
