`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: intf
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


interface intf(input logic clk, rst);
    logic [4:0] w_addr;
    logic [4:0] r_addr;
    logic wr;
    logic rd;
    logic enb;
    logic [7:0] w_data;
    logic [7:0] r_data;
endinterface

