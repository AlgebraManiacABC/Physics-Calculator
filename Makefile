TARGET=calc

LIB_DIR=lib
SRC_DIR=src
BUILD_DIR=build

IFLAGS=-I"$(LIB_DIR)"
LFLAGS=-lm

CFLAGS=-Wall -Werror -Wno-unused -std=c17 $(IFLAGS) $(LFLAGS)

OBJS=$(patsubst %.c,%.o,$(wildcard $(SRC_DIR)/*.c))

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

.PHONY: clean run

clean:
	$(RM) $(BUILD_DIR)
	$(RM) $(TARGET)

run: $(TARGET)
	@echo ""
	./$(TARGET)
	@echo ""