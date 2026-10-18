#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
DATA_WIN="$ROOT_DIR/original/data.win"
OUTPUT_DIR="$ROOT_DIR/extracted"
UTMT_CLI="$SCRIPT_DIR/utmt/UndertaleModCli"

if [ ! -f "$DATA_WIN" ]; then
    echo "Error: $DATA_WIN no encontrado."
    exit 1
fi

echo "=== Extrayendo assets y codigo de $DATA_WIN ==="
mkdir -p "$OUTPUT_DIR/code"

"$UTMT_CLI" dump "$DATA_WIN" -c UMT_DUMP_ALL -o "$OUTPUT_DIR/code" -v
"$UTMT_CLI" dump "$DATA_WIN" -s -t --sprites -o "$OUTPUT_DIR" -v

echo "=== Extracción completa en $OUTPUT_DIR ==="
