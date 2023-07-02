#!/bin/bash

ALIASES_DIR="$(dirname "$0")/mycommands"

# Create or overwrite the ~/.mybash file with combined aliases
> "$HOME/.mybash"  # Clear existing contents of ~/.mybash

# Iterate over files in the ALIASES_DIR and append their content to ~/.mybash
for file in "$ALIASES_DIR"/*; do
    if [[ -f "$file" ]]; then
        cat "$file" >> "$HOME/.mybash"
    fi
done

# Append the sourcing line to ~/.zshrc and ~/.bashrc
echo "source ~/.mybash" >> "$HOME/.zshrc"
echo "source ~/.mybash" >> "$HOME/.bashrc"

