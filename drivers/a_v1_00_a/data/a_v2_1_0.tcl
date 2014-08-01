##############################################################################
## Filename:          /home/vladimir/cf_ad9467_zed/drivers/a_v1_00_a/data/a_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Thu Jul 24 22:34:40 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "a" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
