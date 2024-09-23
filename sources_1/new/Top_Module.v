`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2024 01:11:54 PM
// Design Name: 
// Module Name: Top_Module
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
    output [2:0] LED,
    output [6:0] seg_out,
    output [3:0] an_out
    );
    
    parameter WAIT = 2'b00;
    parameter LOAD_FIRST = 2'b01;
    parameter LOAD_SECOND = 2'b10;
    parameter CALCULATE = 2'b11;
    
    //Debounce
    wire btnr;
    Debounce DebR (BTNR, clk, btnr);
    wire btnl;
    Debounce DebL (BTNL, clk, btnl);
    
    //State Machine
    wire [1:0] state;
    FSM # (.WAIT(WAIT),
           .LOAD_FIRST(LOAD_FIRST),
           .LOAD_SECOND(LOAD_SECOND),
           .CALCULATE(CALCULATE))
    State_Machine(
            .btnr(btnr), 
            .btnl(btnl), 
            .state(state)
            );
    
    //Saving the numbers
    wire [7:0] num1;
    Save_Num # (.TRIGGER_STATE(LOAD_FIRST))
    Save_Num1(.sw(sw),
              .state(state),
              .num(num1),
              .btnr(btnr)
              );
    wire [7:0] num2;
    Save_Num # (.TRIGGER_STATE(LOAD_SECOND))
    Save_Num2(.sw(sw),
              .state(state),
              .num(num2),
              .btnr(btnr)
              );
    //Calculate
    wire [7:0] XOR;
    wire [7:0] AND;
    wire [7:0] OR;
    wire [9:0] SUM;
    wire [7:0] DIF;
    wire [9:0] ans;
    Calculate(
    .btnr(btnr),
    .sw(sw),
    .state(state),
    .XOR(XOR),
    .AND(AND),
    .OR(OR),
    .SUM(SUM),
    .DIF(DIF),
    .ans(ans)
    );
    
    XOR(
    .num1(num1),
    .num2(num2),
    .ans(XOR)
    );
    
    AND(
    .num1(num1),
    .num2(num2),
    .ans(AND)
    );
    
    OR(
    .num1(num1),
    .num2(num2),
    .ans(OR)
    );
    
    ADD(
    .num1(num1),
    .num2(num2),
    .ans(SUM)
    );
    
    SUB(
    .num1(num1),
    .num2(num2),
    .ans(DIF)
    );
    
    
    //Handle display
    wire [7:0] disp0;
    wire [7:0] disp1;
    wire [7:0] disp2;
    wire [7:0] disp3;
    Handle_Display # (.WAIT(WAIT),
                      .LOAD_FIRST(LOAD_FIRST),
                      .LOAD_SECOND(LOAD_SECOND),
                      .CALCULATE(CALCULATE) )
    Handle_Disp (
        .state(state),
        .ans(ans),
        .num1(num1),
        .num2(num2),
        .disp0(disp0),
        .disp1(disp1),
        .disp2(disp2),
        .disp3(disp3)
        );
        
    Display Display(
        .num3(disp3),
        .num2(disp2),
        .num1(disp1),
        .num0(disp0),
        .clk(clk),
        .seg(seg_out),
        .an(an_out)
    );
    
    //Testing
    assign LED = state;
endmodule
