/* 
 * File:   inst.h
 * Author: Bryan
 *
 * Created on March 19, 2016, 12:56 AM
 */

#ifndef INST_H
#define	INST_H

typedef union 
{
        uint16 inst;
        uint16 nnn : 12;
        byte kk : 8;
        
        struct 
        {
               byte n : 4;
               byte y : 4;
               byte x : 4;
               byte op : 4;
        };
            
} Ch8Inst;

#endif	/* INST_H */

