#include "i2c.h"
#include "eeprom.h"

#define BlockSelect(x) x >= 0x8000 ? 1 : 0

byte __inline__ EEPROMGetControlByte(uint16 eepromAddress, uint16 slaveAddress, byte readMode)
{
    return (0xA << 4 | ((BlockSelect(eepromAddress) & 1) << 3) | ((slaveAddress & 3) << 1) | (readMode & 1));
}

void EEPROMWriteControlByte(uint16 eepromAddress, uint16 slaveAddress, byte readMode)
{
    byte c = EEPROMGetControlByte(eepromAddress, slaveAddress, readMode);
    I2CWriteByte(c);
}

void EEPROMWriteAddressBytes(uint16 eepromAddress)
{
    /* High */
    I2CWriteByte((eepromAddress >> 8) & 0xFF);
    
    /* Low */
    I2CWriteByte(eepromAddress & 0xFF);
}

void EEPROMReadBytes(
    byte * const buffer,
    int count,
    uint16 slaveAddress, 
    uint16 eepromAddress)
{
    int i = 0;
    
    I2C1ADD = slaveAddress;
        
    I2CStart();
    
    EEPROMWriteControlByte(eepromAddress, slaveAddress, 0);    
    EEPROMWriteAddressBytes(eepromAddress);
    
    I2CStart();
    
    EEPROMWriteControlByte(eepromAddress, slaveAddress, 1);
    
    if (count > 1)
    {
        for (i = 0; i < count && i < 64; i++)
        {
            *(buffer + i) = I2CReadByte();

            if ((i + 1) < count)
            {
                I2CAck();
            }
            else
            {
                I2CNack();
            }
        }
    }
    else
    {
        *buffer = I2CReadByte();
        I2CNack();
    }
    
    I2CStop();
}

void EEPROMWriteBytes(
    const byte * buffer,
    int count,
    uint16 slaveAddress, 
    uint16 eepromAddress)
{
    int i = 0;
    
    I2C1ADD = slaveAddress;
        
    I2CStart();
    
    EEPROMWriteControlByte(eepromAddress, slaveAddress, 0);    
    EEPROMWriteAddressBytes(eepromAddress);
    
    if (count > 1)
    {
        for (i = 0; i < count && i < 64; i++)
        {
           I2CWriteByte(*(buffer + i));
        }
    }
    else
    {
        I2CWriteByte(*buffer);
    }
    
    
    I2CStop();
    
    __delay_ms(5);
}
