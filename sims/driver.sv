`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: driver
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


class driver;
    transaction tx;
    mailbox gen2drv;

    virtual intf vif;

    // Constructor
    function new(mailbox gen2drv, virtual intf vif);
        this.gen2drv = gen2drv;
        this.vif = vif;
    endfunction

    // Task to run the driver
    task run();
        repeat (1) begin
            // Get transaction from mailbox
            gen2drv.get(tx);

            // Drive interface signals
            vif.enb = tx.enb;
            vif.wr = tx.wr;
            vif.rd = tx.rd;
            vif.w_addr[4:0] = tx.w_addr[4:0];
            vif.r_addr[4:0] = tx.r_addr[4:0];
            vif.w_data[7:0] = tx.w_data[7:0];

            // Small delay for simulation stability
            #1;

            // Display transaction details
            tx.display("driver with output");
        end
    endtask
endclass

