`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: monitor
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


class monitor;
    transaction tx;
    mailbox mon2scb;

    virtual intf vif;

    // Constructor
    function new(mailbox mon2scb, virtual intf vif);
        this.mon2scb = mon2scb;
        this.vif = vif;
    endfunction

    // Task to monitor and collect transactions
    task run();
        tx = new();
        #1;
        repeat (1) begin
            #1;
            // Collect data from the interface
            tx.enb = vif.enb;
            tx.wr = vif.wr;
            tx.rd = vif.rd;
            tx.w_addr[4:0] = vif.w_addr[4:0];
            tx.r_addr[4:0] = vif.r_addr[4:0];
            tx.w_data[7:0] = vif.w_data[7:0];

            // Display the transaction and pass it to the scoreboard
            tx.display("collected in monitor");
            mon2scb.put(tx);
        end
    endtask

endclass
