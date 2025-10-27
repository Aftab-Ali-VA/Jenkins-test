# Compiler
CC = gcc

# Source files
SRC = src/main.c

# Output binary
TARGET = build/hello

# Build target
all: $(TARGET)

$(TARGET): $(SRC)
	@mkdir -p build
	$(CC) $(SRC) -o $(TARGET)

# Clean target
clean:
	rm -rf build
