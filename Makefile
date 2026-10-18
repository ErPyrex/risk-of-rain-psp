CC = gcc
CFLAGS = -Wall -O2 -Iinclude

SRC = src/main.c
OBJ = $(SRC:.c=.o)
TARGET = bin/game_host

all: host

host: $(TARGET)

$(TARGET): $(OBJ)
	mkdir -p bin
	$(CC) $(OBJ) -o $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)
	rm -rf bin build

.PHONY: all host clean
