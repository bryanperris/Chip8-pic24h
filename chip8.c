#include "common.h"
#include "chip8.h"
#include "rom.h"
#include "chip8mem.h"
#include "interpreter.h"
#include "i2c.h"
#include <time.h>
#include <stdlib.h>

#define CHIP8_I2C

byte g_Ch8VRegisters[16];
uint16 g_Ch8IRegister;
uint16 g_Ch8PCRegister;
byte g_Ch8DelayRegister;
byte g_Ch8AudioRegister;
byte g_Ch8LastKeyPress = 100;
byte g_WaitForKey = 0;
byte g_RplRegs[16];

void Ch8InitRegs()
{
    memset(&g_Ch8VRegisters, 0, sizeof(g_Ch8VRegisters));
    g_Ch8IRegister = 0;
    g_Ch8PCRegister = CH8MEM_ENTRYPOINT;
    g_Ch8DelayRegister = 0;
    g_Ch8AudioRegister = 0;
    DEBUG_WRITE("Reg Init");
}

void Ch8Init (void)
{
    DEBUG_WRITE("Chip8 Init");
    
#ifdef CHIP8_I2C
    I2CInit();
#endif
    
    /* Initialize Chip8 */
   CH8_MEMORY_CLEAR();
   DEBUG_WRITE("RAM Init");
   Ch8InitRegs();
   
   /* Init seed */
   srand(time(0));
}

void Ch8Run(void)
{
    DEBUG_WRITE("Core Running...");
    delay_routine();
    
    debugWriteLcd = 0;
    glcd_clear();
    
    while (1)
    {
        // TODO: Check timer status
        
        Ch8Interpreter_ExecuteInst();
    }
}
