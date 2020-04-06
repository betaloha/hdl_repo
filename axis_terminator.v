`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2020 10:06:40 AM
// Design Name: 
// Module Name: axis_terminator
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


module axis_terminator #(parameter DATAWIDTH=64)(clk, m_axis_tdata, m_axis_tvalid, m_axis_tlast, m_axis_tready);
input clk;
input [DATAWIDTH-1:0] m_axis_tdata;
input m_axis_tvalid;
input m_axis_tlast;
output m_axis_tready;

assign m_axis_tready = 1'b1;
endmodule
