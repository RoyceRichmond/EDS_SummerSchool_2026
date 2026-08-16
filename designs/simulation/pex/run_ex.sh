#!/usr/bin/env bash
#
# Run parasitic extraction (PEX) with Magic
#

#-------------------------------------------
# Set defaults for PDK
#-------------------------------------------
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=gf180mcuD} > /dev/null

#-------------------------------------------
# Check arguments
#-------------------------------------------
if [ $# -lt 1 ]; then
    echo "Usage: $0 <folder>"
    exit 1
fi

CIRCUIT_DIR="$1"
CIRCUIT_DIR="${CIRCUIT_DIR%/}"   # remove trailing slash if any
CIRCUIT_NAME=$(basename "$CIRCUIT_DIR")

echo "PDK_ROOT is $PDK_ROOT"
echo "PDK is $PDK"
echo "Detected circuit: $CIRCUIT_NAME"

#-------------------------------------------
# Run Magic for extraction
#-------------------------------------------
magic -rcfile $PDK_ROOT/$PDK/libs.tech/magic/$PDK.magicrc -dnull -noconsole << EOF
gds read ${CIRCUIT_DIR}/${CIRCUIT_NAME}.gds
load ${CIRCUIT_NAME}
select top cell
expand
flatten ${CIRCUIT_NAME}_flat
load ${CIRCUIT_NAME}_flat
select top cell
cellname delete ${CIRCUIT_NAME}
cellname rename ${CIRCUIT_NAME}_flat ${CIRCUIT_NAME}
extract path ${CIRCUIT_DIR}/extfiles
extract all
ext2sim labels on
ext2sim -p ${CIRCUIT_DIR}/extfiles
extresist tolerance 10
extresist
ext2spice lvs
ext2spice cthresh 0
ext2spice rthresh 0
ext2spice extresist on
ext2spice -p ${CIRCUIT_DIR}/extfiles -o ${CIRCUIT_DIR}/${CIRCUIT_NAME}_pex.spice
quit -noprompt
EOF

echo "PEX extraction complete: ${CIRCUIT_DIR}/${CIRCUIT_NAME}_pex.spice"
