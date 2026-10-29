#!/usr/bin/env bash
# please run load_tests_osrm.sh (MLD preprocessing pipeline) first before running this script. 
set -e
ROOT_DIR="$(pwd)"
cd osrm-backend
ulimit -n 65536
osrm-routed --algorithm mld --mmap=off ./data/jateng_jabar.osrm &
OSRM_PID=$!
trap 'kill "$OSRM_PID" 2>/dev/null || true' EXIT
sleep 3

MAX_QUERIES=0  wrk -t4 -c200 -d4m --latency -s ../Navigatorx/eval/osrm/load_tests/wrk_sp.lua http://localhost:5000
MAX_QUERIES=0  wrk -t4 -c200 -d4m --latency -s ../Navigatorx/eval/osrm/load_tests/wrk_alternatives.lua http://localhost:5000

