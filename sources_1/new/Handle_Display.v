`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 01:21:09 PM
// Design Name: 
// Module Name: Handle_Display
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


module Handle_Display
# ( parameter WAIT = 2'b00,
    parameter LOAD_FIRST = 2'b01,
    parameter LOAD_SECOND = 2'b10,
    parameter CALCULATE = 2'b11,
    parameter OFF = 5'b10000)
    (
    input [1:0] state,
    input [9:0] ans,
    input [7:0] num1,
    input [7:0] num2,
    output reg [7:0] disp0,
    output reg [7:0] disp1,
    output reg [7:0] disp2,
    output reg [7:0] disp3
    );
    parameter FIFTEEN = 4'b1111;
    always @ (*) begin
      if (state == WAIT) begin
        disp0 = OFF;
        disp1 = OFF;
        disp2 = OFF;
        disp3 = OFF;
      end else if (state == LOAD_FIRST) begin
        disp0 = num1[3:0];
        disp1 = num1[7:4];
      end else if (state == LOAD_SECOND) begin
        disp0 = num2[3:0];
        disp1 = num2[7:4];
      end else if (state == CALCULATE) begin
        disp0 = ans[3:0];
        disp1 = ans[7:4];
        disp2 = ans[9:8];
        disp3 = OFF;
      end
    end
endmodule
