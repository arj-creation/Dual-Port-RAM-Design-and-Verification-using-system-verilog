`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2024 10:10:00 AM
// Design Name: 
// Module Name: design
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

// Code your design here
module dualport (
    input clk,
    input rst,
    input enb,
    input wr,
    input rd,
    input [4:0] w_addr,
    input [4:0] r_addr,
    input [7:0] w_data,
    output reg [7:0] r_data
);

    integer i;
    reg [7:0] mem [15:0];

    always @(posedge clk) begin
        if (!rst) begin
            // Reset memory to unknown state
            for (i = 0; i < 16; i = i + 1) begin
                mem[i] <= 8'bx;
            end
        end else begin
            if (enb) begin
                if (wr == 1 && rd == 0) begin
                    // Write operation
                    mem[w_addr] <= w_data;
                end else if (wr == 0 && rd == 1) begin
                    // Read operation
                    r_data <= mem[r_addr];
                end else if (wr == 1 && rd == 1) begin
                    // Simultaneous read and write
                    mem[w_addr] <= w_data;
                    r_data <= mem[r_addr];
                end else begin
                    // No operation, retain memory values
                    for (i = 0; i < 16; i = i + 1) begin
                        mem[i] <= mem[i];
                    end
                end
            end else begin
                // Enable is low, retain memory values
                for (i = 0; i < 16; i = i + 1) begin
                    mem[i] <= mem[i];
                end
            end
        end
    end

endmodule
