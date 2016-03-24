#include "chip8mem.h"
#include "eeprom.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "rom.h"

enum {
    ROM = 0,
    RAM = 1,
} MemType;

#define SLAVE_ADDRESS 1
#define CH8_PAGE_SIZE 64
#define CH8_MEM_SIZE 0x1000;
#define CACHE_NUM_PAGES 12
#define CH8_BUFFER_SIZE (CH8_PAGE_SIZE * CACHE_NUM_PAGES)

#define DEBUG_ON

byte g_Cache [CH8_BUFFER_SIZE];
byte * g_CachePtr;
uint16 g_CacheOffset = 0;
byte init;

void Ch8MemSet(const byte value, int size, uint16 address)
{
    int i = 0;
    uint16 cAddress = address;
    uint16 cSize = size;
    uint16 cOffset = 0;
    byte v [CH8_PAGE_SIZE];
    memset(&v[0], value, CH8_PAGE_SIZE);
    
    for (i = 0; i < size; i++)
    {
        if (!(cAddress % CH8_PAGE_SIZE))
        {
            uint16 pageSize = min(cSize, CH8_PAGE_SIZE);
            EEPROMReadBytes(&v[0], pageSize, SLAVE_ADDRESS, cAddress);
            cAddress += pageSize;
            cSize -= pageSize;
            cOffset += pageSize;
        }
        else
        {
            EEPROMReadBytes(&v[0], 1, SLAVE_ADDRESS, cAddress);
            cAddress++;
            cSize--;
            cOffset++;
        }
    }
}

void FillCache(uint16 address) 
{
    int i = 0;
    uint16 cAddress = address - (address % CH8_PAGE_SIZE);
    uint16 cSize = CH8_BUFFER_SIZE;
    uint16 cOffset = 0;
    
    g_CacheOffset = cAddress;
    
    for (i = 0; i < CH8_BUFFER_SIZE; i++)
    {
            EEPROMReadBytes(g_CachePtr + cOffset, 1, SLAVE_ADDRESS, cAddress);
            cAddress++;
            cSize--;
            cOffset++;
    }
}

void Ch8MemInit()
{
    /* Initialize 4KB of blank data on the EEPROM */
    g_CacheOffset = 0;
    g_CachePtr = &g_Cache[0];
    init = 0;
    Ch8MemSet(0, 0x1000, 0x0);
}

byte Ch8MemReadByte(uint16 address)
{
    if (!init || address < g_CacheOffset || address >= (g_CacheOffset + CH8_BUFFER_SIZE))
    {
        init = 1;
        FillCache(address);
    }
    
    return g_Cache[address - g_CacheOffset];
}

void Ch8MemWriteByte(uint16 address, byte value)
{
    EEPROMWriteBytes(&value, 1, SLAVE_ADDRESS, address);
    
    if (address >= g_CacheOffset && address < (g_CacheOffset + CH8_BUFFER_SIZE))
    {
        g_Cache[address - g_CacheOffset] = value;
    }
}

void Ch8LoadRom(const Chip8Rom * chip8rom, const uint16 dstAddress)
{
    int i = 0;
    uint16 cAddress = dstAddress;
    uint16 cOffset = 0;
    uint16 cSize = chip8rom->size;
    byte page [CH8_PAGE_SIZE];
    
    DEBUG_WRITE("ROM: %s", chip8rom->name);
    
    for (i = 0; i < chip8rom->size; i++)
    {
        /* if the address starts on the page boundary, see if we can write a full page */
        if (!(cAddress & CH8_PAGE_SIZE))
        {
            /* What is the max page size we can write */
            uint16 pageSize = min(CH8_PAGE_SIZE, cSize);
            
            /* Write full page */
            EEPROMReadBytes( &page[0], pageSize, 0, chip8rom->offset + cOffset);
            EEPROMWriteBytes(&page[0], pageSize, 1, cAddress);
            cAddress += pageSize;
            cOffset += pageSize;
            cSize -= pageSize;
        }
        else
        {
            /* If we are writing in the middle of a physical page, we must write single bytes */
            EEPROMReadBytes( &page[0], 1, 0, chip8rom->offset + cOffset);
            EEPROMWriteBytes(&page[0], 1, 1, cAddress);
            cAddress++;
            cOffset++;
            cSize--;
        }
    }
    
    DEBUG_WRITE("Done");
}