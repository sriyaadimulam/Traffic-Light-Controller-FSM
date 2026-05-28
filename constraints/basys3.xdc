## CLOCK SIGNAL
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0 5} [get_ports clk]


## RESET BUTTON (BTNC)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]


## ROAD A LEDs
set_property PACKAGE_PIN U16 [get_ports A_G]
set_property IOSTANDARD LVCMOS33 [get_ports A_G]

set_property PACKAGE_PIN E19 [get_ports A_Y]
set_property IOSTANDARD LVCMOS33 [get_ports A_Y]

set_property PACKAGE_PIN U19 [get_ports A_R]
set_property IOSTANDARD LVCMOS33 [get_ports A_R]


## ROAD B LEDs
set_property PACKAGE_PIN V19 [get_ports B_G]
set_property IOSTANDARD LVCMOS33 [get_ports B_G]

set_property PACKAGE_PIN W18 [get_ports B_Y]
set_property IOSTANDARD LVCMOS33 [get_ports B_Y]

set_property PACKAGE_PIN U15 [get_ports B_R]
set_property IOSTANDARD LVCMOS33 [get_ports B_R]