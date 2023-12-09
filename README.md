// Note the information here can be false or true depending on my knowledge but will be updated as soon as possible if there is any false information
Here are some comments for pnr.tcl script and the commands in it.
Milky way library is a database library which contains database information about a certain technology file to be used more than once in digital implementation in IC compiler tool
tluplus is a file used for calculation of resistance and capacitance to be used later for parasitic extraction and output .spef file (standard parasitic extraction format)
set_propagated_clock command is used in IC compiler as clock signal is affected in physical implementation by skew and routing
set_ignored_layers -max_routing_layer -> this command to ignore RC and congestion estimation of certain layers (The main purpose of that is to use above layers of the layer specified for power planning).
create_fp_placement -timing -congestion -> this command to make initial virtual flat placement in stage of floorplanning
derive_pg_connection used for connecting power and ground to the specified power and ground nets
set_fp_rail_constraints -> defines power network synthesis constraints for example power ring and strap constraints
synthesize_fp_rail -> synthesizes power network based on specified constraints
preroute_standard_cells -> connects standard cell power and ground pins to the power and ground of rings and straps
//Rest of commands are commented on in the script itself
//Thanks
