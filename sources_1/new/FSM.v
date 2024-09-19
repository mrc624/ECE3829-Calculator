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


module Top_Module(
    input clk,
    input [7:0] sw,
    input BTNR,
    input BTNL,
    output [6:0] seg_out,
    output [3:0] an_out
    );
    
    wire btnr;
    Debounce(BTNR, clk, btnr);
    wire btnl;
    Debounce(BTNL, clk, btnl);
    
    wire [2:0] state;
    FSM (btnr, btnl, state);
    
    Display_8Bit(state, clk, seg_out, an_out);
    
endmodule

module FSM(
    input btnr,
    input btnl,
    output reg [2:0] state
    );
    
    parameter WAIT = 2'b00;
    parameter LOAD_FIRST = 2'b01;
    parameter LOAD_SECOND = 2'b10;
    parameter CALCULATE = 2'b11;
    
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










