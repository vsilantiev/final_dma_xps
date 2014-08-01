##############################################################################
## Filename:          /home/vladimir/cf_ad9467_zed/drivers/init_dma1_v1_00_a/data/init_dma1_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Thu Jul 24 16:52:26 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "init_dma1" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
