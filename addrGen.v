`timescale 1ns / 1ps
// Dummy AXI-stream address generator
// Korakit Seemakhupt
// korakit@virginia.edu


module addrGen(
    input clk,
    input rst,
    output reg [31:0] M0_AXIS_TDATA,
    output reg M0_AXIS_TLAST,
    input M0_AXIS_TREADY,
    output reg M0_AXIS_TVALID
    );
reg [31:0] acc;
always@(posedge(clk))begin
    M0_AXIS_TVALID = 1'b1;
    M0_AXIS_TLAST = 1'b1;
    if(rst)begin
        M0_AXIS_TDATA = 32'h0;
    end else if(M0_AXIS_TREADY)begin
        M0_AXIS_TDATA = M0_AXIS_TDATA + 32'h1;
    end
end
endmodule