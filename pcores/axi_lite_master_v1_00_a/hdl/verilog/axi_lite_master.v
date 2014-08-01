///////////////////////////////////////////////////////////////////////////////
//
// AXI4-Lite Master
//
////////////////////////////////////////////////////////////////////////////
//
// Structure:
//   axi_lite_master
//
// Last Update:
//   7/8/2010
////////////////////////////////////////////////////////////////////////////
/*
 AXI4-Lite Master Example
 
 The purpose of this design is to provide a simple AXI4-Lite example.

 The distinguishing characteristics of AXI4-Lite are the single-beat transfers,
 limited data width, and limited other transaction qualifiers. These make it
 best suited for low-throughput control functions. 
 
 The example user application will perform a set of writes from a lookup
 table. This may be useful for initial register configurations, such as
 setting the AXI_VDMA register settings. After completing all the writes,
 the example design will perform reads and attempt to verify the values.
 
 If the reads match the write values and no error responses were captured,
 the DONE_SUCCESS output will be asserted.
 
 To modify this example for other applications, edit/remove the logic
 associated with the 'Example' section comments. Generally, this example
 works by the user providing a 'push_write' or 'pop_read' command to initiate
 a command and data transfer.
 
 The latest version of this file can be found in Xilinx Answer 37425
 http://www.xilinx.com/support/answers/37425.htm
*/
`timescale 1ns/1ps

module axi_lite_master #
   (
    parameter integer C_M_AXI_ADDR_WIDTH = 32,
    parameter integer C_M_AXI_DATA_WIDTH = 32,
	 parameter integer C_M1_AXI_ADDR_WIDTH = 32,
    parameter integer C_M1_AXI_DATA_WIDTH = 32
    )
   (
    // System Signals
    input wire M_AXI_ACLK,
    input wire M_AXI_ARESETN,
	 input wire M1_AXI_ACLK,
    input wire M1_AXI_ARESETN,

    // Master Interface Write Address
    output wire [C_M_AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output wire [3-1:0] M_AXI_AWPROT,
    output wire M_AXI_AWVALID,
    input wire M_AXI_AWREADY,
	 output wire [C_M1_AXI_ADDR_WIDTH-1:0] M1_AXI_AWADDR,
    output wire [3-1:0] M1_AXI_AWPROT,
    output wire M1_AXI_AWVALID,
    input wire M1_AXI_AWREADY,

    // Master Interface Write Data
    output wire [C_M_AXI_DATA_WIDTH-1:0] M_AXI_WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
    output wire M_AXI_WVALID,
    input wire M_AXI_WREADY,
	 output wire [C_M1_AXI_DATA_WIDTH-1:0] M1_AXI_WDATA,
    output wire [C_M1_AXI_DATA_WIDTH/8-1:0] M1_AXI_WSTRB,
    output wire M1_AXI_WVALID,
    input wire M1_AXI_WREADY,

    // Master Interface Write Response
    input wire [2-1:0] M_AXI_BRESP,
    input wire M_AXI_BVALID,
    output wire M_AXI_BREADY,
	 input wire [2-1:0] M1_AXI_BRESP,
    input wire M1_AXI_BVALID,
    output wire M1_AXI_BREADY,

    // Master Interface Read Address
    output wire [C_M_AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR,
    output wire [3-1:0] M_AXI_ARPROT,
    output wire M_AXI_ARVALID,
    input wire M_AXI_ARREADY,
	 output wire [C_M1_AXI_ADDR_WIDTH-1:0] M1_AXI_ARADDR,
    output wire [3-1:0] M1_AXI_ARPROT,
    output wire M1_AXI_ARVALID,
    input wire M1_AXI_ARREADY,

    // Master Interface Read Data 
    input wire [C_M_AXI_DATA_WIDTH-1:0] M_AXI_RDATA,
    input wire [2-1:0] M_AXI_RRESP,
    input wire M_AXI_RVALID,
    output wire M_AXI_RREADY,
	 input wire [C_M1_AXI_DATA_WIDTH-1:0] M1_AXI_RDATA,
    input wire [2-1:0] M1_AXI_RRESP,
    input wire M1_AXI_RVALID,
    output wire M1_AXI_RREADY,

    //Example Output
    output wire DONE_SUCCESS,
	 //My logic for cylclic 4M
	 output wire READY_NEXT_ADDR_DDR
    );

   // AXI4 signals
   reg 		awvalid;
   reg 		wvalid;
   reg 		push_write;
   reg 		pop_read;
   reg          arvalid;
   reg          rready;
   reg          bready;
   reg [31:0] 	awaddr;
   reg [31:0] 	wdata;
   reg [31:0] 	araddr;
   wire 	write_resp_error;
   wire         read_resp_error;

   
   //Example-specific design signals
   reg          writes_done;
   reg          reads_done;
   reg          error_reg;
   reg [2:0] 	write_index;
   reg [2:0] 	read_index;
   reg [31:0] 	check_rdata;
   reg          done_success_int;
   wire         read_mismatch;
   wire 	last_write;
   wire 	last_read;
   
/////////////////
//I/O Connections
/////////////////
//////////////////// 
//Write Address (AW)
////////////////////
assign M_AXI_AWADDR = awaddr;
   
assign M_AXI_WDATA = wdata;
assign M_AXI_AWPROT = 3'h0;
assign M_AXI_AWVALID = awvalid;

///////////////
//Write Data(W)
///////////////
assign M_AXI_WVALID = wvalid;

//Set all byte strobes in this example
assign M_AXI_WSTRB = -1;

////////////////////
//Write Response (B)
////////////////////
assign M_AXI_BREADY = bready;

///////////////////   
//Read Address (AR)
///////////////////
assign M_AXI_ARADDR = araddr;
assign M_AXI_ARVALID = arvalid;
assign M_AXI_ARPROT = 3'b0;

////////////////////////////
//Read and Read Response (R)
////////////////////////////
assign M_AXI_RREADY = rready;

////////////////////
//Example design I/O
////////////////////
assign DONE_SUCCESS = done_success_int;
   
///////////////////////
//Write Address Channel
///////////////////////
/*
 The purpose of the write address channel is to request the address and 
 command information for the entire transaction.  It is a single beat
 of information.
 
 Note for this example the awvalid/wvalid are asserted at the same
 time, and then each is deasserted independent from each other.
 This is a lower-performance, but simplier control scheme.
 
 AXI VALID signals must be held active until accepted by the partner.
 
 A data transfer is accepted by the slave when a master has
 VALID data and the slave acknoledges it is also READY. While the master
 is allowed to generated multiple, back-to-back requests by not 
 deasserting VALID, this design will add an extra rest cycle for
 simplicity.
 
 Since only one outstanding transaction is issued by the user design,
 there will not be a collision between a new request and an accepted
 request on the same clock cycle. Otherwise, an additional clause is 
 necessary.
 */
always @(posedge M_AXI_ACLK)
  begin
     
     //Only VALID signals must be deasserted during reset per AXI spec
     //Consider inverting then registering active-low reset for higher fmax
     if (M_AXI_ARESETN == 0 )
       awvalid <= 1'b0;

     //Address accepted by interconnect/slave
     else if (M_AXI_AWREADY && awvalid)
       awvalid <= 1'b0;

     //Signal a new address/data command is available by user logic
     else if (push_write)
       awvalid <= 1'b1;
     else
       awvalid <= awvalid;
  end 

////////////////////
//Write Data Channel
////////////////////
/*
 The write data channel is for transfering the actual data.
 
 The data generation is specific to the example design, and
 so only the WVALID/WREADY handshake is shown here
*/
   always @(posedge M_AXI_ACLK)
  begin
      if (M_AXI_ARESETN == 0 )
	wvalid <= 1'b0;
     
     //Data accepted by interconnect/slave
      else if (M_AXI_WREADY && wvalid)
	wvalid <= 1'b0;

     //Signal a new address/data command is available by user logic
     else if (push_write)
       wvalid <= 1'b1;
     else
       wvalid <= awvalid;
  end 

////////////////////////////
//Write Response (B) Channel
////////////////////////////
/* 
 The write response channel provides feedback that the write has committed
 to memory. BREADY will occur after both the data and the write address
 has arrived and been accepted by the slave, and can guarantee that no
 other accesses launched afterwards will be able to be reordered before it.
 
 The BRESP bit [1] is used indicate any errors from the interconnect or
 slave for the entire write burst. This example will capture the error.
 
 While not necessary per spec, it is advisable to reset READY signals in
 case of differing reset latencies between master/slave.
 */

//Always accept write responses
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0)
 	  bready <= 1'b0;
      else
 	  bready <= 1'b1;
  end

//Flag write errors
assign write_resp_error = bready & M_AXI_BVALID & M_AXI_BRESP[1];
/*  
//////////////////////   
//Read Address Channel
//////////////////////
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0 )
       arvalid <= 1'b0;
     else if (M_AXI_ARREADY && arvalid)
       arvalid <= 1'b0;
     else if (pop_read)
       arvalid <= 1'b1;
     else
       arvalid <= arvalid;
  end 

//////////////////////////////////   
//Read Data (and Response) Channel
//////////////////////////////////
 
 The Read Data channel returns the results of the read request 
 
 In this example the data checker is always able to accept
 more data, so no need to throttle the RREADY signal. 
 
 While not necessary per spec, it is advisable to reset READY signals in
 case of differing reset latencies between master/slave.
 */ 
/*
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0)
 	  rready <= 1'b0;
      else
 	  rready <= 1'b1;
   end
*/
//Flag write errors
assign read_resp_error = rready & M_AXI_RVALID & M_AXI_RRESP[1];  
 
////////////
//User Logic
////////////
///////////////////////
//Address/Data Stimulus
///////////////////////
/*
 Address/data pairs for this example. The read and write values should
 match.
 
 Modify these as desired for different address patterns.
 */

//Number of address/data pairs specificed below
parameter C_NUM_COMMANDS = 4;

//Write Addresses 
always @(write_index)
  begin
     case (write_index)
       1: awaddr <= 32'h40400030;
       2: awaddr <= 32'h40400034;
       3: awaddr <= 32'h40400048;
		 4: awaddr <= 32'h40400058;
       default: awaddr <= 32'h00000000;
     endcase 
  end
/*
//Read Addresses   
always @(read_index)
  begin
     case (read_index)
       1: araddr <= 32'h00001001;
       2: araddr <= 32'h00001000;
       3: araddr <= 32'h10000000;
		 4: araddr <= 32'hFFFFFFFF;
       default: araddr <= 32'h00000000;
     endcase 
  end
*/
//Write data   
always @(write_index)
  begin
     case (write_index)
       1: wdata <= 32'h00001001;
       2: wdata <= 32'h00001000;
       3: wdata <= 32'h10000000;
		 4: wdata <= 32'hFFFFFFFF;
       default: wdata <= 32'h00000000;
     endcase
  end

//Expected read data
/*
always @(read_index)
  begin
     case (read_index)
       1: check_rdata <= 32'h00001001;
       2: check_rdata <= 32'h00001000;
       3: check_rdata <= 32'h10000000;
		 4: check_rdata <= 32'hFFFFFFFF;
       default: check_rdata <= 32'h00000000;
     endcase 
  end
*/
///////////////////////
//Main write controller
///////////////////////
/*  
 By only issuing one request at a time, the control logic is 
 simplified.
 
 Request a new write if:
  -A command was not just submitted
  -AW and W channels are both idle
  -A new request was not requested last cycle
 */
always @(posedge M_AXI_ACLK)
  begin
      if (M_AXI_ARESETN == 0 )
	begin
	   push_write <= 1'b0;
	   write_index <= 0;
	end

      //Request new write and increment write commmand counter
      else if (~awvalid && ~wvalid && ~last_write && ~push_write)
	begin
	   push_write <= 1'b1;
	   write_index <= write_index + 1;
	end
      else
	begin
	   push_write <= 1'b0; //Negate to generate a pulse
	   write_index <= write_index;
	end
  end 
   
//Terminal write count   
assign last_write = (write_index == C_NUM_COMMANDS);
/*
 Check for last write completion.
   
 This logic is to qualify the last write count with the final write
 response. This demonstrates how to confirm that a write has been
 committed. 
 */
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0)
       writes_done <= 1'b0;
     
     //The last write should be associated with a valid response
     else if (last_write && M_AXI_BVALID)
       writes_done <= 1'b1;
     else
       writes_done <= writes_done;
  end

//////////////
//Read example
//////////////

//Terminal Read Count

////assign last_read = (read_index == C_NUM_COMMANDS);

//////////////////////
//Main read controller
//////////////////////
/*
 Request a new read if:
  -A command was not just submitted
  -AR channel is idle
  -A new request was not requested last cycle
 */
/*
always @(posedge M_AXI_ACLK)
  begin
     
     //Need to wait for last write to be committed
     if (M_AXI_ARESETN == 0 || writes_done == 0)
       begin
	  pop_read <= 1'b0;
	  read_index <= 0;
       end

     //Request new read and increment read commmand counter
     else if (~arvalid && ~last_read && ~pop_read)
       begin
	  pop_read <= 1'b1;
	  read_index <= read_index + 1;	  
       end
     else
       begin
	  pop_read <= 1'b0;
	  read_index <= read_index;
       end
  end 
*/
/*
 Check for last read completion.
   
 This logic is to qualify the last read count with the final read
 response/data.
 */

/*
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0)
       reads_done <= 1'b0;
     
     //The last read should be associated with a read valid response
     else if (last_read && M_AXI_RVALID)
       reads_done <= 1'b1;
     else
       reads_done <= reads_done;
  end
*/

///////////////////////////////
//Example design error register
///////////////////////////////

//Data Comparison
/*assign read_mismatch = ((M_AXI_RVALID && rready) && (M_AXI_RDATA != check_rdata));*/

// Register and hold any data mismatches, or read/write interface errors 
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0)
       error_reg <= 1'b0;

     //Capture any error types
     else if (/*read_mismatch ||*/ write_resp_error /*|| read_resp_error*/)
       error_reg <= 1'b1;
     else
       error_reg <= error_reg;
  end
   
/////////////////////////////////////////
//DONE_SUCCESS output example calculation
/////////////////////////////////////////
always @(posedge M_AXI_ACLK)
  begin
     if (M_AXI_ARESETN == 0)
       done_success_int <= 1'b0;
     
     //Are both writes and read done without error?
     else if (writes_done /*&& reads_done*/ && ~error_reg)
       done_success_int <= 1'b1;
     else
       done_success_int <= done_success_int;
  end
   
endmodule
