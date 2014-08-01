//-----------------------------------------------------------------------------
//-- (c) Copyright 2010 Xilinx, Inc. All rights reserved.
//--
//-- This file contains confidential and proprietary information
//-- of Xilinx, Inc. and is protected under U.S. and
//-- international copyright and other intellectual property
//-- laws.
//--
//-- DISCLAIMER
//-- This disclaimer is not a license and does not grant any
//-- rights to the materials distributed herewith. Except as
//-- otherwise provided in a valid license issued to you by
//-- Xilinx, and to the maximum extent permitted by applicable
//-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//-- (2) Xilinx shall not be liable (whether in contract or tort,
//-- including negligence, or under any other theory of
//-- liability) for any loss or damage of any kind or nature
//-- related to, arising under or in connection with these
//-- materials, including for any direct, or any indirect,
//-- special, incidental, or consequential loss or damage
//-- (including loss of data, profits, goodwill, or any type of
//-- loss or damage suffered as a result of any action brought
//-- by a third party) even if such damage or loss was
//-- reasonably foreseeable or Xilinx had been advised of the
//-- possibility of the same.
//--
//-- CRITICAL APPLICATIONS
//-- Xilinx products are not designed or intended to be fail-
//-- safe, or for use in any application requiring fail-safe
//-- performance, such as life-support or safety devices or
//-- systems, Class III medical devices, nuclear facilities,
//-- applications related to the deployment of airbags, or any
//-- other applications that could lead to death, personal
//-- injury, or severe property or environmental damage
//-- (individually and collectively, "Critical
//-- Applications"). Customer assumes the sole risk and
//-- liability of any use of Xilinx products in Critical
//-- Applications, subject only to applicable laws and
//-- regulations governing limitations on product liability.
//--
//-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//-- PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------
//
// AXI Lite Slave
//
// Verilog-standard:  Verilog 2001
//--------------------------------------------------------------------------
//
// Structure:
//   axi_lite_slave
//
//--------------------------------------------------------------------------

`timescale 1ns/1ps

module axi_lite_slave #
  (
   parameter integer C_S_AXI_ADDR_WIDTH            = 32,
   parameter integer C_S_AXI_DATA_WIDTH            = 32
   )
  (
   // System Signals
   input wire ACLK,
   input wire ARESETN,

   // Slave Interface Write Address Ports
   input  wire [C_S_AXI_ADDR_WIDTH-1:0]   S_AXI_AWADDR,
   input  wire [3-1:0]                  S_AXI_AWPROT,
   input  wire                          S_AXI_AWVALID,
   output wire                          S_AXI_AWREADY,

   // Slave Interface Write Data Ports
   input  wire [C_S_AXI_DATA_WIDTH-1:0]   S_AXI_WDATA,
   input  wire [C_S_AXI_DATA_WIDTH/8-1:0] S_AXI_WSTRB,
   input  wire                          S_AXI_WVALID,
   output wire                          S_AXI_WREADY,

   // Slave Interface Write Response Ports
   output wire [2-1:0]                 S_AXI_BRESP,
   output wire                         S_AXI_BVALID,
   input  wire                         S_AXI_BREADY,

   // Slave Interface Read Address Ports
   input  wire [C_S_AXI_ADDR_WIDTH-1:0]   S_AXI_ARADDR,
   input  wire [3-1:0]                  S_AXI_ARPROT,
   input  wire                          S_AXI_ARVALID,
   output wire                          S_AXI_ARREADY,

   // Slave Interface Read Data Ports
   output wire [C_S_AXI_DATA_WIDTH-1:0]  S_AXI_RDATA,
   output wire [2-1:0]                 S_AXI_RRESP,
   output wire                         S_AXI_RVALID,
   input  wire                         S_AXI_RREADY
   
  );


	// AXI4LITE signals
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;

 
endmodule
