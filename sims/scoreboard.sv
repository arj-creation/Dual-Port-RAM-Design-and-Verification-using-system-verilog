`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: scoreboard
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


class scoreboard;
    transaction tx, tx_ref;
    mailbox mbx;

    // Constructor
    function new(mailbox mon2scb);
        mbx = mon2scb;
    endfunction

    // Task to compare transactions
    task run();
        repeat (1) begin
            // Retrieve transaction from mailbox
            mbx.get(tx);

            // Display the transaction
            tx.display("scb");

            // Create a reference transaction and copy values
            tx_ref = new();
            tx_ref.enb = tx.enb;
            tx_ref.wr = tx.wr;
            tx_ref.rd = tx.rd;
            tx_ref.w_addr[4:0] = tx.w_addr[4:0];
            tx_ref.r_addr[4:0] = tx.r_addr[4:0];
            tx_ref.w_data[7:0] = tx.w_data[7:0];

            // Small delay for stability
            #1;
        end
    endtask
endclass

