#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: $0 <numero_da_lista> (ex: 01)"
  exit 1
fi

LISTA_DIR="A1/lista$1"

mkdir -p "$LISTA_DIR/build"

cat > "$LISTA_DIR/Makefile" << 'EOF'
TARGET=01
BUILD_DIR=build

all:
	mkdir -p $(BUILD_DIR)
	riscv64-linux-gnu-as -o $(BUILD_DIR)/$(TARGET).o $(TARGET).s
	riscv64-linux-gnu-ld -o $(BUILD_DIR)/$(TARGET) $(BUILD_DIR)/$(TARGET).o

run: all
	qemu-riscv64 ./$(BUILD_DIR)/$(TARGET)

clean:
	rm -rf $(BUILD_DIR)
EOF

echo "Estrutura criada em: $LISTA_DIR"
