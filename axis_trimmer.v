`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2020 08:36:04 AM
// Design Name: 
// Module Name: axis_trimmer
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


module axis_trimmer(
input clk,
input rst,
input [63:0] S0_AXIS_TDATA,
input S0_AXIS_TLAST,
input [7:0] S0_AXIS_TKEEP,
output S0_AXIS_TREADY,
input S0_AXIS_TVALID,

output [63:0] M0_AXIS_TDATA,
output M0_AXIS_TLAST,
output [7:0] M0_AXIS_TKEEP,
input M0_AXIS_TREADY,
output M0_AXIS_TVALID 
    );
reg [9:0] dataCtr;
assign M0_AXIS_TDATA = S0_AXIS_TDATA;
assign S0_AXIS_TREADY = M0_AXIS_TREADY;
assign M0_AXIS_TKEEP = S0_AXIS_TKEEP;
assign M0_AXIS_TVALID = S0_AXIS_TVALID && !(dataCtr > 10'd6);
assign M0_AXIS_TLAST = S0_AXIS_TLAST || !(dataCtr < 10'd6);


always@(posedge clk)begin
    if(rst)begin
        dataCtr <= 0;
    end else begin
        if(S0_AXIS_TVALID && M0_AXIS_TREADY)begin
            if(S0_AXIS_TLAST)begin
                dataCtr <= 0;
            end else begin
                dataCtr <= dataCtr + 1;
            end
        end
    end
end
endmodule
