`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 01:58:42 PM
// Design Name: 
// Module Name: Lookahead_Carry_Adder
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


module Lookahead_Carry_Adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output C_out
    );
    wire [3:0] G;
    wire [3:0] P;
    wire [4:1] C;
    
    and a0(G[0], A[0], B[0]);
    and a1(G[1], A[1], B[1]);  
    and a2(G[2], A[2], B[2]);  
    and a3(G[3], A[3], B[3]);  
    
    xor x0(P[0], A[0], B[0]);  
    xor x1(P[1], A[1], B[1]); 
    xor x2(P[2], A[2], B[2]); 
    xor x3(P[3], A[3], B[3]); 
    
    assign C[1] = G[0] | (P[0] & 0);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & 0);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & 0);
    assign C_out = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & 0);
    
    xor x4(Sum[0], P[0], 0);  
    xor x5(Sum[1], P[1], C[1]); 
    xor x6(Sum[2], P[2], C[2]); 
    xor x7(Sum[3], P[3], C[3]); 
endmodule
