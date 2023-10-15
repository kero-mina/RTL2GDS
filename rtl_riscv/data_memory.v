`timescale 1ns/1ps
module data_memory 
 (
    input                       clk, WE,
    input  [31:0]          WD, 
    input  [31:0]          A, 
    output [31:0]          RD
);  

// the data memory is a 1kB word-addressable RAM
    reg [31:0] memory [0:255]; 

    always @(posedge clk) 
    begin
        if (WE) 
        begin
            memory[A[9:2]] <= WD;  
        end
    end
    
    assign RD = memory[A[9:2]] ;   

endmodule
