CC = gcc
CFLAGS = -Wall -Wextra -O2 -Iinclude
LDFLAGS = -lm

SRC = src/main.c src/player.c src/director.c src/item.c src/game.c src/map.c src/render_host.c
OBJ = $(SRC:.c=.o)
TARGET = bin/game_host

all: host

host: $(TARGET)

$(TARGET): $(OBJ)
	mkdir -p bin
	$(CC) $(OBJ) -o $(TARGET) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f src/*.o $(TARGET)
	rm -rf bin build

.PHONY: all host clean
