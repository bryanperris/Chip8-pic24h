/* File:   main.c
 * Author: Bryan
 * Created on January 21, 2016, 10:21 PM
 * Description: Main source file for LabB1
 * LabB1: Flashing an LED
 */

/* Includes */
#include "main.h"
#include "common.h"
#include "chip8.h"
#include "rom.h"
#include "eeprom.h"

uint16 g_RomOffset;    

Chip8Rom DefineRom(char * name, uint16 size)
{
    Chip8Rom r;
    r.name = name;
    r.offset = g_RomOffset;
    r.size = size;
    g_RomOffset += size;
    return r;
}

/* Main program entry point */
int main(void) 
{
    const Chip8Rom Roms[10] = {
        DefineRom( "Font",    80  ),
        DefineRom( "Chip8",   164 ),
        DefineRom( "SC Test", 673 ),
        DefineRom( "Maze",    35),
        DefineRom( "Pong",    247),
        DefineRom( "Simple",  86),
        DefineRom( "JXO",     83),
        DefineRom( "Space",   1302),
        DefineRom( "Trip8",   3204)
    };
    
    #if defined(GLCD)
        glcd_init();
        GLCD_TEXT_INIT();
        glcd_clear_buffer();
    #endif
   
    DEBUG_WRITE("Chip8 Start");
    
    Ch8Init();
    
    /* Copy FONT into Chip8 Memory */
    Ch8LoadRom(&Roms[0], CH8MEM_SYSRESERVED);

    /* Load test rom */
    Ch8LoadRom(&Roms[7], CH8MEM_ENTRYPOINT);
    
    delay_routine();
    delay_routine();
    
    Ch8Run();
    
    return 0;
}
