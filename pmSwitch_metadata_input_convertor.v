`timescale 1ns / 1ps
// Dummy AXI-stream address generator
// Korakit Seemakhupt
// korakit@virginia.edu


module addrGen(
    input [31:0] hashedAddress,
    input [7:0] PMSwitchOPS,
    input [7:0] ackCount,
    output [47:0] meta_input
    );
assign meta_input = (ackCount, PMSwitchOPS, hashedAddress);
endmodule