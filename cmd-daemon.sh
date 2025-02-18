#!/bin/bash

set -euo pipefail

##############################################################
# Liest zeilenweise aus $FIFO Kommandos
# und führt sie mittels bash aus.
#
# Franz-Josef Färber 2025
##############################################################

# https://man7.org/linux/man-pages/man7/fifo.7.html
FIFO="/opt/plcnext/cmd-daemon"
if [[ ! -p "$FIFO" ]]; then
    mkfifo "$FIFO"
fi


while true; do
    # "Normally, opening the FIFO blocks until the other end is opened also."
    # D. h. hier blockiert die Ausführung solange,
    # bis ein Produzent das andere Ende des FIFOs öffnet und schreibt.

    while IFS='' read -r line; do
        eval $line || true
    done < "$FIFO"

    sleep 0.1
done
