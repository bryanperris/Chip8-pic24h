#include "common.h"

char debug [DEBUG_BUFFER_SIZE];
int debugWriteLcd = 1;

void delay_routine(void)
{
    __delay_ms(500);
}

void empty(char * x, ...)
{
    return;
}

const char * byte_to_binary(int x)
{
    static char b[9];
    b[0] = '\0';

    int z;
    for (z = 128; z > 0; z >>= 1)
    {
        strcat(b, ((x & z) == z) ? "1" : "0");
    }

    return b;
}
