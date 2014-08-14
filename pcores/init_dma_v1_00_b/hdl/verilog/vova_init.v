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
  IRQ_4M
);
  // Parameter Master and Slave
  parameter integer C_M_AXI_ADDR_WIDTH = 32;
  parameter integer C_M_AXI_DATA_WIDTH = 32;
  parameter C_NUM_REG = 32;
  parameter C_SLV_DWIDTH = 32;

  // Master System Signals
  input wire M_AXI_ACLK;
  input wire M_AXI_ARESETN;
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
  wire    [31:0]  up_rwce_s;
  wire            up_ack_s;

  assign up_rwce_s = (Bus2IP_RdCE == 0) ? Bus2IP_WrCE : Bus2IP_RdCE;

 
  // My control signal
  reg r_next_addr; //
  reg [31:0] in_addr_buff;
  input wire IRQ_DMA;
  output wire IRQ_4M;
  reg [31:0] count_irq_dma;
  reg [2:0] write_index;


/////////////////////////////////////////////////////////////////
/////////////////////////PART IPIF///////////////////////////////
/////////////////////////////////////////////////////////////////	

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

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////END PART IPIF///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////PART SLAVE////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
  // Processor write interface (see regmap.txt file in the pcore root directory
  // for address map and details of register functions).
	reg [31:0] up_len_ref = 'd0;
	reg [31:0] up_per = 'd0;
	reg [31:0] up_addr_buff1 = 'd0;
	reg [31:0] up_addr_buff2 = 'd0;
	reg [31:0] up_addr_buff3 = 'd0;
	reg [31:0] up_addr_buff4 = 'd0;
	reg [31:0] up_addr_buff5 = 'd0;
	reg [31:0] up_addr_buff6 = 'd0;
	reg [31:0] up_addr_buff7 = 'd0;
	reg [31:0] up_addr_buff8 = 'd0;
	reg [31:0] up_addr_buff9 = 'd0;
	reg [31:0] up_addr_buff10 = 'd0;
	reg [31:0] up_addr_buff11 = 'd0;
	reg [31:0] up_addr_buff12 = 'd0;
	reg [31:0] up_addr_buff13 = 'd0;
	reg [31:0] up_addr_buff14 = 'd0;
	reg [31:0] up_addr_buff15 = 'd0;
	reg [31:0] up_addr_buff16 = 'd0;
	reg [31:0] up_addr_buff17 = 'd0;
	reg [31:0] up_addr_buff18 = 'd0;
	reg [31:0] up_addr_buff19 = 'd0;
	reg [31:0] up_addr_buff20 = 'd0;
	reg [31:0] up_addr_buff21 = 'd0;
	reg [31:0] up_addr_buff22 = 'd0;
	reg [31:0] up_addr_buff23 = 'd0;
	reg [31:0] up_addr_buff24 = 'd0;
	reg [31:0] up_addr_buff25 = 'd0;
	reg [31:0] up_addr_buff26 = 'd0;
	reg [31:0] up_addr_buff27 = 'd0;
	reg [31:0] up_addr_buff28 = 'd0;
	reg [31:0] up_addr_buff29 = 'd0;
	reg [31:0] up_addr_buff30 = 'd0;
	reg [31:0] up_addr_buff31 = 'd0;
	reg [31:0] up_addr_buff32 = 'd0;
	/////assign up_wr_s = up_sel & ~up_rwn;
  reg [6:0] index_reg = 'd0;
  	  
	  
  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin                                                                           
    if (Bus2IP_Resetn == 0)                                                                   
	   index_reg <= 0;                                                  
    else if (/*(IP2Bus_WrAck) && (up_addr == 5'h01)*/(up_addr == 5'h01) && (up_sel & ~up_rwn))                                                                    
		index_reg <= index_reg + 1;
	 else if (rs_next_addr && index_reg != 0)
		//index_reg <= index_reg - 1;
		index_reg <= index_reg - 4;
  end

  reg [31:0] count_enter;
  reg [31:0] pre_addr_buff;
  
  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin
    if (Bus2IP_Resetn == 0) begin
      up_len_ref <= 'd0;
		up_per <= 'd0;
		in_addr_buff <= 'd0;
		up_addr_buff1 <= 'd0;
		up_addr_buff2 <= 'd0;
		up_addr_buff3 <= 'd0;
		up_addr_buff4 <= 'd0;
		up_addr_buff5 <= 'd0;
		up_addr_buff6 <= 'd0;
		up_addr_buff7 <= 'd0;
		up_addr_buff8 <= 'd0;
		up_addr_buff9 <= 'd0;
		up_addr_buff10 <= 'd0;
		up_addr_buff11 <= 'd0;
		up_addr_buff12 <= 'd0;
		up_addr_buff13 <= 'd0;
		up_addr_buff14 <= 'd0;
		up_addr_buff15 <= 'd0;
		up_addr_buff16 <= 'd0;
		up_addr_buff17 <= 'd0;
		up_addr_buff18 <= 'd0;
		up_addr_buff19 <= 'd0;
		up_addr_buff20 <= 'd0;
		up_addr_buff21 <= 'd0;
		up_addr_buff22 <= 'd0;
		up_addr_buff23 <= 'd0;
		up_addr_buff24 <= 'd0;
		up_addr_buff25 <= 'd0;
		up_addr_buff26 <= 'd0;
		up_addr_buff27 <= 'd0;
		up_addr_buff28 <= 'd0;
		up_addr_buff29 <= 'd0;
		up_addr_buff30 <= 'd0;
		up_addr_buff31 <= 'd0;
		up_addr_buff32 <= 'd0;
		count_enter <= 'd0;
    end else begin
      if ((up_addr == 5'h00) && (up_sel & ~up_rwn)) begin
        up_len_ref <= up_wdata;
      end
      if ((up_addr == 5'h01) && (up_sel & ~up_rwn)) begin
		case (index_reg >> 2)
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
		if ((up_addr == 5'h02) && (up_sel & ~up_rwn)) begin
		  up_per <= up_wdata;
	   end
//Надо сделать один сдвиг
	   if (rs_next_addr) begin
	     count_enter <= count_enter + 1;
		  in_addr_buff <= up_addr_buff1;
		  up_addr_buff1 <= up_addr_buff2;
		  up_addr_buff2 <= up_addr_buff3;
		  up_addr_buff3 <= up_addr_buff4;
		  up_addr_buff4 <= up_addr_buff5;
		  up_addr_buff5 <= up_addr_buff6;
		  up_addr_buff6 <= up_addr_buff7;
		  up_addr_buff7 <= up_addr_buff8;
		  up_addr_buff8 <= up_addr_buff9;
		  up_addr_buff9 <= up_addr_buff10;
		  up_addr_buff10 <= up_addr_buff11;
		  up_addr_buff11 <= up_addr_buff12;
		  up_addr_buff12 <= up_addr_buff13;
		  up_addr_buff13 <= up_addr_buff14;
		  up_addr_buff14 <= up_addr_buff15;
		  up_addr_buff15 <= up_addr_buff16;
		  up_addr_buff16 <= up_addr_buff17;
		  up_addr_buff17 <= up_addr_buff18;
		  up_addr_buff18 <= up_addr_buff19;
		  up_addr_buff19 <= up_addr_buff20;
		  up_addr_buff20 <= up_addr_buff21;
		  up_addr_buff21 <= up_addr_buff22;
		  up_addr_buff22 <= up_addr_buff23;
		  up_addr_buff23 <= up_addr_buff24;
		  up_addr_buff24 <= up_addr_buff25;
		  up_addr_buff25 <= up_addr_buff26;
		  up_addr_buff26 <= up_addr_buff27;
		  up_addr_buff27 <= up_addr_buff28;
		  up_addr_buff28 <= up_addr_buff29;
		  up_addr_buff29 <= up_addr_buff30;
		  up_addr_buff30 <= up_addr_buff31;
		  up_addr_buff31 <= up_addr_buff32;		
		  up_addr_buff32 <= 0;
      end
    end
  end

  always @(negedge Bus2IP_Resetn or posedge Bus2IP_Clk) begin
    if (Bus2IP_Resetn == 0) begin
      up_rdata <= 'd0;
		up_sel_d <= 'd0;
      up_sel_2d <= 'd0;
      up_ack <= 'd0;
    end else begin
      case (up_addr)
        5'h00: up_rdata <= up_len_ref; //0
		  5'h01: up_rdata <= in_addr_buff; //4
		  5'h02: up_rdata <= up_per; //8
		  5'h03: up_rdata <= write_index; //c
		  5'h04: up_rdata <= index_reg; //10
		  5'h05: up_rdata <= pre_addr_buff; //14
		  5'h06: up_rdata <= up_addr_buff1; //18
		  5'h07: up_rdata <= up_addr_buff2; //1c
		  5'h08: up_rdata <= up_addr_buff3; //20
		  5'h09: up_rdata <= up_addr_buff4; //24
		  5'h0A: up_rdata <= up_addr_buff32; //28
		  5'h0B: up_rdata <= count_enter; //2c
		  5'h0C: up_rdata <= count_4m; // 30
		  5'h0D: up_rdata <= r_next_addr; //34
		  5'h0E: up_rdata <= irq_4m; //38
		  5'h0F: up_rdata <= debug_count_irq; //3c
		  5'h10: up_rdata <= count_f; //40
		  5'h11: up_rdata <= count_irq_dma; //44
		  5'h12: up_rdata <= count_f1; //48
		  5'h13: up_rdata <= count_f2; //4c
		  5'h14: up_rdata <= count_f3; //50
        default: up_rdata <= 0;
      endcase
		up_sel_d <= up_sel;
      up_sel_2d <= up_sel_d;
      up_ack <= up_ack_s;
    end
  end
  
///////////////////////////////////////////////////////////////////////////////////	
/////////////////////////////// END PART SLAVE ////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////	

///////////////////////////////////////////////////////////////////////////////////	
/////////////////////////////// PART MASTER ///////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
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
//Example-specific design signals
  reg          writes_done;
  reg          reads_done;
  reg          error_reg;
  reg [2:0] 	read_index;
  reg [31:0] 	check_rdata;
  wire         read_mismatch;
  wire 	      last_write;
  wire 	      last_read;  
/////////////////
//I/O Connections
/////////////////
  assign M_AXI_AWADDR = awaddr;   
  assign M_AXI_WDATA = wdata;
  assign M_AXI_AWPROT = 3'h0;
  assign M_AXI_AWVALID = awvalid;
  assign M_AXI_WVALID = wvalid;
  assign M_AXI_WSTRB = -1;
  assign M_AXI_BREADY = bready;
  assign M_AXI_ARADDR = araddr;
  assign M_AXI_ARVALID = arvalid;
  assign M_AXI_ARPROT = 3'b0;
  assign M_AXI_RREADY = rready;

//////////////////////   
//Create Pulse IRQ DMA
//////////////////////
  reg  	irq_dma_ff = 'd0;
  reg  	irq_dma_ff2 = 'd0;
  reg  	s_ff = 'd0;
  reg  	s_ff2 = 'd0;
  wire  irq_dma_pulse;
  assign irq_dma_pulse	= (!irq_dma_ff2) && irq_dma_ff;
  assign rs_next_addr	= (!s_ff2) && s_ff;
  assign IRQ_4M = irq_4m;

// Получение очередного прерывания от AXI DMA  
  always @(posedge M_AXI_ACLK) begin                                                                           
    if (M_AXI_ARESETN == 0) begin                                                                    
      irq_dma_ff <= 1'b0;                                                   
      irq_dma_ff2 <= 1'b0;                                                   
    end else begin
      irq_dma_ff <= IRQ_DMA;
      irq_dma_ff2 <= irq_dma_ff;                                                                 
    end                                                                      
  end
           
// Сигнал 1 такт нужен новый вектор			  
  always @(posedge M_AXI_ACLK) begin                                                                            
    if (M_AXI_ARESETN == 0) begin                                                                    
      s_ff <= 1'b0;                                                   
      s_ff2 <= 1'b0;                                                   
    end else begin
      s_ff <= r_next_addr;
      s_ff2 <= s_ff;                                                                 
    end                                                                      
  end
	
	
reg [31:0] pe;
wire go;
  always @(posedge M_AXI_ACLK) begin                                                                        
    if (M_AXI_ARESETN == 0) begin                                                                    
      pe <= 1'b1;                                                                                                      
    end else if ( up_per == 0 || up_per < up_len_ref ) begin // Похоже если период 0
	   pe <= 1'b1;
	 end else begin
      pe <= pe + 1;                                                                 
    end 
    if (pe == (up_per+1)) begin
		pe <= 0;
    end
  end
  // если pe=up_per+1 (1) если pe!=up_per+1 (0)
  assign go = (pe == (up_per+1))? 1'b1 : 1'b0;
	
  reg [31:0] count_4m;
  
  reg [31:0] count_f;
  reg [31:0] count_f1;
  reg [31:0] count_f2;
  reg [31:0] count_f3;

  always @(posedge M_AXI_ACLK) begin                                                                            
    if (M_AXI_ARESETN == 0) begin                                                                    
	   count_irq_dma <= 0;
		count_4m <= 0;//Debug
		r_next_addr <= 0;
		count_f <= 0;
		count_f1 <= 0;
		count_f2 <= 0;
		count_f3 <= 0;		
    end else if (irq_dma_pulse && ((in_addr_buff + (up_len_ref*4)*count_irq_dma) <= (in_addr_buff + 32'h400000))) begin
		count_irq_dma <= count_irq_dma + 1;
	     if (r_next_addr == 1) 	
		    count_f2 <= count_f2 + 1; //не разу 
		r_next_addr <= 0;	
    end else if ((in_addr_buff + (up_len_ref*4)*count_irq_dma) >= (in_addr_buff + 32'h400000)) begin//Конец 4M нужен новый вектор
		count_4m <= count_4m+1;//Debug
		count_irq_dma <= 0;
		if (r_next_addr == 0)
			count_f3 <= count_f3 + 1; // 2 раза 1./
		r_next_addr <= 1;
	 end else if ((in_addr_buff == 0) && ((IP2Bus_WrAck) && (up_addr == 5'h01))) /*(index_reg[0] == 0 && index_reg[1] == 0)*/ begin
		r_next_addr <= 1;
		  if (r_next_addr == 0)
		    count_f <= count_f + 1; // 1 раз 3
	 end else begin  
		if (r_next_addr == 1)
		   count_f1 <= count_f1 + 1; // 3 раза  3
		r_next_addr <= 0;
	 end
  end  



  reg irq_4m; // Сигнал прерывание
  reg [31:0] debug_count_irq;
  reg [5:0] len_irq;
  
  always @(posedge M_AXI_ACLK) begin                                                                           
    if (M_AXI_ARESETN == 0) begin                                                                    
		pre_addr_buff <= 0;
		debug_count_irq <= 0;
		irq_4m <= 0;
		len_irq <= 0;
    end else begin
		if ((rs_next_addr == 1) && (in_addr_buff != 0)) begin                                                                     
		  pre_addr_buff <= in_addr_buff;
        irq_4m <= 32'hFFFFFFFF; //Надо выдать прерывание для Анатолия здесь
		end
		if (irq_4m != 0 && len_irq != 0) begin
		  debug_count_irq <= debug_count_irq + 1;
		  len_irq <= len_irq + 1;
		  irq_4m <= 1;
		end else
		  irq_4m <= 0;
    end
  end

  always @(posedge M_AXI_ACLK) begin
    if (M_AXI_ARESETN == 0)
      awvalid <= 1'b0;
    else if (M_AXI_AWREADY && awvalid)
      awvalid <= 1'b0;
    else if (push_write)
      awvalid <= 1'b1;
    else
      awvalid <= awvalid;
  end 

  always @(posedge M_AXI_ACLK) begin
    if (M_AXI_ARESETN == 0  || irq_dma_pulse)
	   wvalid <= 1'b0;
    else if (M_AXI_WREADY && wvalid)
	   wvalid <= 1'b0;
    else if (push_write)
      wvalid <= 1'b1;
    else
      wvalid <= awvalid;
  end 

//Always accept write responses
  always @(posedge M_AXI_ACLK) begin
    if (M_AXI_ARESETN == 0 || irq_dma_pulse)
 	   bready <= 1'b0;
    else
 	   bready <= 1'b1;
  end
  
//Number of address/data pairs specificed below
parameter C_NUM_COMMANDS = 6;

//Write Addresses 
  always @(write_index) begin
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
  always @(write_index) begin
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

//Новая инициализация DMA после очередного прерывания(пересылки рефлектограммы)
  always @(posedge M_AXI_ACLK) begin
    if (M_AXI_ARESETN == 0 || irq_dma_pulse) begin
	   push_write <= 1'b0;
	   write_index <= 0;
	 end else if ((up_len_ref != 0) && (in_addr_buff != 0) && (go)) begin
	   if (~up_len_ref[0]) begin
		  if (~awvalid && ~wvalid && ~last_write && ~push_write) begin
		    push_write <= 1'b1;
			 write_index <= write_index + 1;
		  end else begin
			 push_write <= 1'b0; //Negate to generate a pulse
			 write_index <= write_index;
		  end
		end
    end
  end 
   
//Terminal write count   
  assign last_write = (write_index == C_NUM_COMMANDS);
//Check for last write completion
  always @(posedge M_AXI_ACLK) begin
    if (M_AXI_ARESETN == 0 || irq_dma_pulse)
      writes_done <= 1'b0;
    else if (last_write && M_AXI_BVALID)
      writes_done <= 1'b1;
    else
      writes_done <= writes_done;
  end
///////////////////////////////////////////////////////////////////////////////////	
/////////////////////////////// END PART MASTER ////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////	 
endmodule
