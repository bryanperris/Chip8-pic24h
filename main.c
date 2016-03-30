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
char __text[10];
int menuLine = 0;

#define MENU_WRITE(format, args...) \
        sprintf(__text, format , ##args); \
        glcd_tiny_draw_string(0, menuLine, &__text[0]); \
        glcd_write();

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
    #define romSize 9

    const Chip8Rom Font = DefineRom("Font", 80);
    
    const Chip8Rom Roms[romSize] = {
        DefineRom( "Chip8",   164 ),
        DefineRom( "SC Test", 673 ),
        DefineRom( "Maze",    35),
        DefineRom( "Pong",    247),
        DefineRom( "JXO",     83),
        DefineRom( "Space",   1302),
        DefineRom( "Sierp",   522),
        DefineRom( "Zero",   145),
        DefineRom( "Particle",   354),
    };
    
    #if defined(GLCD)
        glcd_init();
        GLCD_TEXT_INIT();
        glcd_clear_buffer();
    #endif
    
    /* Scroll Down Button */
    _LATB11 = 0;
    _TRISB11 = 1;
    _ODCB11 = 0;
    _CN15PUE = 1;
    
    /* Start Button */
    _LATB10 = 0;
    _TRISB10 = 1;
    _ODCB10 = 0;
    _CN16PUE = 1;
    
    int romSelect = 0;
    int offset = 0;
    int i = 0;
    int index = 1;
    
    while (1)
    {
        glcd_clear();
        
        for (i = 0; i < 6; i++)
        {
            index = offset + i;
            menuLine = i;
            
            if (index < romSize)
            {
                if (index == romSelect) 
                {
                    MENU_WRITE("*%s", (&Roms[index])->name);
                }
                else
                {
                    MENU_WRITE(" %s", (&Roms[index])->name);
                }
            }
            else
            {
                DEBUG_WRITE(" ******");
            }
        }
        
        /* Wait for button press */
        while ( (PORTB & _PORTB_RB11_MASK) && (PORTB & _PORTB_RB10_MASK) );
        
        /* Start if this button has been pressed */
        if (!(PORTB & _PORTB_RB10_MASK))
        {
            break;
        }
        
        romSelect++;
        if (romSelect > 5) offset++;
        if (romSelect >= romSize) { offset = 0; romSelect = 0; }
        
        /* Wait for release */
        while (!(PORTB & _PORTB_RB11_MASK));
        
    }
    
    glcd_clear();
    DEBUG_WRITE("Chip8 Start");
    
    Ch8Init();
    
    /* Copy FONT into Chip8 Memory */
    Ch8LoadRom(&Font, CH8MEM_SYSRESERVED);

    /* Load test rom */
    Ch8LoadRom(&Roms[romSelect], CH8MEM_ENTRYPOINT);
    
    delay_routine();
    delay_routine();
    
    Ch8Run();
    
    return 0;
}
