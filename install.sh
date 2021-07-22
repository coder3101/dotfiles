#! /bin/bash

for f in *; do
    if [ -d "$f" ]; then
        echo "Stowing $f..."
        stow $f
    fi
done
