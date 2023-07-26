#!/bin/bash

ALIASES_DIR="$(dirname "$0")/mycommands"
MYBASH_FILE="$HOME/.mybash"
ZSHRC_FILE="$HOME/.zshrc"
BASHRC_FILE="$HOME/.bashrc"

OS=$(uname -s)

# Remove the sourcing line from ~/.zshrc and ~/.bashrc based on the OS
if [ "$OS" = "Darwin" ]; then
    sed -i '' '/source ~\/.mybash/d' "$ZSHRC_FILE"
    sed -i '' '/source ~\/.mybash/d' "$BASHRC_FILE"
elif [ "$OS" = "Linux" ]; then
    sed -i '/source ~\/.mybash/d' "$ZSHRC_FILE"
    sed -i '/source ~\/.mybash/d' "$BASHRC_FILE"
else
    echo "Unsupported operating system: $OS"
    exit 1
fi


# Remove the contents of ~/.mybash
> "$MYBASH_FILE"