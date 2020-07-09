`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 06:13:22 PM
// Design Name: 
// Module Name: dma_command_converter_in
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


module dma_command_convertor(
input [31:0]address_in_tdata,
input address_in_tvalid,
output address_in_tready,
output [71:0]command_out_tdata,
output command_out_tvalid,
input command_out_tready,
input address_in_aclk

    );

assign command_out_tvalid = address_in_tvalid;
assign address_in_tready = command_out_tready;
wire [3:0] rsvd = 4'b0000;
wire [3:0] tag = 4'b0000;
//Address
wire drr = 1'b0;
wire eof = 1'b1;     // Indeterminate BTT mode 
wire [5:0] dsa = 6'b000000;
wire type = 1'b1;    // INC address transfer
wire [22:0] btt = 23'd1024;  //MaxSize = 1024  
assign command_out_tdata = {rsvd, tag, address_in_tdata, drr, eof, dsa, type, btt};
endmodule
