`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 04:51:39 PM
// Design Name: 
// Module Name: Calculate
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


module Calculate(
    input btnr,
    input [2:0] sw,
    input [2:0] state,
    input [7:0] XOR,
    input [7:0] AND,
    input [7:0] OR,
    input [9:0] SUM,
    input [7:0] DIF,
    output [9:0] ans
    );
    
endmodule

module XOR (
    input [7:0] num1,
    input [7:0] num2,
    output [7:0] ans
    );
    assign ans[0] = num1[0] ^ num2[0];
    assign ans[1] = num1[1] ^ num2[1];
    assign ans[2] = num1[2] ^ num2[2];
    assign ans[3] = num1[3] ^ num2[3];
    assign ans[4] = num1[4] ^ num2[4];
    assign ans[5] = num1[5] ^ num2[5];
    assign ans[6] = num1[6] ^ num2[6];
    assign ans[7] = num1[7] ^ num2[7];
    
endmodule