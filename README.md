# fpga-clken-gen

Most FPGA architectures have a minimum internal frequency that can be utilized on the clock routing trees. The use of counters to scale down high-speed clocks for clock trees that must operate below this minimum frequency is not recommended.  Instead, FPGA design best practices recommend that all clock trees fan-out from a high speed source and low-speed peripherals utilize a clock-enable signal to only register the incoming high-speed clock at appropriate times.

This repository contains simple reference clock-enable generation modules that can be incorporated into other projects.

DIRECTORY STRUCTURE
ROOT +
     |
	 + src +
	       |
	       +vhdl -- VHDL sources and testbenches
           +verilog -- Verilog sources and testbenches