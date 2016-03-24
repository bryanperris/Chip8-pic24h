/* 
 * File:   common.h
 * Author: Bryan
 *
 * Created on March 16, 2016, 12:48 PM
 */

#ifndef COMMON_H
#define	COMMON_H

//#define DEBUG_I2C
#define GLCD

#define FCY (7370000 / 2)

/* Common headers */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <xc.h>
#include <libpic30.h>

/* GLCD Library Headers  */
#if defined(GLCD)
#include "glcd/glcd.h"
#include "glcd/font5x7.h"
#endif

/* Define shorthanded named types */
typedef unsigned char byte;
typedef unsigned short uint16;
typedef signed short int16;
typedef unsigned long uint32;
typedef unsigned long long uint64;
typedef signed long long int64;
typedef signed long int32;

/* Define debug string bugger */
#define DEBUG_BUFFER_SIZE 60

extern char debug[DEBUG_BUFFER_SIZE]; 
void empty(char * x, ...);
const char * byte_to_binary(int x);
void delay_routine(void);
extern int debugWriteLcd;

#ifdef DEBUG

#ifdef GLCD
#define DEBUG_WRITE(format, args...) \
    if (debugWriteLcd) { \
    sprintf(debug, format , ##args); \
    GLCD_WRITE(debug); }
#else
#define DEBUG_WRITE(format, args...) printf(format , ##args)
#endif

#else
#define DEBUG_WRITE(format, args...) empty(format, ##args)
#endif //DEBUG

#ifdef DEBUG_I2C
#define I2CDebug(x, y...) {\
    DEBUG_WRITE(x , ##y); \
    delay_routine(); }
#else
    #define I2CDebug(x, args...) empty(x , ##args)
#endif // DEBUG_I2C

#endif	/* COMMON_H */

