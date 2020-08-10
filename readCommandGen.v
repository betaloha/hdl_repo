// By Yasas
// yasas@virginia.edu

module readCommandGen(
input [31:0]address_in_tdata,
input address_in_tvalid,
output address_in_tready,
output [71:0]command_out_tdata,
output command_out_tvalid,
input command_out_tready,
input address_in_aclk

    );

// Add interface for read size


assign command_out_tvalid = address_in_tvalid;
assign address_in_tready = command_out_tready;
wire [3:0] rsvd = 4'b0000;
wire [3:0] tag = 4'b0000;
//Address
wire drr = 1'b0;
wire eof = 1'b1;     // Indeterminate BTT mode 
wire [5:0] dsa = 6'b000000;
wire type = 1'b1;    // INC address transfer
wire [22:0] btt = address_in_tdata[10:0];  //MaxSize = 2048
wire [31:0] addr_trimmed = {address_in_tdata[31:11], 11'h0};
//change masking to match max packet size
assign command_out_tdata = {rsvd, tag, addr_trimmed, drr, eof, dsa, type, btt};
endmodule