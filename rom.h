/* 
 * File:   rom.h
 * Author: Bryan
 *
 * Created on March 16, 2016, 2:33 PM
 */

#ifndef ROM_H
#define	ROM_H

#include "common.h"

typedef struct
{
    char * name;
    uint16 offset;
    uint16 size;
} Chip8Rom;

#endif	/* ROM_H */

