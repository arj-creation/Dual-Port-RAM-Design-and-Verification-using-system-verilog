`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: testbenchtop
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

// Code your testbench here
// or browse Examples
`include "intf.sv"
`include "transaction.sv"
`include "monitor.sv"
`include "driver.sv"
`include "generator.sv"
`include "scoreboard.sv"
`include "environment.sv"

module top;
    environment env;

    bit clk, rst;

    // Clock generation
    always #5 clk = !clk;

    // Reset initialization
    initial begin
        rst = 0;
        repeat (1) @ (negedge clk);
        rst = 1;
        #1000 $finish;
    end

    // Interface instantiation
    intf pif(clk, rst);

    // DUT instantiation
    dualport dp (
        .clk(pif.clk),
        .rst(pif.rst),
        .enb(pif.enb),
        .wr(pif.wr),
        .rd(pif.rd),
        .w_addr(pif.w_addr),
        .r_addr(pif.r_addr),
        .w_data(pif.w_data),
        .r_data(pif.r_data)
    );

    // Environment instantiation and run
    initial begin
        env = new(pif);
        env.run();
    end

    // Dumping waveforms
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end

endmodule

