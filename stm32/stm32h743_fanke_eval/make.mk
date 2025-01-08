
BSP_LIBCONFIG_STM32_LLDRV  := y
BSP_LIBCONFIG_STM32_SERIES := BSP_STM32_H7

BSP_LIBCONFIG_STM32_HAL_FLASH := y
BSP_LIBCONFIG_STM32_HAL_IWDG  := y
BSP_LIBCONFIG_STM32_HAL_RTC   := y
BSP_LIBCONFIG_STM32_HAL_I2C   := y
BSP_LIBCONFIG_STM32_HAL_USART := y
BSP_LIBCONFIG_STM32_HAL_SPI   := y
BSP_LIBCONFIG_STM32_HAL_BASTIM:= y

include ${BSP_ABSROOTDIR}/stm32/libs/bsp_libs_stm32.mk

BOARD_CDEFS := STM32H743xx
BOARD_CDEFS += USE_HAL_DRIVER

BOARD_CSRCS += board_irq.c
BOARD_CSRCS += board_rcc_init.c
BOARD_CSRCS += board_usb.c
BOARD_CSRCS += board_init.c
BOARD_CSRCS += board_bsp.c

BOARD_ASMSOURCES += fankeh7_startup_gcc.s
BOARD_LNK_FILE   += fankeh7_lnk_gcc.ld

TMPBOARD_CSRCS = ${addprefix ${BSP_ROOT}/stm32/stm32h743_fanke_eval/,${BOARD_CSRCS}}
TMPBOARD_ASMSOURCES = ${addprefix ${BSP_ROOT}/stm32/stm32h743_fanke_eval/,${BOARD_ASMSOURCES}}
TMPBOARD_LNK_FILE = ${addprefix ${BSP_ROOT}/stm32/stm32h743_fanke_eval/,${BOARD_LNK_FILE}}

BSP_BOARD_ENTRY_POINT :=  Reset_Handler

BSP_CDEFS += ${BOARD_CDEFS}

BSP_CSRCS += ${TMPBOARD_CSRCS} ${LIB_CSRCS}

BSP_CINCDIRS += ${BSP_ROOT}/stm32/stm32h743_fanke_eval ${LIB_CINCDIRS}

BSP_ASMSOURCES := ${TMPBOARD_ASMSOURCES}

BSP_LNK_FILE := ${TMPBOARD_LNK_FILE}
