#include "i2c.h"
#include <xc.h>

void I2CIdleWait(void)
{
    while (I2C1CON & 0x1F);
    while (I2C1STATbits.TRSTAT);
}

void I2CStart(void)
{
    I2CIdleWait();
    I2C1CONbits.SEN = 1;
    while (I2C1CONbits.SEN);
    I2CDebug("Start");
}

void I2CStop(void)
{
    I2CIdleWait();
    I2C1CONbits.PEN = 1;
    while(I2C1CONbits.PEN);
    I2CDebug("Stop");
}

void I2CRestart(void)
{
    I2CIdleWait();
    I2C1CONbits.RSEN = 1;
    while(I2C1CONbits.RSEN);
    I2CDebug("Restart");
}

void I2CAck(void)
{
    I2CIdleWait();
    I2C1CONbits.ACKDT = 0;
    I2C1CONbits.ACKEN = 1;
    while(I2C1CONbits.ACKEN);
    I2CDebug("Ack");
}

void I2CAckWait(void)
{
    I2CDebug("Ack Wait");
    while (I2C1STATbits.TRSTAT & I2C1STATbits.ACKSTAT);
}

void I2CNackWait(void)
{
    I2CDebug("Nack Wait");
    while (I2C1STATbits.TRSTAT & !I2C1STATbits.ACKSTAT);
}

void I2CNack(void) // Acknowledge Data bit
{
    I2CIdleWait();
    I2C1CONbits.ACKDT = 1; 
    I2C1CONbits.ACKEN = 1;
    while(I2C1CONbits.ACKEN);
    I2CDebug("Nack");
}

void I2CInit(void)
{
    I2C1BRG = 34;
    I2C1CONbits.I2CEN = 1;
    I2C1CONbits.DISSLW = 1;
    I2CDebug("I2C Init");
}

void I2CBusIdleWait(void)
{
    while (I2C1STATbits.TRSTAT);
}

byte I2CReadByte(void)
{
    byte read = 0;
    I2C1CONbits.RCEN = 1;
    while (I2C1CONbits.RCEN & !I2C1STATbits.RBF) ;
    
    if (I2C1STATbits.BCL)
    {
        DEBUG_WRITE("R: Bus Coll.");
        while (1) { }
    }
    
    if (I2C1STATbits.I2COV)
    {
        DEBUG_WRITE("Overflow in RCV");
        while (1) { }
    }
    
    I2CIdleWait();
    read = (byte)(I2C1RCV & 0xFF);
    I2CDebug("R: 0x%02x", read);
    return read;
}

void I2CWriteByte(byte byte)
{
    if (I2C1STATbits.BCL)
    {
        DEBUG_WRITE("W: Bus Coll.");
        while (1) { }
    }
    
    I2C1TRN = byte;
    while (I2C1STATbits.TBF);
    I2CIdleWait();
    I2CAckWait();
    I2CDebug("W: 0x%02x", byte);
}
