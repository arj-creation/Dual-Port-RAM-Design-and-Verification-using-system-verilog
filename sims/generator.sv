`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: generator
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

class generator;
    transaction tx;
    mailbox gen2drv;

    logic [4:0] w_addr;

    // Constructor
    function new(mailbox gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    // Task to perform a write operation
    task write();
        repeat (1) begin
            tx = new();
            tx.randomize();
            tx.wr = 1;
            tx.rd = 0;
            w_addr = tx.w_addr;
            gen2drv.put(tx);
            tx.display("generator writing");
        end
    endtask

    // Task to perform a read operation
    task read();
        repeat (1) begin
            tx = new();
            tx.wr = 0;
            tx.rd = 1;
            tx.r_addr = w_addr;
            gen2drv.put(tx);
            tx.display("generator reading");
        end
    endtask

    // Task to perform read and write operations
    task read_write();
        repeat (1) begin
            tx = new();
            tx.randomize();
            tx.wr = 1;
            tx.rd = 0;
            w_addr = tx.w_addr;
            gen2drv.put(tx);
            tx.display("generator reading_writing wr");
        end

        #10;

        repeat (1) begin
            tx.wr = 0;
            tx.rd = 1;
            tx.r_addr = w_addr;
            gen2drv.put(tx);
            tx.display("generator reading_writing rd");
        end
    endtask
endclass

