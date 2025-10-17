#!/bin/bash

# Query all relevant GPU metrics in a single call (CSV, no header, no units)
IFS=',' read -r GPU_UTIL GPU_TEMP VRAM_USED VRAM_TOTAL < <(
    nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total \
    --format=csv,noheader,nounits
)

# Trim whitespace from values
GPU_UTIL=$(echo "$GPU_UTIL" | xargs)
GPU_TEMP=$(echo "$GPU_TEMP" | xargs)
VRAM_USED=$(echo "$VRAM_USED" | xargs)
VRAM_TOTAL=$(echo "$VRAM_TOTAL" | xargs)

# Calculate VRAM usage percentage
VRAM_PERCENT=$(( VRAM_USED * 100 / VRAM_TOTAL ))

# Choose an icon based on GPU temperature
if [ "$GPU_TEMP" -lt 50 ]; then
    ICON_TEMP=""  # Cool
elif [ "$GPU_TEMP" -lt 70 ]; then
    ICON_TEMP=""  # Moderate
else
    ICON_TEMP=""  # Hot
fi

# Icons
ICON_GPU=""     # GPU usage
ICON_VRAM=""    # VRAM usage
ICON_C=""       # Temperature icon group (already using varying ones above)

# Output formatted JSON in new order: Usage / VRAM / Temp
echo "{\"text\": \"| $GPU_UTIL% $ICON_GPU $VRAM_PERCENT% $ICON_VRAM $GPU_TEMP°C $ICON_TEMP\", \
\"tooltip\": \"GPU Utilization: $GPU_UTIL%\\nVRAM Usage: $VRAM_USED / $VRAM_TOTAL MiB ($VRAM_PERCENT%)\\nGPU Temperature: $GPU_TEMP°C\"}"
