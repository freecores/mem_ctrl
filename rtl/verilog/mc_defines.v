/////////////////////////////////////////////////////////////////////
////                                                             ////
////  WISHBONE Memory Controller Definitions                     ////
////                                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
////                                                             ////
////  Downloaded from: http://www.opencores.org/cores/mem_ctrl/  ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////

//  CVS Log
//
//  $Id: mc_defines.v,v 1.1 2001-07-29 07:34:41 rudi Exp $
//
//  $Date: 2001-07-29 07:34:41 $
//  $Revision: 1.1 $
//  $Author: rudi $
//  $Locker:  $
//  $State: Exp $
//
// Change History:
//               $Log: not supported by cvs2svn $
//               Revision 1.3  2001/06/12 15:19:49  rudi
//
//
//               Minor changes after running lint, and a small bug fix reading csr and ba_mask registers.
//
//               Revision 1.2  2001/06/03 11:37:17  rudi
//
//
//               1) Fixed Chip Select Mask Register
//               	- Power On Value is now all ones
//               	- Comparison Logic is now correct
//
//               2) All resets are now asynchronous
//
//               3) Converted Power On Delay to an configurable item
//
//               4) Added reset to Chip Select Output Registers
//
//               5) Forcing all outputs to Hi-Z state during reset
//
//               Revision 1.1.1.1  2001/05/13 09:39:38  rudi
//               Created Directory Structure
//
//
//
//

`timescale 1ns / 10ps

/////////////////////////////////////////////////////////////////////
//
// This define selects how the WISHBONE interface determines if
// the internal register file is selected.
// This should be a simple address decoder. "wb_addr_i" is the
// WISHBONE address bus (32 bits wide).
`define	REG_SEL		(wb_addr_i[31:29] == 3'h7)

// This define selects how the WISHBONE interface determines if
// the memory is selected.
// This should be a simple address decoder. "wb_addr_i" is the
// WISHBONE address bus (32 bits wide).
`define	MEM_SEL		(wb_addr_i[31:29] == 3'h0)

/////////////////////////////////////////////////////////////////////
//
// This are the default Power-On Reset values for Chip Select
//

// Defines which chip select is used for Power On booting
`define DEF_SEL		3'h3

// Defines the default (reset) TMS value for the DEF_SEL chip select
`define	DEF_POR_TMS 	32'hffff_ffff


/////////////////////////////////////////////////////////////////////
//
// Define how many Chip Selects to Implement
//
`define HAVE_CS1	1
`define HAVE_CS2	1
`define HAVE_CS3	1
`define HAVE_CS4	1
`define HAVE_CS5	1
`define HAVE_CS6	1
`define HAVE_CS7	1


/////////////////////////////////////////////////////////////////////
//
// Init Refresh
//
// Number of Refresh Cycles to perform during SDRAM initialization.
// This varies between SDRAM manufacturer. Typically this value is
// between 2 and 8. This number must be smaller than 16.
`define	INIT_RFRC_CNT	2

/////////////////////////////////////////////////////////////////////
//
// Power On Delay
//
// Most if SDRAMs require some time to initialize before they can be used
// after power on. If the Memory Controller shall stall after power on to
// allow SDRAMs to finish the initialization process uncomment the below
// define statement
`define	POR_DELAY	1

// This value defines how many MEM_CLK cycles the Memory Controller should
// stall. Default is 2.5uS. At a 10nS MEM_CLK cycle time, this would 250
// cycles.
`define	POR_DELAY_VAL	8'd250


// ===============================================================
// ===============================================================
// Various internal defines (DO NOT MODIFY !)
// ===============================================================
// ===============================================================

// Register settings encodings
`define BW_8	2'h0
`define BW_16	2'h1
`define BW_32	2'h2

`define MEM_TYPE_SDRAM	3'h0
`define MEM_TYPE_SRAM	3'h1
`define MEM_TYPE_ACS	3'h2
`define MEM_TYPE_SCS	3'h3

`define MEM_SIZE_64	2'h0
`define MEM_SIZE_128	2'h1
`define MEM_SIZE_256	2'h2
