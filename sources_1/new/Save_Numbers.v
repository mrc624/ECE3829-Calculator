`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 01:15:46 PM
// Design Name: 
// Module Name: Save_Numbers
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

module Save_Num
# ( parameter TRIGGER_STATE = 2'b00)
    (
    input [7:0] sw,
    input [1:0] state,
    input btnr,
    output reg [7:0] num
    );
    always @ (posedge btnr) begin
        if (state == TRIGGER_STATE - 1) begin
            num <= sw;
        end
    end
endmodule