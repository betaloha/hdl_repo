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
/*
set_property PACKAGE_PIN AM21     [get_ports "QSFP1_MODSELL_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L23N_T3U_N9_64
set_property IOSTANDARD  LVCMOS18 [get_ports "QSFP1_MODSELL_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L23N_T3U_N9_64
set_property PACKAGE_PIN AL21     [get_ports "QSFP1_MODPRSL_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L23P_T3U_N8_64
set_property IOSTANDARD  LVCMOS18 [get_ports "QSFP1_MODPRSL_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L23P_T3U_N8_64
set_property PACKAGE_PIN AM22     [get_ports "QSFP1_RECCLK_N"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L22N_T3U_N7_DBC_AD0N_64
set_property IOSTANDARD  LVDS [get_ports "QSFP1_RECCLK_N"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L22N_T3U_N7_DBC_AD0N_64
set_property PACKAGE_PIN AM23     [get_ports "QSFP1_RECCLK_P"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L22P_T3U_N6_DBC_AD0P_64
set_property IOSTANDARD  LVDS [get_ports "QSFP1_RECCLK_P"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L22P_T3U_N6_DBC_AD0P_64
set_property PACKAGE_PIN AP21     [get_ports "QSFP1_INTL_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L21N_T3L_N5_AD8N_64
set_property IOSTANDARD  LVCMOS18 [get_ports "QSFP1_INTL_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L21N_T3L_N5_AD8N_64
set_property PACKAGE_PIN AN21     [get_ports "QSFP1_LPMODE_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L21P_T3L_N4_AD8P_64
set_property IOSTANDARD  LVCMOS18 [get_ports "QSFP1_LPMODE_LS"] ;# Bank  64 VCCO - VCC1V8_FPGA - IO_L21P_T3L_N4_AD8P_64
*/
    );
assign QSFP_LPMODE_LS = 0;
assign QSFP_MODSELL_LS = 1;
assign QSFP_RESETL_LS = 1;
always@(posedge(clk))begin
GPIO_LED0 <= QSFP_MODPRSL_LS;
GPIO_LED1 <= QSFP_INTL_LS;
end
endmodule