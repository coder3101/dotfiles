#! /bin/bash
# To manually install configuration for neovim, run stow nvim
for f in *; do
    if [ -d "$f" ]; then
        echo "Stowing $f..."
        stow $f
    fi
done
