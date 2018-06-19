# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a100tftg256-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir F:/Documents/Countermeasures/CR/fpga/vivado_examples/aes128_verilog/aes128_verilog.cache/wt [current_project]
set_property parent.project_path F:/Documents/Countermeasures/CR/fpga/vivado_examples/aes128_verilog/aes128_verilog.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
set_property include_dirs F:/Documents/Countermeasures/CR/fpga/vivado_examples/aes128_verilog/aes128_verilog.srcs/sources_1/new [current_fileset]
read_verilog -library xil_defaultlib {
  F:/Documents/Countermeasures/CR/fpga/cryptosrc/aes_googlevault/aes_core.v
  F:/Documents/Countermeasures/CR/fpga/cryptosrc/aes_googlevault/aes_ks.v
  F:/Documents/Countermeasures/CR/fpga/cryptosrc/aes_googlevault/aes_sbox.v
  F:/Documents/Countermeasures/CR/fpga/common/new/clk_randomizer.v
  F:/Documents/Countermeasures/CR/fpga/common/registers/registers.v
  F:/Documents/Countermeasures/CR/fpga/common/usb_module.v
  F:/Documents/Countermeasures/CR/fpga/common/cw305_top.v
}
read_ip -quiet F:/Documents/Countermeasures/CR/fpga/common/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all f:/Documents/Countermeasures/CR/fpga/common/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all f:/Documents/Countermeasures/CR/fpga/common/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all f:/Documents/Countermeasures/CR/fpga/common/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/Documents/Countermeasures/CR/fpga/common/cw305_main.xdc
set_property used_in_implementation false [get_files F:/Documents/Countermeasures/CR/fpga/common/cw305_main.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top cw305_top -part xc7a100tftg256-2


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef cw305_top.dcp
create_report "synth_100t_synth_report_utilization_0" "report_utilization -file cw305_top_utilization_synth.rpt -pb cw305_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
