`timescale 1ns / 1ps
// AXI-stream packet dropper.
// Korakit Seemakhupt
// korakit@virginia.edu
module axi_s_inline_dropper(
input clk,
input rst,
input dropn,

input [63:0] s_packet_axis_tdata,
input s_packet_axis_tvalid,
input s_packet_axis_tlast,
input [7:0] s_packet_axis_tkeep,
output s_packet_axis_tready,

output [63:0] m_packet_axis_tdata,
output m_packet_axis_tvalid,
output m_packet_axis_tlast,
output [7:0] m_packet_axis_tkeep,
input m_packet_axis_tready

    );
assign m_packet_axis_tdata = s_packet_axis_tdata;
assign m_packet_axis_tvalid = s_packet_axis_tvalid && dropn;
assign m_packet_axis_tlast = s_packet_axis_tlast;
assign m_packet_axis_tkeep = s_packet_axis_tkeep;
// Need to keep the m_axis sending
assign s_packet_axis_tready = m_packet_axis_tready;
    
endmodule