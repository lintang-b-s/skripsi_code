#!/bin/bash
set -e
cd Navigatorx
ulimit -n 65536
./bin/engine --region=jateng_jabar &
ENGINE_PID=$!
trap "kill $ENGINE_PID" EXIT
echo "waiting the server to initialize..."
# nunggu initialize routing engine
sleep 15

MAX_QUERIES=0  wrk -t4 -c200 -d4m --latency -s eval/crp_alt/load_tests/wrk_sp.lua http://localhost:6060
MAX_QUERIES=0  wrk -t4 -c200 -d4m --latency -s eval/crp_alt/load_tests/wrk_alternatives.lua http://localhost:6060


