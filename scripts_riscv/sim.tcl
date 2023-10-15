 vcs -Mupdate -RPP -v adder.v ALU.v ALU_Decoder.v Main_Decoder.v controller.v data_mem.v instruction_mem.v MUX2X1.v MUX3X1.v program_counter_reg.v register_file.v sign_extend.v datapath.v TOP_PROCESSOR.v TOP_PROCESSOR_tb.v -o demo -full32 -debug_all
./demo -gui 
