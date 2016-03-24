/* 
 * File:   main.h
 * Author: Bryan
 * Created on February 4, 2016, 3:40 PM
 * Description: This defines common macros and standard includes
 * Also includes header guard and C++ compatible name mangling wrapper ifdef
 */

#ifndef MAIN_H
#define	MAIN_H

#include <xc.h>

#pragma config BWRP = WRPROTECT_OFF
#pragma config BSS = NO_FLASH
#pragma config GWRP = OFF
#pragma config GSS = OFF
#pragma config FNOSC = FRC
#pragma config IESO = OFF
#pragma config POSCMD = NONE
#pragma config OSCIOFNC = ON
#pragma config IOL1WAY = OFF
#pragma config FCKSM = CSECMD
#pragma config WDTPOST = PS512
#pragma config WDTPRE = PR128
#pragma config WINDIS = OFF
#pragma config FWDTEN = OFF
#pragma config FPWRT = PWR16
#pragma config ALTI2C = OFF
#pragma config ICS = PGD1
#pragma config JTAGEN = OFF

#endif	/* MAIN_H */

