#!/bin/bash
set -euo pipefail

while true; do
    echo >&2 "Watchdog: Restarting program."
    # Programm ausführen, Fehler ignorieren:
    "$@" || true
    sleep 1
done
