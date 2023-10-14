`timescale 1ns/1ps
module mux3_1(input [31:0] in1,in2,in3, input [1:0] s, output  [31:0] y);

assign y = s[1] ? in3 : (s[0] ? in2 :in1);

endmodule
