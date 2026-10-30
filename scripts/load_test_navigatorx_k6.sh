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

ulimit -n 65536
echo "-------CRP Query Fastest Path Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200   -e DURATION=4m --out web-dashboard  eval/crp_alt/load_tests/k6_sp.js 
sleep 5 
echo "-------Alternative Routes Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200  -e DURATION=4m --out web-dashboard eval/crp_alt/load_tests/k6_alternatives.js


