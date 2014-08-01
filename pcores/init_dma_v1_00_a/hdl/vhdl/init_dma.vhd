-------------------------------------------------------------------------------
--
-- AXI4-Lite Master
--
-- VHDL-Standard:   VHDL'93
----------------------------------------------------------------------------
--
-- Structure:
--   axi_lite_master
--
----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_misc.all;

--library unisim;
--use unisim.vcomponents.all;

entity init_dma is
  generic(
	 -- Master
    C_M_AXI_ADDR_WIDTH      : integer := 32;
    C_M_AXI_DATA_WIDTH      : integer := 32;
	 -- Master1
	 C_M1_AXI_ADDR_WIDTH      : integer := 32;
    C_M1_AXI_DATA_WIDTH      : integer := 32;
	 -- Slave
	 C_S_AXI_ADDR_WIDTH   : integer := 32;
    C_S_AXI_DATA_WIDTH   : integer := 4
	 );
  port(
    -- System Signals Master
    M_AXI_ACLK    : in std_logic;
    M_AXI_ARESETN : in std_logic;
    -- System Signals Master1	 
    M1_AXI_ACLK    : in std_logic;
    M1_AXI_ARESETN : in std_logic;
	 -- System Signals Slave
	 S_AXI_ACLK    : in std_logic;
    S_AXI_ARESETN : in std_logic;

    -- Master Interface Write Address
    M_AXI_AWADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_AWPROT  : out std_logic_vector(3-1 downto 0);
    M_AXI_AWVALID : out std_logic;
    M_AXI_AWREADY : in  std_logic;
	 
	 M1_AXI_AWADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    M1_AXI_AWPROT  : out std_logic_vector(3-1 downto 0);
    M1_AXI_AWVALID : out std_logic;
    M1_AXI_AWREADY : in  std_logic;
	 -- Slave Interface Write Address Ports
    S_AXI_AWADDR   : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT   : in  std_logic_vector(3-1 downto 0);
    S_AXI_AWVALID  : in  std_logic;
    S_AXI_AWREADY  : out std_logic;

    -- Master Interface Write Data
    M_AXI_WDATA  : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    M_AXI_WSTRB  : out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
    M_AXI_WVALID : out std_logic;
    M_AXI_WREADY : in  std_logic;
	 
	 M1_AXI_WDATA  : out std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    M1_AXI_WSTRB  : out std_logic_vector(C_M_AXI_DATA_WIDTH/8-1 downto 0);
    M1_AXI_WVALID : out std_logic;
    M1_AXI_WREADY : in  std_logic;
	 
	     -- Slave Interface Write Data Ports
    S_AXI_WDATA  : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB  : in  std_logic_vector(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    S_AXI_WVALID : in  std_logic;
    S_AXI_WREADY : out std_logic;

    -- Master Interface Write Response
    M_AXI_BRESP  : in  std_logic_vector(2-1 downto 0);
    M_AXI_BVALID : in  std_logic;
    M_AXI_BREADY : out std_logic;
	 
	 M1_AXI_BRESP  : in  std_logic_vector(2-1 downto 0);
    M1_AXI_BVALID : in  std_logic;
    M1_AXI_BREADY : out std_logic;
	 
	     -- Slave Interface Write Response Ports
    S_AXI_BRESP  : out std_logic_vector(2-1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_BREADY : in  std_logic;

    -- Master Interface Read Address

    M_AXI_ARADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    M_AXI_ARPROT  : out std_logic_vector(3-1 downto 0);
    M_AXI_ARVALID : out std_logic;
    M_AXI_ARREADY : in  std_logic;

    M1_AXI_ARADDR  : out std_logic_vector(C_M_AXI_ADDR_WIDTH-1 downto 0);
    M1_AXI_ARPROT  : out std_logic_vector(3-1 downto 0);
    M1_AXI_ARVALID : out std_logic;
    M1_AXI_ARREADY : in  std_logic;
	 
    -- Slave Interface Read Address Ports
    S_AXI_ARADDR   : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT   : in  std_logic_vector(3-1 downto 0);
    S_AXI_ARVALID  : in  std_logic;
    S_AXI_ARREADY  : out std_logic;

    -- Master Interface Read Data 
    M_AXI_RDATA  : in  std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    M_AXI_RRESP  : in  std_logic_vector(2-1 downto 0);
    M_AXI_RVALID : in  std_logic;
    M_AXI_RREADY : out std_logic;
	 
	 M1_AXI_RDATA  : in  std_logic_vector(C_M_AXI_DATA_WIDTH-1 downto 0);
    M1_AXI_RRESP  : in  std_logic_vector(2-1 downto 0);
    M1_AXI_RVALID : in  std_logic;
    M1_AXI_RREADY : out std_logic;
	     -- Slave Interface Read Data Ports
    S_AXI_RDATA  : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP  : out std_logic_vector(2-1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_RREADY : in  std_logic

    );

end init_dma;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
architecture implementation of init_dma is
begin
end implementation;
