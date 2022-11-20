`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 02:28:33 PM
// Design Name: 
// Module Name: Display
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


module Display(
    input clk,
    input clr,
    input [3:0] Dig1,
    input [3:0] Dig2,
    input [3:0] Dig3,
    input [3:0] Dig4,
    output reg [3:0] AN,
    output reg [6:0] CA
    );
    
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter; 
    wire [1:0] LED_activating_counter;     
    always @(posedge clk or posedge clr)
    begin 
        if(clr==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:18];
    always @(*)
    begin
        case(LED_activating_counter)
        2'b00: begin
            AN = 4'b0111; 
            LED_BCD = Dig1;
            end
        2'b01: begin
            AN = 4'b1011; 
            LED_BCD = Dig2;
            end
        2'b10: begin
            AN = 4'b1101; 
            LED_BCD = Dig3;
            end
        2'b11: begin
            AN = 4'b1110; 
            LED_BCD = Dig4;   
            end
        endcase
        if (clr == 1) begin
            LED_BCD = 0;
            AN = 4'b0000;
        end
    end 
    always @(*)
    begin
        case(LED_BCD)
        4'b0000: CA = 7'b0000001; // "0"     
        4'b0001: CA = 7'b1001111; // "1" 
        4'b0010: CA = 7'b0010010; // "2" 
        4'b0011: CA = 7'b0000110; // "3" 
        4'b0100: CA = 7'b1001100; // "4" 
        4'b0101: CA = 7'b0100100; // "5" 
        4'b0110: CA = 7'b0100000; // "6" 
        4'b0111: CA = 7'b0001111; // "7" 
        4'b1000: CA = 7'b0000000; // "8"     
        4'b1001: CA = 7'b0000100; // "9" 
        4'b1010: CA = 7'b0001000; // "A" 
        4'b1011: CA = 7'b1100000; // "b" 
        4'b1100: CA = 7'b0110001; // "C" 
        4'b1101: CA = 7'b1000010; // "d" 
        4'b1110: CA = 7'b0110000; // "E"     
        4'b1111: CA = 7'b0111000; // "F"
        default: CA = 7'b0000001; // "0"
        endcase
    end
 endmodule
