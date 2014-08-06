module stas_fifo (
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
S1_AXI_RREADY,
ready_to_transmit,
address_to_init
);

   parameter C_S1_AXI_ADDR_WIDTH            = 7;
   parameter C_S1_AXI_DATA_WIDTH            = 32;

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

input wire ready_to_transmit;
output wire [0:31] address_to_init;

	// AXI4LITE signals
	reg [C_S1_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S1_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S1_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
	reg  	axi_rvalid;
	
	// Example-specific design signals
	// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	// ADDR_LSB is used for addressing 32/64 bit registers/memories
	// ADDR_LSB = 2 for 32 bits (n downto 2)
	// ADDR_LSB = 3 for 64 bits (n downto 3)
	localparam integer ADDR_LSB = (C_S1_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 4;
	//----------------------------------------------
	//-- Signals for user logic register space example
	//------------------------------------------------
	//-- Number of Slave Registers 32
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg5;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg6;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg7;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg8;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg9;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg10;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg11;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg12;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg13;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg14;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg15;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg16;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg17;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg18;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg19;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg20;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg21;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg22;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg23;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg24;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg25;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg26;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg27;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg28;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg29;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg30;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	slv_reg31;
	wire	 slv_reg_rden;
	wire	 slv_reg_wren;
	reg [C_S1_AXI_DATA_WIDTH-1:0]	reg_data_out;
	reg [4:0]                    fifocount;
	reg [C_S1_AXI_DATA_WIDTH-1:0] address;
	
	integer	 byte_index;

	// I/O Connections assignments

	assign S1_AXI_AWREADY	= axi_awready;
	assign S1_AXI_WREADY	= axi_wready;
	assign S1_AXI_BRESP	= axi_bresp;
	assign S1_AXI_BVALID	= axi_bvalid;
	assign S1_AXI_ARREADY	= axi_arready;
	assign S1_AXI_RDATA	= axi_rdata;
	assign S1_AXI_RRESP	= axi_rresp;
	assign S1_AXI_RVALID	= axi_rvalid;
	
	assign address_to_init = address;
	// Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	// de-asserted when reset is low.

	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S1_AXI_AWVALID && S1_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S1_AXI_AWVALID && S1_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S1_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S1_AXI_WVALID && S1_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
	// and the slave is ready to accept the write address and write data.
	assign slv_reg_wren = axi_wready && S1_AXI_WVALID && axi_awready && S1_AXI_AWVALID;
	
	
	
	always @(posedge slv_reg_wren or negedge S1_AXI_ARESETN or posedge ready_to_transmit )
  begin
    if (!S1_AXI_ARESETN)
      fifocount<=0;
    else if (slv_reg_wren)
    fifocount<=fifocount+1;
  else fifocount<=fifocount-1;
  end
	
	
	

	always @( posedge S1_AXI_ACLK or posedge ready_to_transmit)
	begin //1
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin //2
	      address  <= 0;
	      slv_reg0 <= 0;
	      slv_reg1 <= 0;
	      slv_reg2 <= 0;
	      slv_reg3 <= 0;
	      slv_reg4 <= 0;
	      slv_reg5 <= 0;
	      slv_reg6 <= 0;
	      slv_reg7 <= 0;
	      slv_reg8 <= 0;
	      slv_reg9 <= 0;
	      slv_reg10 <= 0;
	      slv_reg11 <= 0;
	      slv_reg12 <= 0;
	      slv_reg13 <= 0;
	      slv_reg14 <= 0;
	      slv_reg15 <= 0;
	      slv_reg16 <= 0;
	      slv_reg17 <= 0;
	      slv_reg18 <= 0;
	      slv_reg19 <= 0;
	      slv_reg20 <= 0;
	      slv_reg21 <= 0;
	      slv_reg22 <= 0;
	      slv_reg23 <= 0;
	      slv_reg24 <= 0;
	      slv_reg25 <= 0;
	      slv_reg26 <= 0;
	      slv_reg27 <= 0;
	      slv_reg28 <= 0;
	      slv_reg29 <= 0;
	      slv_reg30 <= 0;
	      slv_reg31 <= 0;
	    end //2
	  else
	    if (slv_reg_wren)
	      begin //3
	        case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] + fifocount-1)
	          5'h00:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 0
	                slv_reg0[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h01:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 1
	                slv_reg1[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h02:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 2
	                slv_reg2[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h03:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 3
	                slv_reg3[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h04:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 4
	                slv_reg4[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h05:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 5
	                slv_reg5[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h06:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 6
	                slv_reg6[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h07:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 7
	                slv_reg7[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h08:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 8
	                slv_reg8[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h09:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 9
	                slv_reg9[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0A:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 10
	                slv_reg10[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0B:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 11
	                slv_reg11[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0C:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 12
	                slv_reg12[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0D:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 13
	                slv_reg13[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0E:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 14
	                slv_reg14[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h0F:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 15
	                slv_reg15[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h10:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 16
	                slv_reg16[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h11:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 17
	                slv_reg17[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h12:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 18
	                slv_reg18[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h13:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 19
	                slv_reg19[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h14:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 20
	                slv_reg20[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h15:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 21
	                slv_reg21[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h16:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 22
	                slv_reg22[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h17:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 23
	                slv_reg23[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h18:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 24
	                slv_reg24[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h19:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 25
	                slv_reg25[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h1A:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 26
	                slv_reg26[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h1B:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 27
	                slv_reg27[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h1C:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 28
	                slv_reg28[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h1D:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 29
	                slv_reg29[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h1E:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 30
	                slv_reg30[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          5'h1F:
	            for ( byte_index = 0; byte_index <= (C_S1_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
	              if ( S1_AXI_WSTRB[byte_index] == 1 ) begin
	                // Respective byte enables are asserted as per write strobes 
	                // Slave register 31
	                slv_reg31[(byte_index*8) +: 8] <= S1_AXI_WDATA[(byte_index*8) +: 8];
	              end  
	          default : begin
	                      slv_reg0 <= slv_reg0;
	                      slv_reg1 <= slv_reg1;
	                      slv_reg2 <= slv_reg2;
	                      slv_reg3 <= slv_reg3;
	                      slv_reg4 <= slv_reg4;
	                      slv_reg5 <= slv_reg5;
	                      slv_reg6 <= slv_reg6;
	                      slv_reg7 <= slv_reg7;
	                      slv_reg8 <= slv_reg8;
	                      slv_reg9 <= slv_reg9;
	                      slv_reg10 <= slv_reg10;
	                      slv_reg11 <= slv_reg11;
	                      slv_reg12 <= slv_reg12;
	                      slv_reg13 <= slv_reg13;
	                      slv_reg14 <= slv_reg14;
	                      slv_reg15 <= slv_reg15;
	                      slv_reg16 <= slv_reg16;
	                      slv_reg17 <= slv_reg17;
	                      slv_reg18 <= slv_reg18;
	                      slv_reg19 <= slv_reg19;
	                      slv_reg20 <= slv_reg20;
	                      slv_reg21 <= slv_reg21;
	                      slv_reg22 <= slv_reg22;
	                      slv_reg23 <= slv_reg23;
	                      slv_reg24 <= slv_reg24;
	                      slv_reg25 <= slv_reg25;
	                      slv_reg26 <= slv_reg26;
	                      slv_reg27 <= slv_reg27;
	                      slv_reg28 <= slv_reg28;
	                      slv_reg29 <= slv_reg29;
	                      slv_reg30 <= slv_reg30;
	                      slv_reg31 <= slv_reg31;
	                    end
	        endcase
	      end //3
	      else if (ready_to_transmit)
	        begin
	          address   <= slv_reg0;
	          slv_reg0  <= slv_reg1;
	          slv_reg1  <= slv_reg2;
	          slv_reg2  <= slv_reg3;
	          slv_reg3  <= slv_reg4;
	          slv_reg4  <= slv_reg5;
	          slv_reg5  <= slv_reg6;
	          slv_reg6  <= slv_reg7;
	          slv_reg7  <= slv_reg8;
	          slv_reg8  <= slv_reg9;
	          slv_reg9  <= slv_reg10;
	          slv_reg10 <= slv_reg11;
	          slv_reg11 <= slv_reg12;
	          slv_reg12 <= slv_reg13;
	          slv_reg13 <= slv_reg14;
	          slv_reg14 <= slv_reg15;
	          slv_reg15 <= slv_reg16;
	          slv_reg16 <= slv_reg17;
	          slv_reg17 <= slv_reg18;
	          slv_reg18 <= slv_reg19;
	          slv_reg19 <= slv_reg20;
	          slv_reg20 <= slv_reg21;
	          slv_reg21 <= slv_reg22;
	          slv_reg22 <= slv_reg23;
	          slv_reg23 <= slv_reg24;
	          slv_reg24 <= slv_reg25;
	          slv_reg25 <= slv_reg26;
	          slv_reg26 <= slv_reg27;
	          slv_reg27 <= slv_reg28;
	          slv_reg28 <= slv_reg29;
	          slv_reg29 <= slv_reg30;
	          slv_reg30 <= slv_reg31;
	          slv_reg31 <= 0;
	        end
	  //end
	end //1    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S1_AXI_AWVALID && ~axi_bvalid && axi_wready && S1_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S1_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S1_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S1_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S1_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S1_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S1_AXI_ARVALID & ~axi_rvalid;
	always @(*)
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      reg_data_out <= 0;
	    end 
	  else
	    begin    
	      // Address decoding for reading registers
	      case ( axi_araddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
	        5'h00   : reg_data_out <= slv_reg0;
	        5'h01   : reg_data_out <= slv_reg1;
	        5'h02   : reg_data_out <= slv_reg2;
	        5'h03   : reg_data_out <= slv_reg3;
	        5'h04   : reg_data_out <= slv_reg4;
	        5'h05   : reg_data_out <= slv_reg5;
	        5'h06   : reg_data_out <= slv_reg6;
	        5'h07   : reg_data_out <= slv_reg7;
	        5'h08   : reg_data_out <= slv_reg8;
	        5'h09   : reg_data_out <= slv_reg9;
	        5'h0A   : reg_data_out <= slv_reg10;
	        5'h0B   : reg_data_out <= slv_reg11;
	        5'h0C   : reg_data_out <= slv_reg12;
	        5'h0D   : reg_data_out <= slv_reg13;
	        5'h0E   : reg_data_out <= slv_reg14;
	        5'h0F   : reg_data_out <= slv_reg15;
	        5'h10   : reg_data_out <= slv_reg16;
	        5'h11   : reg_data_out <= slv_reg17;
	        5'h12   : reg_data_out <= slv_reg18;
	        5'h13   : reg_data_out <= slv_reg19;
	        5'h14   : reg_data_out <= slv_reg20;
	        5'h15   : reg_data_out <= slv_reg21;
	        5'h16   : reg_data_out <= slv_reg22;
	        5'h17   : reg_data_out <= slv_reg23;
	        5'h18   : reg_data_out <= slv_reg24;
	        5'h19   : reg_data_out <= slv_reg25;
	        5'h1A   : reg_data_out <= slv_reg26;
	        5'h1B   : reg_data_out <= slv_reg27;
	        5'h1C   : reg_data_out <= slv_reg28;
	        5'h1D   : reg_data_out <= slv_reg29;
	        5'h1E   : reg_data_out <= slv_reg30;
	        5'h1F   : reg_data_out <= slv_reg31;
	        default : reg_data_out <= 0;
	      endcase
	    end   
	end

	// Output register or memory read data
	always @( posedge S1_AXI_ACLK )
	begin
	  if ( S1_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin    
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end    







//vova_init i_initas (
//    .in_addr_buff (address_to_init));
endmodule
