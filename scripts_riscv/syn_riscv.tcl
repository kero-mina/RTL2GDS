set design top
set_app_var search_path "/home/standard_cell_libraries/NangateOpenCellLibrary_PDKv1_3_v2010_12/lib/Front_End/Liberty/NLDM"

set_app_var link_library "NangateOpenCellLibrary_ff1p25v0c.db NangateOpenCellLibrary_ss0p95v125c.db"

set_app_var target_library "NangateOpenCellLibrary_ff1p25v0c.db NangateOpenCellLibrary_ss0p95v125c.db"

sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work


analyze -library work -format verilog ./$design.v
elaborate $design -lib work
current_design 


source ./cons.tcl
link
check_design

compile -map_effort medium
report_area  -hierarchy > /home/ahesham/Desktop/ITI_PHASE1/RISCV_kero/report/synth_area.rpt
report_cell > /home/ahesham/Desktop/ITI_PHASE1/RISCV_kero/report/synth_cells.rpt
report_qor  > /home/ahesham/Desktop/ITI_PHASE1/RISCV_kero/report/synth_qor.rpt
report_resources > /home/ahesham/Desktop/ITI_PHASE1/RISCV_kero/report/synth_resources.rpt
report_timing -max_paths 10 > /home/ahesham/Desktop/ITI_PHASE1/RISCV_kero/report/synth_timing_setup.rpt
report_timing -delay_type min -max_paths 10 > /home/ahesham/Desktop/ITI_PHASE1/RISCV_kero/report/synth_timing_hold.rpt
 
write_sdc  output/${design}.sdc 

define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false

write -hierarchy -format verilog -output output/${design}.v
write_sdf -version 2.1 output/${design}.sdf
write -f ddc -hierarchy -output output/${design}.ddc   

exit
