set_global_assignment -entity "cic" -library "lib_cic" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "cic" -library "lib_cic" -name IP_TOOL_VERSION "15.1"
set_global_assignment -entity "cic" -library "lib_cic" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_cic" -name SPD_FILE [file join $::quartus(sip_path) "../cic.spd"]
set_global_assignment -library "lib_cic" -name MISC_FILE [file join $::quartus(sip_path) "../../cic.qsys"]

set_global_assignment -library "lib_cic" -name MISC_FILE [file join $::quartus(sip_path) "cic.v"]
set_global_assignment -library "lib_cic" -name MISC_FILE [file join $::quartus(sip_path) "submodules/cic_cic_ii_0.vo"]
