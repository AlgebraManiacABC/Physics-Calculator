TARGET=calc
CC=gcc

LIB_DIR=lib
SRC_DIR=src
OBJ_DIR=build

IFLAGS=-I"$(LIB_DIR)"
LFLAGS=-lm

CFLAGS=-Wall -Werror -Wno-unused -std=c17 $(IFLAGS) $(LFLAGS)

LIBS=$(wildcard $(LIB_DIR)/*.h)
SRCS=$(wildcard $(SRC_DIR)/*.c)
OBJ_A=$(SRCS:%.c=%.o)
OBJS=$(OBJ_A:$(SRC_DIR)%=$(OBJ_DIR)%)

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(LIBS) | $(OBJ_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

.PHONY: clean run

clean:
	$(RM) -r $(OBJ_DIR)
	$(RM) $(TARGET)

run: $(TARGET)
	@echo ""
	./$(TARGET)
	@echo ""