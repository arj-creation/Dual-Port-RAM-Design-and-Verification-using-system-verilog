`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:13:17 AM
// Design Name: 
// Module Name: environment
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


class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;

    mailbox gen2drv = new();
    mailbox mon2scb = new();

    virtual intf vif;

    // Constructor
    function new(virtual intf vif);
        this.vif = vif;
        gen = new(gen2drv);
        drv = new(gen2drv, vif);
        mon = new(mon2scb, vif);
        scb = new(mon2scb);
    endfunction

    // Task to run the environment
    task run();
        // First phase: write operations
        fork
            gen.write();
            drv.run();
            mon.run();
            scb.run();
        join
        
        #50;

        // Second phase: read operations
        fork
            gen.read();
            drv.run();
            mon.run();
            scb.run();
        join
        
        #50;

        // Third phase: read and write operations
        fork
            gen.read_write();
            drv.run();
            mon.run();
            scb.run();
        join

        // Additional standalone runs
        #10 drv.run();
        #20 mon.run();
        #20 scb.run();
    endtask

endclass

