BOARDCPPSRC =  $(BOARD_DIR)/board_configuration.cpp \
    $(BOARD_DIR)/firmware/pinouts.cpp \
    $(BOARD_DIR)/default_tune.cpp \


BOARDINC += $(BOARD_DIR)/generated/controllers/generated

# defines SHORT_BOARD_NAME
include $(BOARD_DIR)/meta-info.env

# reduce memory usage monitoring
DDEFS += -DRAM_UNUSED_SIZE=100

# increase Lua Heap
DDEFS += -DLUA_USER_HEAP=35000

# assign critical LED to a non-existent pin
DDEFS += -DLED_CRITICAL_ERROR_BRAIN_PIN=Gpio::I15

# TS on usart 1
# Hardware serial port on UART 2 -> PD5/PD6
DDEFS += -DSTM32_UART_USE_USART2=TRUE
DDEFS += -DTS_PRIMARY_UxART_PORT=UARTD2
DDEFS += -DEFI_CONSOLE_TX_BRAIN_PIN=Gpio::D5 -DEFI_CONSOLE_RX_BRAIN_PIN=Gpio::D6
