##############################################################################
## Filename:          /home/vladimir/cf_ad9467_zed/drivers/fuck_v1_00_a/data/fuck_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Fri Jul 25 10:09:13 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "fuck" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
