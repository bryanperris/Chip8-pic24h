/* 
 * File:   i2c.h
 * Author: Bryan
 *
 * Created on March 16, 2016, 2:37 PM
 */

#ifndef I2C_H
#define	I2C_H

#include "common.h"

void I2CIdleWait(void);
void I2CStop(void);
void I2CStart(void);
void I2CRestart(void);
void I2CAck(void);
void I2CAckWait(void);
void I2CNackWait(void);
void I2CNack(void);
void I2CInit(void);
void I2CBusIdleWait(void);
byte I2CReadByte(void);
void I2CWriteByte(byte byte);

#endif	/* I2C_H */

