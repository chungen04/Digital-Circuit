# TCL File Generated by Component Editor 15.0
# Fri Oct 28 21:46:52 CST 2022
# DO NOT MODIFY


# 
# top "top" v1.0
#  2022.10.28.21:46:52
# 
# 

# 
# request TCL package from ACDS 15.0
# 
package require -exact qsys 15.0


# 
# module top
# 
set_module_property DESCRIPTION ""
set_module_property NAME top
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME top
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL Top
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file AudDSP.sv SYSTEM_VERILOG PATH AudDSP.sv
add_fileset_file AudPlayer.sv SYSTEM_VERILOG PATH AudPlayer.sv
add_fileset_file AudRecorder.sv SYSTEM_VERILOG PATH AudRecorder.sv
add_fileset_file I2cInitializer.sv SYSTEM_VERILOG PATH I2cInitializer.sv
add_fileset_file Top.sv SYSTEM_VERILOG PATH Top.sv TOP_LEVEL_FILE


# 
# parameters
# 
add_parameter S_I2C INTEGER 0
set_parameter_property S_I2C DEFAULT_VALUE 0
set_parameter_property S_I2C DISPLAY_NAME S_I2C
set_parameter_property S_I2C TYPE INTEGER
set_parameter_property S_I2C UNITS None
set_parameter_property S_I2C ALLOWED_RANGES -2147483648:2147483647
set_parameter_property S_I2C HDL_PARAMETER true
add_parameter S_IDLE INTEGER 1
set_parameter_property S_IDLE DEFAULT_VALUE 1
set_parameter_property S_IDLE DISPLAY_NAME S_IDLE
set_parameter_property S_IDLE TYPE INTEGER
set_parameter_property S_IDLE UNITS None
set_parameter_property S_IDLE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property S_IDLE HDL_PARAMETER true
add_parameter S_RECD INTEGER 2
set_parameter_property S_RECD DEFAULT_VALUE 2
set_parameter_property S_RECD DISPLAY_NAME S_RECD
set_parameter_property S_RECD TYPE INTEGER
set_parameter_property S_RECD UNITS None
set_parameter_property S_RECD ALLOWED_RANGES -2147483648:2147483647
set_parameter_property S_RECD HDL_PARAMETER true
add_parameter S_RECD_PAUSE INTEGER 3
set_parameter_property S_RECD_PAUSE DEFAULT_VALUE 3
set_parameter_property S_RECD_PAUSE DISPLAY_NAME S_RECD_PAUSE
set_parameter_property S_RECD_PAUSE TYPE INTEGER
set_parameter_property S_RECD_PAUSE UNITS None
set_parameter_property S_RECD_PAUSE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property S_RECD_PAUSE HDL_PARAMETER true
add_parameter S_PLAY INTEGER 4
set_parameter_property S_PLAY DEFAULT_VALUE 4
set_parameter_property S_PLAY DISPLAY_NAME S_PLAY
set_parameter_property S_PLAY TYPE INTEGER
set_parameter_property S_PLAY UNITS None
set_parameter_property S_PLAY ALLOWED_RANGES -2147483648:2147483647
set_parameter_property S_PLAY HDL_PARAMETER true
add_parameter S_PLAY_PAUSE INTEGER 5
set_parameter_property S_PLAY_PAUSE DEFAULT_VALUE 5
set_parameter_property S_PLAY_PAUSE DISPLAY_NAME S_PLAY_PAUSE
set_parameter_property S_PLAY_PAUSE TYPE INTEGER
set_parameter_property S_PLAY_PAUSE UNITS None
set_parameter_property S_PLAY_PAUSE ALLOWED_RANGES -2147483648:2147483647
set_parameter_property S_PLAY_PAUSE HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock_sink_12M
# 
add_interface clock_sink_12M clock end
set_interface_property clock_sink_12M clockRate 0
set_interface_property clock_sink_12M ENABLED true
set_interface_property clock_sink_12M EXPORT_OF ""
set_interface_property clock_sink_12M PORT_NAME_MAP ""
set_interface_property clock_sink_12M CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink_12M SVD_ADDRESS_GROUP ""

add_interface_port clock_sink_12M i_clk clk Input 1


# 
# connection point clock_sink_100k
# 
add_interface clock_sink_100k clock end
set_interface_property clock_sink_100k clockRate 0
set_interface_property clock_sink_100k ENABLED true
set_interface_property clock_sink_100k EXPORT_OF ""
set_interface_property clock_sink_100k PORT_NAME_MAP ""
set_interface_property clock_sink_100k CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink_100k SVD_ADDRESS_GROUP ""

add_interface_port clock_sink_100k i_clk_100k clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink_12M
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""

add_interface_port reset_sink i_rst_n reset_n Input 1
