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
    output reg [9:0] ans
    );
    
    parameter XOR_STATE = 3'b000;
    parameter AND_STATE = 3'b001;
    parameter OR_STATE = 3'b010;
    parameter ADD_STATE = 3'b011;
    parameter SUB_STATE = 3'b100;
    
    always @ (*) begin //this is essentially a mux
        if (sw == XOR_STATE) begin
            ans = XOR;
        end else if (sw == AND_STATE) begin
            ans = AND;
        end else if (sw == OR_STATE) begin
            ans = OR;
        end else if (sw == ADD_STATE) begin
            ans = SUM;
        end else if (sw == SUB_STATE) begin
            ans = DIF;
        end
    end
    
endmodule

module XOR (
    input [7:0] num1,
    input [7:0] num2,
    output [7:0] ans
    );
    for (genvar i = 0; i <= 7; i = i + 1) begin
        assign ans[i] = num1[i] ^ num2[i];
    end
endmodule

module AND (
    input [7:0] num1,
    input [7:0] num2,
    output [7:0] ans
    );
    for (genvar i = 0; i <= 7; i = i + 1) begin
        assign ans[i] = num1[i] * num2[i];
    end
endmodule

module OR (
    input [7:0] num1,
    input [7:0] num2,
    output [7:0] ans
    );
    for (genvar i = 0; i <= 7; i = i + 1) begin
        assign ans[i] = num1[i] | num2[i];
    end
endmodule

module ADD(
    input [7:0] num1,
    input [7:0] num2,
    output [9:0] ans
    );
    assign ans = num1 + num2;
endmodule

module SUB(
    input [7:0] num1,
    input [7:0] num2,
    output [7:0] ans
    );
    assign ans = num1 - num2;
endmodule