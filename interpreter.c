#include "common.h"
#include "chip8.h"
#include "interpreter.h"
#include "inst.h"
#include <math.h>
#include "chip8mem.h"
#include <stdint.h>

uint16 g_Stack[16];
byte g_StackPointer;

#define INST Ch8Inst *
#define X CH8_VREG[inst->x]
#define Y CH8_VREG[inst->y]
#define _X CH8_VREG[inst.x]
#define _Y CH8_VREG[inst.y]
#define FLAG CH8_VREG[0xF]
#define I g_Ch8IRegister
#define CH8VIDEO_XMAX 63
#define CH8VIDEO_YMAX 31
#define DRAW_WRAP_X
#define DRAW_WRAP_Y
//#define INT_DEBUG

void __inline OPCODE_READ_REGS(const INST inst)
{
    uint16 i = 0; 
    for (i = 0; i <= inst->x; i++)
    {
        CH8_VREG[i] = Ch8MemReadByte(I + i);
    }
}

void __inline__ OPCODE_WRITE_REGS(const INST inst)
{
    uint16 i = 0; 
    for (i = 0; i <= inst->x; i++)
    {
        Ch8MemWriteByte(I + i, CH8_VREG[i]);
    }
}

void __inline__ OPCODE_RPL_WRITE_REGS(const INST inst)
{
    int i = 0; 
    for (i = 0; i <= inst->x; i++)
    {
        g_RplRegs[i] = CH8_VREG[i];
    }
}

void __inline__ OPCODE_RPL_READ_REGS(const INST inst)
{
    int i = 0; 
    for (i = 0; i <= inst->x; i++)
    {
        CH8_VREG[i] = g_RplRegs[i];
    }
}

void __inline__ OPCODE_BCD(const byte value)
{
    Ch8MemWriteByte(I + 0,  value / 100);
    Ch8MemWriteByte(I + 1, (value % 100) / 10);
    Ch8MemWriteByte(I + 2, (value % 100) % 10);
}

void __inline__ OPCODE_CLR ()
{
#if defined(GLCD) & !defined(INT_DEBUG)
    glcd_clear();
#endif
}

void __inline__ OPCODE_RET ()
{
    if (g_StackPointer - 1 < 0)
    {
        /* Cannot go below 0 */
        return;
    }
    
    PC = g_Stack[--g_StackPointer];
}

void __inline__ OPCODE_CALL(const INST inst)
{
    if (g_StackPointer + 1 > 15)
    {
        /* Cannot go beyond 16 levels */
        return;
    }
    
    g_Stack[g_StackPointer++] = PC;
    PC = inst->nnn;
}

void __inline__ OPCODE_SE(const byte a, const byte b)
{
    if (a == b) PC += 2;
}

void __inline__ OPCODE_SNE(const byte a, const byte b)
{
    if (a != b) PC += 2;
}

void __inline__ OPCODE_LD(const INST inst, const byte value)
{
    X = value;
}

void __inline__ OPCODE_ADD_OVERFLOW(const INST inst, const byte value, int overflowCheck)
{
    uint16 result = X + value;
    if (overflowCheck) FLAG = result > 0xFF; else FLAG = 0;
    X = (byte)result;
}

void __inline__ OPCODE_ADD(const INST inst, const byte value)
{
    OPCODE_ADD_OVERFLOW(inst, value, 0);
}

void __inline__ OPCODE_ADD_I (const INST inst, const byte value)
{
    if ( (I + value) >= 0x1000 )
    {
        I = 0x1000;
        FLAG = 1;
    }
    else
    {
        I += value;
    }
}

void __inline__ OPCODE_OR(const INST inst)
{
    X |= Y;
    FLAG = 0;
}

void __inline__ OPCODE_AND(const INST inst)
{
    X &= Y;
    FLAG = 0;
}

void __inline__ OPCODE_XOR(const INST inst)
{
    X ^= Y;
    FLAG = 0;
}

void __inline__ OPCODE_SUB(const INST inst, const byte a, const byte b)
{
    FLAG = a >= b;
    X = a - b;
}

void __inline__ OPCODE_SHR(const INST inst)
{
    FLAG = ((X & 1) == 1);
    X = X / 2;
}

void __inline__ OPCODE_SHL(const INST inst)
{
    FLAG = ((X & 0x80) >> 7) == 1;
    X = X * 2;
}

void __inline__ OPCODE_DRAW(const INST inst)
{
#if defined(GLCD) & !defined(INT_DEBUG)
    uint8_t x = X;
    uint8_t y = Y;
    uint8_t height = inst->n;
    byte pixel = 0;
    uint8_t readPixel = 0;
    int yline = 0;
    int xline = 0;
    uint8_t px = 0;
    uint8_t py = 0;
    FLAG = 0;
    
    for (yline = 0; yline < height; yline++)
    {
        pixel = Ch8MemReadByte(I + yline);
        
        
        for (xline = 0; xline < 8; xline++)
        {
#ifdef DRAW_WRAP_X
            px = 10 + ((x + xline) & (64 - 1));
#else
            px = 10 + x + xline;
#endif
            
#ifdef DRAW_WRAP_Y
            py = 8 + ((y + yline) & (32 - 1));
#else
            py = 8 + y + yline;   
#endif
            
            
            if (pixel & (0x80 >> xline))
            {
                readPixel = glcd_get_pixel(px, py);
                if (readPixel) FLAG = 1;
                glcd_set_pixel(px, py, readPixel ^ 1);
            }
        }
    }
    
    glcd_write();
#else
    Ch8MemReadByte(I);
#endif
}

uint16 OpcodeMask(const Ch8Inst * inst)
{
    uint16 mask = 0xF000;
    byte opcode = (inst->inst & 0xF000) >> 12;
    
    switch (opcode)
    {
        case 0x0:
        {
            if (inst->inst)
            {
                if ((inst->inst & 0xFFF0) == 0x00C0)
                {
                    mask = 0xFFF0;
                }
                else
                {
                    mask = 0xFFFF;
                }
            }
            break;
        }
        
        case 0xF:
        case 0xE: mask = 0xF0FF; break;
        case 0x8: mask = 0xF00F; break;
        default: mask = 0xF000; break;
    }
    
    return mask;
}

void Ch8Interpreter_ExecuteInst(void)
{
    /* Fetch - Load 2 bytes from memory at PC position */
    byte h = CH8_MEMORY_GETBYTE(PC++);
    byte l = CH8_MEMORY_GETBYTE(PC++);
    Ch8Inst inst;
    inst.inst = (h << 8) | l;
    uint16 mask = OpcodeMask(&inst);
    uint16 op = inst.inst & mask;
    
    /* Decode and execute, and write back */
#ifdef INT_DEBUG
    debugWriteLcd = 1;
    DEBUG_WRITE("%04X:%04X", PC - 2, inst.inst);
    __delay_ms(700);
#endif
    
    switch (op)
    {
        case 0x00E0: OPCODE_CLR(); break;
        case 0x00EE: OPCODE_RET(); break;
        case 0x1000: PC = inst.nnn; break;
        case 0x2000: OPCODE_CALL(&inst); break;
        case 0x3000: OPCODE_SE(_X, inst.kk); break;
        case 0x4000: OPCODE_SNE(_X, inst.kk); break;
        case 0x5000: OPCODE_SE(_X, _Y); break;
        case 0x6000: OPCODE_LD(&inst, inst.kk); break;
        case 0x7000: OPCODE_ADD(&inst, inst.kk); break;
        case 0x8000: OPCODE_LD(&inst, _Y); break;
        case 0x8001: OPCODE_OR(&inst); break;
        case 0x8002: OPCODE_AND(&inst); break;
        case 0x8003: OPCODE_XOR(&inst); break;
        case 0x8004: OPCODE_ADD_OVERFLOW(&inst, _Y, 1); break;
        case 0x8005: OPCODE_SUB(&inst, _X, _Y); break;
        case 0x8006: OPCODE_SHR(&inst); break;
        case 0x8007: OPCODE_SUB(&inst, _Y, _X); break;
        case 0x800E: OPCODE_SHL(&inst); break;
        case 0x9000: OPCODE_SNE(_X, _Y); break;
        case 0xA000: I = inst.nnn; break;
        case 0xB000: PC = inst.nnn + CH8_VREG[0]; break;
        case 0xC000: _X = (byte)floor(rand() % 256);
        case 0xD000: OPCODE_DRAW(&inst); break;
        case 0xE09E: OPCODE_SE(_X, g_Ch8LastKeyPress); break;
        case 0xE0A1: OPCODE_SNE(_X, g_Ch8LastKeyPress); break;
        case 0xF007: OPCODE_LD(&inst, g_Ch8DelayRegister); break;
        case 0xF00A: while (!g_WaitForKey); OPCODE_LD(&inst, g_Ch8LastKeyPress); g_WaitForKey = 0; break;
        //case 0xF015: g_Ch8DelayRegister = _X; break;
        case 0xF015: __delay_ms(16.7);
        case 0xF018: g_Ch8AudioRegister = _Y; break;
        case 0xF01E: OPCODE_ADD_I(&inst, _X); break;
        case 0xF029: I = _X * 5; break;
        case 0xF033: OPCODE_BCD(_X); break;
        case 0xF055: OPCODE_WRITE_REGS(&inst); break;
        case 0xF065: OPCODE_READ_REGS(&inst); break;
        case 0xF075: OPCODE_RPL_WRITE_REGS(&inst); break;
        case 0xF085: OPCODE_RPL_READ_REGS(&inst); break;
        default: 
        {
#ifdef INT_DEBUG
            DEBUG_WRITE("ERR: 0x%04X", inst.inst);
            while(1) {}
#else
            break;
#endif
        }
    }
}
