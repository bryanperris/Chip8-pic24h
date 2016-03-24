/* 
 * File:   eeprom.h
 * Author: Bryan
 *
 * Created on March 16, 2016, 2:46 PM
 */

#ifndef EEPROM_H
#define	EEPROM_H

#include "common.h"

void EEPROMWriteBytes(
    const byte * buffer,
    int count,
    uint16 slaveAddress, 
    uint16 eepromAddress);

void EEPROMReadBytes(
    byte * buffer,
    int count,
    uint16 slaveAddress, 
    uint16 eepromAddress);

#endif	/* EEPROM_H */

