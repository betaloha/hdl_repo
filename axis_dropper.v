`timescale 1ns / 1ps
// AXI-stream packet dropper. For use with AXI-Stream switch IP.
// Korakit Seemakhupt
// korakit@virginia.edu
module axis_stream_dropper(
input clk,
input rst,

input [63:0] s_packet_axis_tdata,
input s_packet_axis_tvalid,
input s_packet_axis_tlast,
input [7:0] s_packet_axis_tkeep,
output s_packet_axis_tready,

input [31:0] s_addr_axis_tdata,
input s_addr_axis_tvalid,
input s_addr_axis_tlast,    // Not important now.    
output s_addr_axis_tready,

output [63:0] m_packet_axis_tdata,
output m_packet_axis_tvalid,
output m_packet_axis_tlast,
output [7:0] m_packet_axis_tkeep,
output [31:0]m_packet_axis_tdest,
input m_packet_axis_tready,

output [31:0] m_addr_axis_tdata,
output m_addr_axis_tvalid,
output m_addr_axis_tlast,
output [31:0]m_addr_axis_tdest,
input m_addr_axis_tready

    );
assign m_packet_axis_tdata = s_packet_axis_tdata;
assign m_packet_axis_tdest = s_addr_axis_tdata;
assign m_addr_axis_tdata = s_addr_axis_tdata;
assign m_packet_axis_tkeep = s_packet_axis_tkeep;
assign m_addr_axis_tdest = m_addr_axis_tdata;

assign m_packet_axis_tvalid = s_packet_axis_tvalid && s_addr_axis_tvalid;
assign m_packet_axis_tlast = s_packet_axis_tlast;
assign s_packet_axis_tready = s_addr_axis_tvalid && m_packet_axis_tready;
assign s_addr_axis_tready = m_packet_axis_tvalid && m_packet_axis_tlast && m_packet_axis_tready && m_addr_axis_tready;

assign m_addr_axis_tvalid = s_addr_axis_tvalid && s_addr_axis_tready;
assign m_addr_axis_tlast = s_addr_axis_tlast;
    
endmodule