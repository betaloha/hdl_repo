`timescale 1ns / 1ps
// Dummy AXI-stream address generator
// Korakit Seemakhupt
// korakit@virginia.edu


module pmSwitch_metadata_output(
    input [47:0] meta_output,
    output [31:0] hashedAddress,
    output [7:0] PMSwitchOPS,
    output [7:0] ackCount
    
    );
assign hashedAddress = meta_output[31:0];
assign PMSwitchOPS = meta_output[39:32];
assign ackCount = meta_output[47:40];
endmodule