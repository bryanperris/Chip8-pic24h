#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=glcd/glcd.c glcd/graphics.c glcd/graphs.c glcd/PCD8544.c glcd/PIC24H.c glcd/text.c glcd/text_tiny.c glcd/unit_tests.c main.c C:/Users/Bryan/MPLABXProjects/Chip8/chip8.c common.c i2c.c eeprom.c chip8mem.c interpreter.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/glcd/glcd.o ${OBJECTDIR}/glcd/graphics.o ${OBJECTDIR}/glcd/graphs.o ${OBJECTDIR}/glcd/PCD8544.o ${OBJECTDIR}/glcd/PIC24H.o ${OBJECTDIR}/glcd/text.o ${OBJECTDIR}/glcd/text_tiny.o ${OBJECTDIR}/glcd/unit_tests.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1046125841/chip8.o ${OBJECTDIR}/common.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/eeprom.o ${OBJECTDIR}/chip8mem.o ${OBJECTDIR}/interpreter.o
POSSIBLE_DEPFILES=${OBJECTDIR}/glcd/glcd.o.d ${OBJECTDIR}/glcd/graphics.o.d ${OBJECTDIR}/glcd/graphs.o.d ${OBJECTDIR}/glcd/PCD8544.o.d ${OBJECTDIR}/glcd/PIC24H.o.d ${OBJECTDIR}/glcd/text.o.d ${OBJECTDIR}/glcd/text_tiny.o.d ${OBJECTDIR}/glcd/unit_tests.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/1046125841/chip8.o.d ${OBJECTDIR}/common.o.d ${OBJECTDIR}/i2c.o.d ${OBJECTDIR}/eeprom.o.d ${OBJECTDIR}/chip8mem.o.d ${OBJECTDIR}/interpreter.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/glcd/glcd.o ${OBJECTDIR}/glcd/graphics.o ${OBJECTDIR}/glcd/graphs.o ${OBJECTDIR}/glcd/PCD8544.o ${OBJECTDIR}/glcd/PIC24H.o ${OBJECTDIR}/glcd/text.o ${OBJECTDIR}/glcd/text_tiny.o ${OBJECTDIR}/glcd/unit_tests.o ${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1046125841/chip8.o ${OBJECTDIR}/common.o ${OBJECTDIR}/i2c.o ${OBJECTDIR}/eeprom.o ${OBJECTDIR}/chip8mem.o ${OBJECTDIR}/interpreter.o

# Source Files
SOURCEFILES=glcd/glcd.c glcd/graphics.c glcd/graphs.c glcd/PCD8544.c glcd/PIC24H.c glcd/text.c glcd/text_tiny.c glcd/unit_tests.c main.c C:/Users/Bryan/MPLABXProjects/Chip8/chip8.c common.c i2c.c eeprom.c chip8mem.c interpreter.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24HJ32GP202
MP_LINKER_FILE_OPTION=,--script=p24HJ32GP202.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/glcd/glcd.o: glcd/glcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/glcd.o.d 
	@${RM} ${OBJECTDIR}/glcd/glcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/glcd.c  -o ${OBJECTDIR}/glcd/glcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/glcd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/glcd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/graphics.o: glcd/graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/graphics.o.d 
	@${RM} ${OBJECTDIR}/glcd/graphics.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/graphics.c  -o ${OBJECTDIR}/glcd/graphics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/graphics.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/graphics.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/graphs.o: glcd/graphs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/graphs.o.d 
	@${RM} ${OBJECTDIR}/glcd/graphs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/graphs.c  -o ${OBJECTDIR}/glcd/graphs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/graphs.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/graphs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/PCD8544.o: glcd/PCD8544.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/PCD8544.o.d 
	@${RM} ${OBJECTDIR}/glcd/PCD8544.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/PCD8544.c  -o ${OBJECTDIR}/glcd/PCD8544.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/PCD8544.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/PCD8544.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/PIC24H.o: glcd/PIC24H.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/PIC24H.o.d 
	@${RM} ${OBJECTDIR}/glcd/PIC24H.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/PIC24H.c  -o ${OBJECTDIR}/glcd/PIC24H.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/PIC24H.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/PIC24H.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/text.o: glcd/text.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/text.o.d 
	@${RM} ${OBJECTDIR}/glcd/text.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/text.c  -o ${OBJECTDIR}/glcd/text.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/text.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/text.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/text_tiny.o: glcd/text_tiny.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/text_tiny.o.d 
	@${RM} ${OBJECTDIR}/glcd/text_tiny.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/text_tiny.c  -o ${OBJECTDIR}/glcd/text_tiny.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/text_tiny.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/text_tiny.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/unit_tests.o: glcd/unit_tests.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/unit_tests.o.d 
	@${RM} ${OBJECTDIR}/glcd/unit_tests.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/unit_tests.c  -o ${OBJECTDIR}/glcd/unit_tests.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/unit_tests.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/unit_tests.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1046125841/chip8.o: C:/Users/Bryan/MPLABXProjects/Chip8/chip8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1046125841" 
	@${RM} ${OBJECTDIR}/_ext/1046125841/chip8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1046125841/chip8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Users/Bryan/MPLABXProjects/Chip8/chip8.c  -o ${OBJECTDIR}/_ext/1046125841/chip8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1046125841/chip8.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1046125841/chip8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/common.o: common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  common.c  -o ${OBJECTDIR}/common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/common.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/i2c.o: i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/eeprom.o: eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom.o.d 
	@${RM} ${OBJECTDIR}/eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  eeprom.c  -o ${OBJECTDIR}/eeprom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/eeprom.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/eeprom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/chip8mem.o: chip8mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/chip8mem.o.d 
	@${RM} ${OBJECTDIR}/chip8mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  chip8mem.c  -o ${OBJECTDIR}/chip8mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/chip8mem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/chip8mem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/interpreter.o: interpreter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interpreter.o.d 
	@${RM} ${OBJECTDIR}/interpreter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interpreter.c  -o ${OBJECTDIR}/interpreter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/interpreter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/interpreter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/glcd/glcd.o: glcd/glcd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/glcd.o.d 
	@${RM} ${OBJECTDIR}/glcd/glcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/glcd.c  -o ${OBJECTDIR}/glcd/glcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/glcd.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/glcd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/graphics.o: glcd/graphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/graphics.o.d 
	@${RM} ${OBJECTDIR}/glcd/graphics.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/graphics.c  -o ${OBJECTDIR}/glcd/graphics.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/graphics.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/graphics.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/graphs.o: glcd/graphs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/graphs.o.d 
	@${RM} ${OBJECTDIR}/glcd/graphs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/graphs.c  -o ${OBJECTDIR}/glcd/graphs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/graphs.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/graphs.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/PCD8544.o: glcd/PCD8544.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/PCD8544.o.d 
	@${RM} ${OBJECTDIR}/glcd/PCD8544.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/PCD8544.c  -o ${OBJECTDIR}/glcd/PCD8544.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/PCD8544.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/PCD8544.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/PIC24H.o: glcd/PIC24H.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/PIC24H.o.d 
	@${RM} ${OBJECTDIR}/glcd/PIC24H.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/PIC24H.c  -o ${OBJECTDIR}/glcd/PIC24H.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/PIC24H.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/PIC24H.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/text.o: glcd/text.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/text.o.d 
	@${RM} ${OBJECTDIR}/glcd/text.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/text.c  -o ${OBJECTDIR}/glcd/text.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/text.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/text.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/text_tiny.o: glcd/text_tiny.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/text_tiny.o.d 
	@${RM} ${OBJECTDIR}/glcd/text_tiny.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/text_tiny.c  -o ${OBJECTDIR}/glcd/text_tiny.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/text_tiny.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/text_tiny.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/glcd/unit_tests.o: glcd/unit_tests.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/glcd" 
	@${RM} ${OBJECTDIR}/glcd/unit_tests.o.d 
	@${RM} ${OBJECTDIR}/glcd/unit_tests.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  glcd/unit_tests.c  -o ${OBJECTDIR}/glcd/unit_tests.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/glcd/unit_tests.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/glcd/unit_tests.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/main.o: main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1046125841/chip8.o: C:/Users/Bryan/MPLABXProjects/Chip8/chip8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1046125841" 
	@${RM} ${OBJECTDIR}/_ext/1046125841/chip8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1046125841/chip8.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  C:/Users/Bryan/MPLABXProjects/Chip8/chip8.c  -o ${OBJECTDIR}/_ext/1046125841/chip8.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1046125841/chip8.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1046125841/chip8.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/common.o: common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/common.o.d 
	@${RM} ${OBJECTDIR}/common.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  common.c  -o ${OBJECTDIR}/common.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/common.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/common.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/i2c.o: i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/i2c.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/i2c.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/eeprom.o: eeprom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/eeprom.o.d 
	@${RM} ${OBJECTDIR}/eeprom.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  eeprom.c  -o ${OBJECTDIR}/eeprom.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/eeprom.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/eeprom.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/chip8mem.o: chip8mem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/chip8mem.o.d 
	@${RM} ${OBJECTDIR}/chip8mem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  chip8mem.c  -o ${OBJECTDIR}/chip8mem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/chip8mem.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/chip8mem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/interpreter.o: interpreter.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/interpreter.o.d 
	@${RM} ${OBJECTDIR}/interpreter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  interpreter.c  -o ${OBJECTDIR}/interpreter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/interpreter.o.d"        -g -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -O0 -msmart-io=1 -Wall -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/interpreter.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  C:/Program\ Files\ (x86)/Microchip/xc16/v1.26/lib/libc-elf.a C:/Program\ Files\ (x86)/Microchip/xc16/v1.26/lib/libpic30-elf.a  
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    "C:\Program Files (x86)\Microchip\xc16\v1.26\lib\libc-elf.a" "C:\Program Files (x86)\Microchip\xc16\v1.26\lib\libpic30-elf.a"  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  C:/Program\ Files\ (x86)/Microchip/xc16/v1.26/lib/libc-elf.a C:/Program\ Files\ (x86)/Microchip/xc16/v1.26/lib/libpic30-elf.a 
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    "C:\Program Files (x86)\Microchip\xc16\v1.26\lib\libc-elf.a" "C:\Program Files (x86)\Microchip\xc16\v1.26\lib\libpic30-elf.a"  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DDEBUG -legacy-libc  -I"C:/Program Files (x86)/Microchip/xc16/v1.26/include" -I"C:/Program Files (x86)/Microchip/xc16/v1.26/support/generic/h" -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Chip8.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
