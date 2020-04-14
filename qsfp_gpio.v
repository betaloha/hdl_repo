`timescale 1ns / 1ps
// GPIO controller for qsfp connector.
// Korakit Seemakhupt
// korakit@virginia.edu

module qsfp_gpio(
input clk,
output QSFP_MODSELL_LS,
input QSFP_MODPRSL_LS,
input QSFP_INTL_LS,
output QSFP_LPMODE_LS,
output QSFP_RESETL_LS,
output reg GPIO_LED0,
output reg GPIO_LED1
    );
assign QSFP_LPMODE_LS = 0;
assign QSFP_MODSELL_LS = 1;
assign QSFP_RESETL_LS = 1;
always@(posedge(clk))begin
GPIO_LED0 <= QSFP_MODPRSL_LS;
GPIO_LED1 <= QSFP_INTL_LS;
end
endmodule