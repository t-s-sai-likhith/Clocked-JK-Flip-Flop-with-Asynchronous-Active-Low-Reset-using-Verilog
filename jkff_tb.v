`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.07.2026 23:07:29
// Design Name: 
// Module Name: jkff_tb
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
module jkff_tb;

reg clk;
reg rst;
reg j;
reg k;

wire q;
wire qbar;

jkff dut (
    .clk(clk),
    .rst(rst),
    .j(j),
    .k(k),
    .q(q),
    .qbar(qbar)
);

//////////////////////////////////////////////////////
// Clock Generation
//////////////////////////////////////////////////////

initial
begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

//////////////////////////////////////////////////////
// Test Stimulus
//////////////////////////////////////////////////////

initial
begin

    // Initialize Inputs
    rst = 1'b1;
    j   = 1'b0;
    k   = 1'b0;

    // Apply Asynchronous Reset
    #20 rst = 1'b0;

    // Release Reset
    #20 rst = 1'b1;

   
    #20;
    j = 1'b0;
    k = 1'b0;

   
    #20;
    j = 1'b1;
    k = 1'b0;

   
    #20;
    j = 1'b0;
    k = 1'b0;

   
    #20;
    j = 1'b0;
    k = 1'b1;

   
    #20;
    j = 1'b1;
    k = 1'b1;

    #20;
    j = 1'b1;
    k = 1'b1;

    
    #20;
    j = 1'b0;
    k = 1'b0;

    #40;

    $finish;

end



initial
begin
    $monitor("Time=%0t | rst=%b | clk=%b | J=%b | K=%b | Q=%b | Qbar=%b",
              $time, rst, clk, j, k, q, qbar);
end

endmodule
