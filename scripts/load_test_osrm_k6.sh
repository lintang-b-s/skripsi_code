#!/usr/bin/env bash
set -e
ROOT_DIR="$(pwd)"
cd osrm-backend
ulimit -n 65536

# --- run osrm server ----
osrm-routed --algorithm mld --mmap=off ./data/jateng_jabar.osrm &
OSRM_PID=$!
trap 'kill "$OSRM_PID" 2>/dev/null || true' EXIT
sleep 3

# --- load test --- 
cd "$ROOT_DIR/Navigatorx"
echo "------- OSRM Fastest Path Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200  -e DURATION=4m --out web-dashboard  eval/osrm/load_tests/k6_sp.js 
sleep 5
echo "------- Alternative Routes Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200 -e DURATION=4m --out web-dashboard  eval/osrm/load_tests/k6_alternatives.js 


