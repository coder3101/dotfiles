#! /bin/bash

for f in *; do
    if [ -d "$f" ]; then
        echo "Unstowing $f..."
        stow -D $f
    fi
done
