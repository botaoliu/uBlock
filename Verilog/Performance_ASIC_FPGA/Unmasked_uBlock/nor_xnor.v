`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/22 20:39:09
// Design Name: 
// Module Name: nor_xnor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module nor_xnor(in1, in2, in3, out);
     input in1;
     input in2;
     input in3;
     output out;
     
     assign  out = ~((~(in1 | in2)) ^ in3);
endmodule
