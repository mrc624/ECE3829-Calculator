`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2024 08:42:53 PM
// Design Name: 
// Module Name: FSM_test
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


module test_FSM(
    );
    reg btnr;
    reg btnl;
    wire [1:0] state;
    initial begin
    btnl = 1;
    #50;
    btnl = 0;
    #50;
    btnr = 1;
    #50;
    btnr = 0;
    if (state == 1) begin
        $display("PASS: STATE 1 TEST");
    end else begin
        $display("FAIL: STATE 1 TEST");
    end
    #50; //should be in state 1
    btnr = 1;
    #50;
    btnr = 0;
    if (state == 2) begin
        $display("PASS: STATE 2 TEST");
    end else begin
        $display("FAIL: STATE 2 TEST");
    end
    #50
    btnr = 1;
    #50;
    btnr = 0;
    if (state == 3) begin
        $display("PASS: STATE 3 TEST");
    end else begin
        $display("FAIL: STATE 3 TEST");
    end
    #50
    btnl = 1;
    #50;
    btnl = 0;
    if (state == 0) begin
        $display("PASS: STATE 0 TEST");
    end else begin
        $display("FAIL: STATE 0 TEST");
    end
    #50
    $stop;
    end
    
    FSM uuti (.state(state),
              .btnl(btnl),
              .btnr(btnr)
              );
endmodule
