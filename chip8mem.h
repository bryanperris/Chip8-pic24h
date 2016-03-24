/* 
 * File:   chip8mem.h
 * Author: Bryan
 *
 * Created on March 18, 2016, 1:33 PM
 */

#ifndef CHIP8MEM_H
#define	CHIP8MEM_H

#include "common.h"

void Ch8MemInit(void);
byte Ch8MemReadByte(uint16 address);
void Ch8MemWriteByte(uint16 address, byte value);

#endif	/* CHIP8MEM_H */

