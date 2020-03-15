`timescale 1ns / 1ps
// Sync metadata input to the input data of the SDNet packet processor
// Korakit Seemakhupt
// korakit@virginia.edu

module metaSync(
    input clk,
    input rst,
    input valid,
    input last_in,
    input ready,
    output pulse_out
    );

reg state;
// State machine
// Rst/begin ---- valid&ready ----> SENDDATA -v
//     ^---------last&valid&ready-------------
//
//
assign pulse_out = state==1 && valid && ready;
always@(posedge(clk))begin
if(rst)begin
        state <= 1;
    end else begin
    if(valid&&ready&&last_in)begin
        state <= 1;
    end else if(valid&&ready) begin
        state <= 0;
    end
end 
end
endmodule

