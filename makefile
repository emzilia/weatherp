# mountain blade
CC = gcc
CC_FLAGS = -lncurses

SRC_DIR = src
BIN_DIR = bin
BUILD_DIR = build
INSTALL_DIR = ~/.local/bin

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst %.c,$(BUILD_DIR)/%.o,$(notdir $(SRCS)))
TARGET = $(BIN_DIR)/mbg

all: $(TARGET)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CC_FLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CC_FLAGS) $^ -o $@

install:
	cp $(TARGET) $(INSTALL_DIR)

clean:
	rm -rf $(BIN_DIR) $(BUILD_DIR)

.PHONY: all install clean
