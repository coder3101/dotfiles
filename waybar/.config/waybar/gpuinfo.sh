#!/bin/bash

# Get GPU utilization and temperature
GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)
GPU_TEMP=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits)

# Choose an icon based on GPU temperature
if [ "$GPU_TEMP" -lt 50 ]; then
    ICON=""  # Cool
elif [ "$GPU_TEMP" -lt 70 ]; then
    ICON=""  # Moderate
else
    ICON=""  # Hot
fi

# Output JSON for status bar or widget
echo "{\"text\": \"$GPU_UTIL%  $GPU_TEMP°C $ICON\", \"tooltip\": \"GPU Utilization: $GPU_UTIL%\\nGPU Temperature: $GPU_TEMP°C\"}"

