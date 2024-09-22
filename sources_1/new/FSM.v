`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2024 07:00:36 PM
// Design Name: 
// Module Name: FSM
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

module FSM
# ( parameter WAIT = 2'b00,
    parameter LOAD_FIRST = 2'b01,
    parameter LOAD_SECOND = 2'b10,
    parameter CALCULATE = 2'b11)
    (
    input btnr,
    input btnl,
    output reg [1:0] state
    );
    
    always @ ( posedge (btnr | btnl) ) begin
        if (btnl == 1'b1) begin
            state <= WAIT;
        end else begin
            if (state == WAIT) begin
                state <= LOAD_FIRST;
            end else if (state == LOAD_FIRST) begin
                state <= LOAD_SECOND;
            end else if (state == LOAD_SECOND) begin
                state <= CALCULATE;
            end
        end        
    end
endmodule










