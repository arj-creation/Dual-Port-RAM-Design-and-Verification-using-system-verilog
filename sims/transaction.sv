`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: transaction
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


class transaction;
    rand logic [7:0] w_data;
    logic enb = 1;
    logic wr;
    logic rd;
    rand logic [4:0] w_addr;
    logic [4:0] r_addr;
    logic [4:0] r_data;

    // Constraint for write address
    constraint w_addr1 { w_addr <= 16'h000f; }

    // Function to display transaction details
    function void display(string name);
        $display("---------- %s --------- %t", name, $time);
        $display(
            "wr = %0h, rd = %0h, w_addr = %0h, w_data = %0h, r_addr = %0h, r_data = %0h, enb = %0b",
            wr, rd, w_addr, w_data, r_addr, r_data, enb
        );
    endfunction

endclass
