/*****************************************************************************
* Filename:          /home/vladimir/cf_ad9467_zed/drivers/a_v1_00_a/src/a.h
* Version:           1.00.a
* Description:       a Driver Header File
* Date:              Thu Jul 24 22:34:40 2014 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef A_H
#define A_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 * -- SLV_REG3 : user logic slave module register 3
 * -- SLV_REG4 : user logic slave module register 4
 * -- SLV_REG5 : user logic slave module register 5
 * -- SLV_REG6 : user logic slave module register 6
 * -- SLV_REG7 : user logic slave module register 7
 * -- SLV_REG8 : user logic slave module register 8
 * -- SLV_REG9 : user logic slave module register 9
 * -- SLV_REG10 : user logic slave module register 10
 * -- SLV_REG11 : user logic slave module register 11
 * -- SLV_REG12 : user logic slave module register 12
 * -- SLV_REG13 : user logic slave module register 13
 * -- SLV_REG14 : user logic slave module register 14
 * -- SLV_REG15 : user logic slave module register 15
 * -- SLV_REG16 : user logic slave module register 16
 * -- SLV_REG17 : user logic slave module register 17
 * -- SLV_REG18 : user logic slave module register 18
 * -- SLV_REG19 : user logic slave module register 19
 * -- SLV_REG20 : user logic slave module register 20
 * -- SLV_REG21 : user logic slave module register 21
 * -- SLV_REG22 : user logic slave module register 22
 * -- SLV_REG23 : user logic slave module register 23
 * -- SLV_REG24 : user logic slave module register 24
 * -- SLV_REG25 : user logic slave module register 25
 * -- SLV_REG26 : user logic slave module register 26
 * -- SLV_REG27 : user logic slave module register 27
 * -- SLV_REG28 : user logic slave module register 28
 * -- SLV_REG29 : user logic slave module register 29
 * -- SLV_REG30 : user logic slave module register 30
 * -- SLV_REG31 : user logic slave module register 31
 */
#define A_USER_SLV_SPACE_OFFSET (0x00000000)
#define A_SLV_REG0_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000000)
#define A_SLV_REG1_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000004)
#define A_SLV_REG2_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000008)
#define A_SLV_REG3_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000000C)
#define A_SLV_REG4_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000010)
#define A_SLV_REG5_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000014)
#define A_SLV_REG6_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000018)
#define A_SLV_REG7_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000001C)
#define A_SLV_REG8_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000020)
#define A_SLV_REG9_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000024)
#define A_SLV_REG10_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000028)
#define A_SLV_REG11_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000002C)
#define A_SLV_REG12_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000030)
#define A_SLV_REG13_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000034)
#define A_SLV_REG14_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000038)
#define A_SLV_REG15_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000003C)
#define A_SLV_REG16_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000040)
#define A_SLV_REG17_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000044)
#define A_SLV_REG18_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000048)
#define A_SLV_REG19_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000004C)
#define A_SLV_REG20_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000050)
#define A_SLV_REG21_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000054)
#define A_SLV_REG22_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000058)
#define A_SLV_REG23_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000005C)
#define A_SLV_REG24_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000060)
#define A_SLV_REG25_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000064)
#define A_SLV_REG26_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000068)
#define A_SLV_REG27_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000006C)
#define A_SLV_REG28_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000070)
#define A_SLV_REG29_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000074)
#define A_SLV_REG30_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x00000078)
#define A_SLV_REG31_OFFSET (A_USER_SLV_SPACE_OFFSET + 0x0000007C)

/**
 * User Logic Master Space Offsets
 * -- MST_CNTL_REG : user logic master module control register
 * -- MST_STAT_REG : user logic master module status register
 * -- MST_ADDR_REG : user logic master module address register
 * -- MST_BE_REG   : user logic master module byte enable register
 * -- MST_LEN_REG  : user logic master module length (data transfer in bytes) register
 * -- MST_GO_PORT  : user logic master module go bit (to start master operation)
 */
#define A_USER_MST_SPACE_OFFSET (0x00000100)
#define A_MST_CNTL_REG_OFFSET (A_USER_MST_SPACE_OFFSET + 0x00000000)
#define A_MST_STAT_REG_OFFSET (A_USER_MST_SPACE_OFFSET + 0x00000001)
#define A_MST_ADDR_REG_OFFSET (A_USER_MST_SPACE_OFFSET + 0x00000004)
#define A_MST_BE_REG_OFFSET (A_USER_MST_SPACE_OFFSET + 0x00000008)
#define A_MST_LEN_REG_OFFSET (A_USER_MST_SPACE_OFFSET + 0x0000000C)
#define A_MST_GO_PORT_OFFSET (A_USER_MST_SPACE_OFFSET + 0x0000000F)

/**
 * User Logic Master Module Masks
 * -- MST_RD_MASK   : user logic master read request control
 * -- MST_WR_MASK   : user logic master write request control
 * -- MST_BL_MASK   : user logic master bus lock control
 * -- MST_BRST_MASK : user logic master burst assertion control
 * -- MST_DONE_MASK : user logic master transfer done status
 * -- MST_BSY_MASK  : user logic master busy status
 * -- MST_BRRD      : user logic master burst read request
 * -- MST_BRWR      : user logic master burst write request
 * -- MST_SGRD      : user logic master single read request
 * -- MST_SGWR      : user logic master single write request
 * -- MST_START     : user logic master to start transfer
 */
#define MST_RD_MASK (0x00000001UL)
#define MST_WR_MASK (0x00000002UL)
#define MST_BL_MASK (0x00000004UL)
#define MST_BRST_MASK (0x00000008UL)
#define MST_DONE_MASK (0x01)
#define MST_BSY_MASK (0x00000020UL)
#define MST_ERROR_MASK (0x00000040UL)
#define MST_TIMEOUT_MASK (0x00000080UL)
#define MST_BRRD (0x09)
#define MST_BRWR (0x0A)
#define MST_SGRD (0x01)
#define MST_SGWR (0x02)
#define MST_START (0x0A)

/**
 * Software Reset Space Register Offsets
 * -- RST : software reset register
 */
#define A_SOFT_RST_SPACE_OFFSET (0x00000200)
#define A_RST_REG_OFFSET (A_SOFT_RST_SPACE_OFFSET + 0x00000000)

/**
 * Software Reset Masks
 * -- SOFT_RESET : software reset
 */
#define SOFT_RESET (0x0000000A)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a A register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the A device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void A_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define A_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a A register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the A device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 A_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define A_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from A user logic slave registers.
 *
 * @param   BaseAddress is the base address of the A device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void A_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 A_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define A_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg3(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG3_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg4(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG4_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg5(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG5_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg6(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG6_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg7(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG7_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg8(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG8_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg9(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG9_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg10(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG10_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg11(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG11_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg12(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG12_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg13(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG13_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg14(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG14_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg15(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG15_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg16(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG16_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg17(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG17_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg18(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG18_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg19(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG19_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg20(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG20_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg21(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG21_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg22(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG22_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg23(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG23_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg24(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG24_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg25(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG25_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg26(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG26_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg27(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG27_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg28(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG28_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg29(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG29_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg30(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG30_OFFSET) + (RegOffset), (Xuint32)(Value))
#define A_mWriteSlaveReg31(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (A_SLV_REG31_OFFSET) + (RegOffset), (Xuint32)(Value))

#define A_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG0_OFFSET) + (RegOffset))
#define A_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG1_OFFSET) + (RegOffset))
#define A_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG2_OFFSET) + (RegOffset))
#define A_mReadSlaveReg3(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG3_OFFSET) + (RegOffset))
#define A_mReadSlaveReg4(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG4_OFFSET) + (RegOffset))
#define A_mReadSlaveReg5(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG5_OFFSET) + (RegOffset))
#define A_mReadSlaveReg6(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG6_OFFSET) + (RegOffset))
#define A_mReadSlaveReg7(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG7_OFFSET) + (RegOffset))
#define A_mReadSlaveReg8(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG8_OFFSET) + (RegOffset))
#define A_mReadSlaveReg9(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG9_OFFSET) + (RegOffset))
#define A_mReadSlaveReg10(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG10_OFFSET) + (RegOffset))
#define A_mReadSlaveReg11(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG11_OFFSET) + (RegOffset))
#define A_mReadSlaveReg12(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG12_OFFSET) + (RegOffset))
#define A_mReadSlaveReg13(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG13_OFFSET) + (RegOffset))
#define A_mReadSlaveReg14(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG14_OFFSET) + (RegOffset))
#define A_mReadSlaveReg15(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG15_OFFSET) + (RegOffset))
#define A_mReadSlaveReg16(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG16_OFFSET) + (RegOffset))
#define A_mReadSlaveReg17(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG17_OFFSET) + (RegOffset))
#define A_mReadSlaveReg18(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG18_OFFSET) + (RegOffset))
#define A_mReadSlaveReg19(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG19_OFFSET) + (RegOffset))
#define A_mReadSlaveReg20(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG20_OFFSET) + (RegOffset))
#define A_mReadSlaveReg21(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG21_OFFSET) + (RegOffset))
#define A_mReadSlaveReg22(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG22_OFFSET) + (RegOffset))
#define A_mReadSlaveReg23(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG23_OFFSET) + (RegOffset))
#define A_mReadSlaveReg24(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG24_OFFSET) + (RegOffset))
#define A_mReadSlaveReg25(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG25_OFFSET) + (RegOffset))
#define A_mReadSlaveReg26(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG26_OFFSET) + (RegOffset))
#define A_mReadSlaveReg27(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG27_OFFSET) + (RegOffset))
#define A_mReadSlaveReg28(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG28_OFFSET) + (RegOffset))
#define A_mReadSlaveReg29(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG29_OFFSET) + (RegOffset))
#define A_mReadSlaveReg30(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG30_OFFSET) + (RegOffset))
#define A_mReadSlaveReg31(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (A_SLV_REG31_OFFSET) + (RegOffset))

/**
 *
 * Check status of A user logic master module.
 *
 * @param   BaseAddress is the base address of the A device.
 *
 * @return  Status is the result of status checking.
 *
 * @note
 * C-style signature:
 * 	bool A_mMasterDone(Xuint32 BaseAddress)
 * 	bool A_mMasterBusy(Xuint32 BaseAddress)
 * 	bool A_mMasterError(Xuint32 BaseAddress)
 * 	bool A_mMasterTimeout(Xuint32 BaseAddress)
 *
 */
#define A_mMasterDone(BaseAddress) \
 	((((Xuint32) Xil_In8((BaseAddress)+(A_MST_STAT_REG_OFFSET))) & MST_DONE_MASK) == MST_DONE_MASK)
#define A_mMasterBusy(BaseAddress) \
 	((((Xuint32) Xil_In8((BaseAddress)+(A_MST_STAT_REG_OFFSET))) & MST_BUSY_MASK) == MST_BUSY_MASK)
#define A_mMasterError(BaseAddress) \
 	((((Xuint32) Xil_In8((BaseAddress)+(A_MST_STAT_REG_OFFSET))) & MST_ERROR_MASK) == MST_ERROR_MASK)
#define A_mMasterTimeout(BaseAddress) \
 	((((Xuint32) Xil_In8((BaseAddress)+(A_MST_STAT_REG_OFFSET))) & MST_TIMEOUT_MASK) == MST_TIMEOUT_MASK)

/**
 *
 * Reset A via software.
 *
 * @param   BaseAddress is the base address of the A device.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void A_mReset(Xuint32 BaseAddress)
 *
 */
#define A_mReset(BaseAddress) \
 	Xil_Out32((BaseAddress)+(A_RST_REG_OFFSET), SOFT_RESET)

/************************** Function Prototypes ****************************/


/**
 *
 * User logic master module to send/receive word to/from remote system memory.
 * While sending, one word is read from user logic local FIFO and written to remote system memory.
 * While receiving, one word is read from remote system memory and written to user logic local FIFO.
 *
 * @param   BaseAddress is the base address of the A device.
 * @param   Src/DstAddress is the destination system memory address from/to which the data will be fetched/stored.
 *
 * @return  None.
 *
 * @note    None.
 *
 */
void A_MasterSendWord(Xuint32 BaseAddress, Xuint32 DstAddress);
void A_MasterRecvWord(Xuint32 BaseAddress, Xuint32 SrcAddress);

/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the A instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus A_SelfTest(void * baseaddr_p);
/**
*  Defines the number of registers available for read and write*/
#define TEST_AXI_LITE_USER_NUM_REG 32


#endif /** A_H */
