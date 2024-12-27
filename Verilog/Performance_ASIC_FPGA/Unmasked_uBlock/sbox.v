`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/22 20:31:30
// Design Name: 
// Module Name: sbox
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
module sbox(x, y);
   input [3:0] x;
   output [3:0] y;
   
   nand_xor nandx1(x[3],x[2],x[0],y[0]);
   nor_xnor norx1(x[2],x[1],x[3],y[3]);
   nand_xor nandx2(x[1],y[0],x[2],y[2]);
   nor_xnor norx2(y[0],y[3],x[1],y[1]);
endmodule