#!/bin/bash

# Target directory
TARGET_DIR="$HOME/.klayout/libraries"

# Create directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR does not exist. Creating..."
    mkdir -p "$TARGET_DIR"
else
    echo "Directory $TARGET_DIR already exists."
fi

# Copy files
cp -f layout_AH_neuron/AH_neuron.gds "$TARGET_DIR/"
cp -f layout_LIF_ring/LIF.gds "$TARGET_DIR/"
cp -f layout_synapse/synapse.gds "$TARGET_DIR/"
cp -f layout_TG_bootstraped/TG_bootstrapped.gds "$TARGET_DIR/"
cp -f Dry_run_gds/M13_SpikCore.gds "$TARGET_DIR/"

echo "Files copied successfully to $TARGET_DIR"
