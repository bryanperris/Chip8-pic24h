/* 
 * File:   chip8.h
 * Author: Bryan
 * Description: Chip8 emulator header file
 * Created on February 15, 2016, 12:31 PM
 */

#ifndef CHIP8_H
#define	CHIP8_H

#include "common.h"
#include "chip8mem.h"
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "rom.h"

/* Chip8 Memory Constants */
#define CH8MEM_SYSRESERVED 0x0
#define CH8MEM_ENTRYPOINT 0x200
#define CH8MEM_ETI_ENTRYPOINT 0x600
#define CH8MEM_MAXSIZE 0x1000

/* Chip8 Memory API */
#define CH8_MEMORY_CLEAR() Ch8MemInit();
#define CH8_MEMORY_GETBYTE(address) Ch8MemReadByte(address)
#define CH8_MEMORY_SETBYTE(address, byte) Ch8MemWriteByte(address, byte)

///////////////////////////////////////////
/* Chip8 Registers */
/* Vx are general purpose */
/* I Register is a 16-bit register for addresses */
/* PC stores the program counter 
   SP stores stack pointer
   DT is delay timer
   AT is audio timer */
///////////////////////////////////////////

extern byte g_Ch8VRegisters[16];
extern uint16 g_Ch8IRegister;
extern uint16 g_Ch8PCRegister;
extern byte g_Ch8DelayRegister;
extern byte g_Ch8AudioRegister;
extern byte g_Ch8LastKeyPress;
extern byte g_WaitForKey;
extern byte g_RplRegs[16];  // HP48 Calculator RPL Registers

#define CH8_VREG g_Ch8VRegisters
#define PC g_Ch8PCRegister

/* Chip8 Function API */
void Ch8Init (void);
void Ch8LoadRom(const Chip8Rom * chip8rom, const uint16 dstAddress);
void Ch8Run(void);

#endif	/* CHIP8_H */

