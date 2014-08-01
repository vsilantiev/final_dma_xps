TABLE OF CONTENTS
  1) Peripheral Summary
  2) Description of Generated Files
  3) Location to documentation of dependent libraries
================================================================================
*                             1) Peripheral Summary                            *
================================================================================
Peripheral Summary:

  XPS project / EDK repository               : /home/vladimir/cf_ad9467_zed
  logical library name                       : init_dma_v1_00_b
  top name                                   : init_dma
  version                                    : 1.00.b
  type                                       : AXI4LITE slave
  features                                   : slave attachment
                                               user s/w registers

Address Block for User Logic and IPIF Predefined Services

  user logic slave space                     : C_BASEADDR + 0x00000000
                                             : C_BASEADDR + 0x000000FF


================================================================================
*                          2) Description of Generated Files                   *
================================================================================
- HDL source file(s)

  hdl/vhdl/init_dma.vhd

    This is the template file for your peripheral's top design entity. It
    configures and instantiates the corresponding design units in the way you
    indicated in the wizard GUI and hooks it up to the stub user logic where
    the actual functionalites should get implemented. You are not expected to
    modify this template file except certain marked places for adding user
    specific generics and ports.

  verilog/user_logic.v

    This is the template file for the stub user logic design entity, either in
    VHDL or Verilog, where the actual functionalities should get implemented.
    Some sample code snippet may be provided for demonstration purpose.

- XPS interface file(s)

  data/init_dma_v2_1_0.mpd

    This Microprocessor Peripheral Description file contains information of the
    interface of your peripheral, so that other EDK tools can recognize your
    peripheral.

  data/init_dma_v2_1_0.pao

    This Peripheral Analysis Order file defines the analysis order of all the HDL
    source files that are used to compile your peripheral.

- ISE project file(s)

  devl/projnav/init_dma.xise

    This is the ProjNavigator project file. It sets up the needed logical
    libraries and dependent library files for you to help you develop your
    peripheral using ProjNavigator.

  devl/projnav/init_dma.tcl

    This is the TCL command line file used to generate the .xise file.

- XST synthesis file(s)

  devl/synthesis/init_dma_xst.scr

    This is the XST synthesis script file to compile your peripheral.
    Note: you may want to modify the device part option for your target.

  devl/synthesis/init_dma_xst.prj

    This is the XST synthesis project file used by the above script file to
    compile your peripheral.

- Driver source file(s)

  src/init_dma.h

    This is the software driver header template file, which contains address offset of
    software addressable registers in your peripheral, as well as some common masks and
    simple register access macros or function declaration.

  src/init_dma.c

    This is the software driver source template file, to define all applicable driver
    functions.

  src/init_dma_selftest.c

    This is the software driver self test example file, which contain self test example
    code to test various hardware features of your peripheral.

  src/Makefile

    This is the software driver makefile to compile drivers.

- Driver interface file(s)
-user needs to add these to repositories path in SDK (Xilinx Tools-->Repositories)

  data/init_dma_v2_1_0.mdd

    This is the Microprocessor Driver Definition file.

  data/init_dma_v2_1_0.tcl

    This is the Microprocessor Driver Command file.

- Other misc file(s)

  devl/ipwiz.opt

    This is the option setting file for the wizard batch mode, which should
    generate the same result as the wizard GUI mode.

  devl/README.txt

    This README file for your peripheral.

  devl/ipwiz.log

    This is the log file by operating on this wizard.


================================================================================
*          3) Location to documentation of dependent libraries                 *
*                                                                              *
*   In general, the documentation is located under:                            *
*   $XILINX_EDK/hw/XilinxProcessorIPLib/pcores/$libName/doc                    *
*                                                                              *
================================================================================
proc_common_v3_00_a
	No documentation for this library

axi_lite_ipif_v1_01_a
	/opt/Xilinx/14.7/ISE_DS/EDK/hw/XilinxProcessorIPLib/pcores/axi_lite_ipif_v1_01_a/doc/axi_lite_ipif_ds765.pdf

