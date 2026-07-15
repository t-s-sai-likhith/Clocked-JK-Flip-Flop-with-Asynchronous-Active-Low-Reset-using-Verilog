`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 23:06:33
// Design Name: 
// Module Name: jkff
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


module jkff (
    input  wire clk,
    input  wire rst,
    input  wire j,
    input  wire k,
    output reg  q,
    output wire qbar
);

always @(posedge clk or negedge rst)
begin
    if (!rst)
        q <= 1'b0;
    else
    begin
        case ({j,k})

            2'b00 : q <= q;      // Hold

            2'b01 : q <= 1'b0;   // Reset

            2'b10 : q <= 1'b1;   // Set

            2'b11 : q <= ~q;     // Toggle

            default : q <= 1'bx;

        endcase
    end
end

assign qbar = ~q;

endmodule