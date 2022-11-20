`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 02:27:07 PM
// Design Name: 
// Module Name: RCA_Display
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


module RLCA_Display(
    input clk,
    input clr,
    input [3:0] A,
    input [3:0] B,
    output [3:0] AN,
    output [6:0] CA
    );
    
    wire C_out;
    wire [3:0] Sum;
    
    Display d(
        .clk(clk),
        .clr(clr),
        .Dig1(A),
        .Dig2(B),
        .Dig3(C_out),
        .Dig4(Sum),
        .AN(AN),
        .CA(CA)
    ); 
   
    Lookahead_Carry_Adder LCA(
        .A(A),
        .B(B),
        .C_out(C_out),
        .Sum(Sum)
    );    
endmodule
