module vova_init (

  Bus2IP_Clk,
  Bus2IP_Resetn,
  Bus2IP_Data,
  Bus2IP_BE,
  Bus2IP_RdCE,
  Bus2IP_WrCE,
  IP2Bus_Data,
  IP2Bus_RdAck,
  IP2Bus_WrAck,
  IP2Bus_Error,
  M_AXI_ACLK,
  M_AXI_ARESETN,
  M_AXI_AWADDR,
  M_AXI_AWPROT,
  M_AXI_AWVALID,
  M_AXI_AWREADY,
  M_AXI_WDATA,
  M_AXI_WSTRB,
  M_AXI_WVALID,
  M_AXI_WREADY,
  M_AXI_BRESP,
  M_AXI_BVALID,
  M_AXI_BREADY,
  M_AXI_ARADDR,
  M_AXI_ARPROT,
  M_AXI_ARVALID,
  M_AXI_ARREADY,
  M_AXI_RDATA,
  M_AXI_RRESP,
  M_AXI_RVALID,
  M_AXI_RREADY,
  IRQ_DMA,
  S1_AXI_ACLK,
S1_AXI_ARESETN,
S1_AXI_AWADDR,
S1_AXI_AWPROT,
S1_AXI_AWVALID,
S1_AXI_AWREADY,
S1_AXI_WDATA,
S1_AXI_WSTRB,
S1_AXI_WVALID,
S1_AXI_WREADY,
S1_AXI_BRESP,
S1_AXI_BVALID,
S1_AXI_BREADY,
S1_AXI_ARADDR,
S1_AXI_ARPROT,
S1_AXI_ARVALID,
S1_AXI_ARREADY,
S1_AXI_RDATA,
S1_AXI_RRESP,
S1_AXI_RVALID,
S1_AXI_RREADY);

  parameter integer C_M_AXI_ADDR_WIDTH = 32;
  parameter integer C_M_AXI_DATA_WIDTH = 32;
  parameter C_NUM_REG = 32;
  parameter C_SLV_DWIDTH = 32;

    // Master System Signals
    input wire M_AXI_ACLK;
    input wire M_AXI_ARESETN;
    // Master Interface Write Address
    output wire [C_M_AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR;
    output wire [3-1:0] M_AXI_AWPROT;
    output wire M_AXI_AWVALID;
    input wire M_AXI_AWREADY;
    output wire [C_M_AXI_DATA_WIDTH-1:0] M_AXI_WDATA;
    output wire [C_M_AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB;
    output wire M_AXI_WVALID;
    input wire M_AXI_WREADY;
    input wire [2-1:0] M_AXI_BRESP;
    input wire M_AXI_BVALID;
    output wire M_AXI_BREADY;
    output wire [C_M_AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR;
    output wire [3-1:0] M_AXI_ARPROT;
    output wire M_AXI_ARVALID;
    input wire M_AXI_ARREADY; 
    input wire [C_M_AXI_DATA_WIDTH-1:0] M_AXI_RDATA;
    input wire [2-1:0] M_AXI_RRESP;
    input wire M_AXI_RVALID;
    output wire M_AXI_RREADY;
	 
	 wire R_NEXT_ADDR;
	 
	 reg r_next_addr;
	 
	 
	 
	 reg [31:0] in_addr_buff;
	 
	 
	 
	 input wire IRQ_DMA;
	 
	parameter integer C_S1_AXI_ADDR_WIDTH            = 7;
   parameter integer C_S1_AXI_DATA_WIDTH            = 32;

   // System Signals
   input wire S1_AXI_ACLK;
   input wire S1_AXI_ARESETN;

   // Slave Interface Write Address Ports
   input  wire [C_S1_AXI_ADDR_WIDTH-1:0] S1_AXI_AWADDR;
   input  wire [3-1:0]                  S1_AXI_AWPROT;
   input  wire                          S1_AXI_AWVALID;
   output wire                          S1_AXI_AWREADY;

   // Slave Interface Write Data Ports
   input  wire [C_S1_AXI_DATA_WIDTH-1:0]   S1_AXI_WDATA;
   input  wire [C_S1_AXI_DATA_WIDTH/8-1:0] S1_AXI_WSTRB;
   input  wire                          S1_AXI_WVALID;
   output wire                          S1_AXI_WREADY;

   // Slave Interface Write Response Ports
   output wire [2-1:0]                 S1_AXI_BRESP;
   output wire                         S1_AXI_BVALID;
   input  wire                         S1_AXI_BREADY;

   // Slave Interface Read Address Ports
   input  wire [C_S1_AXI_ADDR_WIDTH-1:0]   S1_AXI_ARADDR;
   input  wire [3-1:0]                  S1_AXI_ARPROT;
   input  wire                          S1_AXI_ARVALID;
   output wire                          S1_AXI_ARREADY;

   // Slave Interface Read Data Ports
   output wire [C_S1_AXI_DATA_WIDTH-1:0]  S1_AXI_RDATA;
   output wire [2-1:0]                 S1_AXI_RRESP;
   output wire                         S1_AXI_RVALID;
   input  wire                         S1_AXI_RREADY;
	 
	 
	 // Slave Interface
    input           Bus2IP_Clk;
    input           Bus2IP_Resetn;
    input   [31:0]  Bus2IP_Data;
    input   [ 3:0]  Bus2IP_BE;
    input   [31:0]  Bus2IP_RdCE;
    input   [31:0]  Bus2IP_WrCE;
    output  [31:0]  IP2Bus_Data;
    output          IP2Bus_RdAck;
    output          IP2Bus_WrAck;
    output          IP2Bus_Error;
	 reg             up_sel;
    reg             up_rwn;
    reg     [ 4:0]  up_addr;
    reg     [31:0]  up_wdata;
    reg		 [31:0]	up_rdata;
    reg					up_ack;
    reg             IP2Bus_RdAck;
    reg             IP2Bus_WrAck;
    reg     [31:0]  IP2Bus_Data;
    reg             IP2Bus_Error;
	 
	 reg [31:0] ADDR;

    reg [31:0] count_irq_dma;
       reg [2:0] 	write_index;

    wire    [31:0]  up_rwce_s;
    wire            up_ack_s;

    assign up_rwce_s = (Bus2IP_RdCE == 0) ? Bus2IP_WrCE : Bus2IP_RdCE;
	assign R_NEXT_ADDR = r_next_addr;
	
  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin
    if (Bus2IP_Resetn == 0) begin
      up_sel <= 'd0;
      up_rwn <= 'd0;
      up_addr <= 'd0;
      up_wdata <= 'd0;
    end else begin
      up_sel <= (up_rwce_s == 0) ? 1'b0 : 1'b1;
      up_rwn <= (Bus2IP_RdCE == 0) ? 1'b0 : 1'b1;
      case (up_rwce_s)
        32'h80000000: up_addr <= 5'h00;
        32'h40000000: up_addr <= 5'h01;
        32'h20000000: up_addr <= 5'h02;
        32'h10000000: up_addr <= 5'h03;
        32'h08000000: up_addr <= 5'h04;
        32'h04000000: up_addr <= 5'h05;
        32'h02000000: up_addr <= 5'h06;
        32'h01000000: up_addr <= 5'h07;
        32'h00800000: up_addr <= 5'h08;
        32'h00400000: up_addr <= 5'h09;
        32'h00200000: up_addr <= 5'h0a;
        32'h00100000: up_addr <= 5'h0b;
        32'h00080000: up_addr <= 5'h0c;
        32'h00040000: up_addr <= 5'h0d;
        32'h00020000: up_addr <= 5'h0e;
        32'h00010000: up_addr <= 5'h0f;
        32'h00008000: up_addr <= 5'h10;
        32'h00004000: up_addr <= 5'h11;
        32'h00002000: up_addr <= 5'h12;
        32'h00001000: up_addr <= 5'h13;
        32'h00000800: up_addr <= 5'h14;
        32'h00000400: up_addr <= 5'h15;
        32'h00000200: up_addr <= 5'h16;
        32'h00000100: up_addr <= 5'h17;
        32'h00000080: up_addr <= 5'h18;
        32'h00000040: up_addr <= 5'h19;
        32'h00000020: up_addr <= 5'h1a;
        32'h00000010: up_addr <= 5'h1b;
        32'h00000008: up_addr <= 5'h1c;
        32'h00000004: up_addr <= 5'h1d;
        32'h00000002: up_addr <= 5'h1e;
        32'h00000001: up_addr <= 5'h1f;
        default: up_addr <= 5'h1f;
      endcase
      up_wdata <= Bus2IP_Data;
    end
  end
  reg             up_sel_d = 'd0;
  reg             up_sel_2d = 'd0;
  assign up_ack_s = up_sel_d & ~up_sel_2d;
  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin
    if (Bus2IP_Resetn == 0) begin
      IP2Bus_RdAck <= 'd0;
      IP2Bus_WrAck <= 'd0;
      IP2Bus_Data <= 'd0;
      IP2Bus_Error <= 'd0;
    end else begin
      IP2Bus_RdAck <= (Bus2IP_RdCE == 0) ? 1'b0 : up_ack_s;
      IP2Bus_WrAck <= (Bus2IP_WrCE == 0) ? 1'b0 : up_ack_s;
      IP2Bus_Data <= up_rdata;
      IP2Bus_Error <= 'd0;
    end
  end

//не надо прокидывать
/*
  init_dma i_init_dma (
    .up_rstn (Bus2IP_Resetn),
    .up_clk (Bus2IP_Clk),
    .up_sel (up_sel),
    .up_rwn (up_rwn),
    .up_addr (up_addr),
    .up_wdata (up_wdata),
    .up_rdata (up_rdata_s),
	 .up_ack (up_ack_s));
*/
		//PART SLAVE
  // Processor write interface (see regmap.txt file in the pcore root directory
  // for address map and details of register functions).
	reg [0:31] up_len_ref = 'd0;
	reg [0:31] up_addr_buff = 'd0;
	/////assign up_wr_s = up_sel & ~up_rwn;
  reg [0:4] index_reg = 'd0;
  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin
    if (Bus2IP_Resetn == 0) begin
      up_len_ref <= 'd0;
		up_addr_buff <= 'd0;
		index_reg <= 'd0;
    end else begin
      if ((up_addr == 5'h00) && (up_sel & ~up_rwn)) begin
        up_len_ref <= up_wdata;
      end
		if ((up_addr == 5'h01) && (up_sel & ~up_rwn)) begin
        index_reg <= index_reg + 1;
		  case (index_reg)
		  0: up_addr_buff1 <= up_wdata;
		  1: up_addr_buff2 <= up_wdata;
		  2: up_addr_buff3 <= up_wdata;
		  3: up_addr_buff4 <= up_wdata;
		  4: up_addr_buff5 <= up_wdata;
		  5: up_addr_buff6 <= up_wdata;
		  6: up_addr_buff7 <= up_wdata;
		  7: up_addr_buff8 <= up_wdata;
		  8: up_addr_buff9 <= up_wdata;
		  9: up_addr_buff10 <= up_wdata;
		  10: up_addr_buff11 <= up_wdata;
		  11: up_addr_buff12 <= up_wdata;
		  12: up_addr_buff13 <= up_wdata;
		  13: up_addr_buff14 <= up_wdata;
		  14: up_addr_buff15 <= up_wdata;
		  15: up_addr_buff16 <= up_wdata;
		  16: up_addr_buff17 <= up_wdata;
		  17: up_addr_buff18 <= up_wdata;
		  18: up_addr_buff19 <= up_wdata;
		  19: up_addr_buff20 <= up_wdata;
		  20: up_addr_buff21 <= up_wdata;
		  21: up_addr_buff22 <= up_wdata;
		  22: up_addr_buff23 <= up_wdata;
		  23: up_addr_buff24 <= up_wdata;
		  24: up_addr_buff25 <= up_wdata;
		  25: up_addr_buff26 <= up_wdata;
		  26: up_addr_buff27 <= up_wdata;
		  27: up_addr_buff28 <= up_wdata;
		  28: up_addr_buff29 <= up_wdata;
		  29: up_addr_buff30 <= up_wdata;
		  30: up_addr_buff31 <= up_wdata;
		  31: up_addr_buff32 <= up_wdata;
		endcase
		  
      end
		end
	end
	// Processor read interface




  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin
    if (Bus2IP_Resetn == 0) begin
      up_rdata <= 'd0;
		up_sel_d <= 'd0;
      up_sel_2d <= 'd0;
      up_ack <= 'd0;
    end else begin
      case (up_addr)
        5'h00: up_rdata <= up_len_ref;
		  5'h01: up_rdata <= in_addr_buff;
		  5'h02: up_rdata <= count_irq_dma;
		  5'h03: up_rdata <= write_index;
        default: up_rdata <= 0;
      endcase
		up_sel_d <= up_sel;
      up_sel_2d <= up_sel_d;
      up_ack <= up_ack_s;
    end
  end
	
	//END PART SLAVE 
	
	//START PART MASTER
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
   ///wire 	write_resp_error;
   ///wire         read_resp_error;

   
   //Example-specific design signals
   reg          writes_done;
   reg          reads_done;
   reg          error_reg;
   reg [2:0] 	read_index;
   reg [31:0] 	check_rdata;
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


//////////////////////   
//Create Pulse IRQ DMA
//////////////////////
reg  	irq_dma_ff = 'd0;
reg  	irq_dma_ff2 = 'd0;
wire  irq_dma_pulse;
assign irq_dma_pulse	= (!irq_dma_ff2) && irq_dma_ff;

	  always @(posedge M_AXI_ACLK)										      
      begin                                                                        
       // Initiates AXI transaction delay    
       if (M_AXI_ARESETN == 0)                                                   
         begin                                                                    
           irq_dma_ff <= 1'b0;                                                   
           irq_dma_ff2 <= 1'b0;                                                   
         end                                                                               
       else                                                                       
         begin
           irq_dma_ff <= IRQ_DMA;
           irq_dma_ff2 <= irq_dma_ff;                                                                 
         end                                                                      
      end
	  always @(posedge M_AXI_ACLK)										      
      begin                                                                            
       if (M_AXI_ARESETN == 0)                                                   
         begin                                                                    
				count_irq_dma <= 0;
				r_next_addr <= 0;	
         end                                                                               
       else if (irq_dma_pulse && ((in_addr_buff + (up_len_ref*4)*count_irq_dma) <= (in_addr_buff + 32'h400000)))                                                                       
		 //else if (irq_dma_pulse)
			begin
				count_irq_dma <= count_irq_dma + 1;
				r_next_addr <= 0;	
         end
       else if ((in_addr_buff + (up_len_ref*4)*count_irq_dma) >= (in_addr_buff + 32'h400000))
			begin
				count_irq_dma <= 0;
				r_next_addr <= 1;
			end
		 //else 
			//count_irq_dma <= 0;
      end  
reg [0:4] index_mem;
	  always @(posedge M_AXI_ACLK)										      
      begin                                                                        
       // Initiates AXI transaction delay    
       if (M_AXI_ARESETN == 0)                                                   
         begin                                                                    
           index_mem <= 0;                                                  
         end                                                                               
       else if (r_next_addr == 1)		 
         begin
				index_mem <= index_mem+1;
         end                                                                      
      end
	  always @(posedge M_AXI_ACLK)										      
      begin                                                                        
       // Initiates AXI transaction delay    
       if (M_AXI_ARESETN == 0)                                                   
         begin                                                                    
           in_addr_buff <= 0;                                                  
         end                                                                               
       else 		 
         begin
				case (index_mem)
		  0: in_addr_buff <= up_addr_buff1;
		  1: in_addr_buff <= up_addr_buff2 ;
		  2: in_addr_buff <= up_addr_buff3;
		  3: in_addr_buff <= up_addr_buff4  ;
		  4: in_addr_buff <= up_addr_buff5  ;
		  5: in_addr_buff <= up_addr_buff6  ;
		  6: in_addr_buff <= up_addr_buff7  ;
		  7: in_addr_buff <= up_addr_buff8  ;
		  8: in_addr_buff <= up_addr_buff9  ;
		  9: in_addr_buff <= up_addr_buff10  ;
		  10: in_addr_buff <= up_addr_buff11  ;
		  11: in_addr_buff <= up_addr_buff12  ;
		  12: in_addr_buff <= up_addr_buff13  ;
		  13: in_addr_buff <= up_addr_buff14  ;
		  14: in_addr_buff <= up_addr_buff15  ;
		  15: in_addr_buff <= up_addr_buff16  ;
		  16: in_addr_buff <= up_addr_buff17  ;
		  17: in_addr_buff <= up_addr_buff18  ;
		  18: in_addr_buff <= up_addr_buff19  ;
		  19: in_addr_buff <= up_addr_buff20  ;
		  20: in_addr_buff <= up_addr_buff21  ;
		  21: in_addr_buff <= up_addr_buff22  ;
		  22: in_addr_buff <= up_addr_buff23  ;
		  23: in_addr_buff <= up_addr_buff24  ;
		  24: in_addr_buff <= up_addr_buff25  ;
		  25: in_addr_buff <= up_addr_buff26  ;
		  26: in_addr_buff <= up_addr_buff27  ;
		  27: in_addr_buff <= up_addr_buff28  ;
		  28: in_addr_buff <= up_addr_buff29  ;
		  29: in_addr_buff <= up_addr_buff30  ;
		  30: in_addr_buff <= up_addr_buff31  ;
		  31: in_addr_buff <= up_addr_buff32  ;
			
				endcase
         end                                                                      
      end

///////////////////////
//Write Address Channel
///////////////////////

always @(posedge M_AXI_ACLK)
  begin
     
     //Only VALID signals must be deasserted during reset per AXI spec
     //Consider inverting then registering active-low reset for higher fmax
     if (M_AXI_ARESETN == 0 /*|| irq_dma_pulse */)
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
      if (M_AXI_ARESETN == 0  || irq_dma_pulse)
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
     if (M_AXI_ARESETN == 0 || irq_dma_pulse)
 	  bready <= 1'b0;
      else
 	  bready <= 1'b1;
  end

//Flag write errors
//////assign write_resp_error = bready & M_AXI_BVALID & M_AXI_BRESP[1];

//Flag write errors
//////assign read_resp_error = rready & M_AXI_RVALID & M_AXI_RRESP[1];  
 
////////////
//User Logic
////////////
//Address/Data Stimulus
///////////////////////
/*
 Address/data pairs for this example. The read and write values should
 match.
 
 Modify these as desired for different address patterns.
 */

//Number of address/data pairs specificed below
parameter C_NUM_COMMANDS = 6;

//Write Addresses 
always @(write_index)
  begin
     case (write_index)
		 1: awaddr <= 32'h7900000C;
       2: awaddr <= 32'h40400030;
       3: awaddr <= 32'h40400034;
       4: awaddr <= 32'h40400048;
		 5: awaddr <= 32'h40400058;
		 6: awaddr <= 32'h7900000C;
		 default: awaddr <= 32'h00000000;
     endcase 
  end

//Write data   
always @(write_index)
  begin
     case (write_index)
       1: wdata <= 0;
		 2: wdata <= 32'h00001001;
       3: wdata <= 32'h00001000;
       4: wdata <= in_addr_buff + ((up_len_ref*4)*count_irq_dma);
		 5: wdata <= 32'hFFFFFFFF;
		 6: wdata <= ((up_len_ref*4/8)-1) + 32'h000010000;
       default: wdata <= 32'h00000000;
     endcase
  end

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
      if (M_AXI_ARESETN == 0 || irq_dma_pulse)
	begin
	   push_write <= 1'b0;
	   write_index <= 0;
	end

      //Request new write and increment write commmand counter
      else 
	if ((up_len_ref != 0) && (in_addr_buff != 0))
		begin
			if (~up_len_ref[0])				
				begin
					if (~awvalid && ~wvalid && ~last_write && ~push_write)
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
     if (M_AXI_ARESETN == 0 || irq_dma_pulse)
       writes_done <= 1'b0;
     
     //The last write should be associated with a valid response
     else if (last_write && M_AXI_BVALID)
       writes_done <= 1'b1;
     else
       writes_done <= writes_done;
 end
//END_PART_MASTER	 
  stas_fifo #(.C_S_AXI_ADDR_WIDTH(C_S1_AXI_ADDR_WIDTH), .C_S_AXI_DATA_WIDTH(C_S1_AXI_DATA_WIDTH)) i_fifo (
 .S_AXI_ACLK(S1_AXI_ACLK),
.S_AXI_ARESETN(S1_AXI_ARESETN),
.S_AXI_AWADDR(S1_AXI_AWADDR),
.S_AXI_AWPROT(S1_AXI_AWPROT),
.S_AXI_AWVALID(S1_AXI_AWVALID),
.S_AXI_AWREADY(S1_AXI_AWREADY),
.S_AXI_WDATA(S1_AXI_WDATA),
.S_AXI_WSTRB(S1_AXI_WSTRB),
.S_AXI_WVALID(S1_AXI_WVALID),
.S_AXI_WREADY(S1_AXI_WREADY),
.S_AXI_BRESP(S1_AXI_BRESP),
.S_AXI_BVALID(S1_AXI_BVALID),
.S_AXI_BREADY(S1_AXI_BREADY),
.S_AXI_ARADDR(S1_AXI_ARADDR),
.S_AXI_ARPROT(S1_AXI_ARPROT),
.S_AXI_ARVALID(S1_AXI_ARVALID),
.S_AXI_ARREADY(S1_AXI_ARREADY),
.S_AXI_RDATA(S1_AXI_RDATA),
.S_AXI_RRESP(S1_AXI_RRESP),
.S_AXI_RVALID(S1_AXI_RVALID),
.S_AXI_RREADY(S1_AXI_RREADY)
//.ready_to_transmit (R_NEXT_ADDR),
//.address_to_init (in_addr_buff)
	 );

endmodule
