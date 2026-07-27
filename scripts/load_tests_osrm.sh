#!/usr/bin/env bash

set -e

ROOT_DIR="$(pwd)"

bash update_submodules.sh

cd osrm-backend

git checkout c3dc148 

ulimit -n 65536

pip install gdown
gdown https://drive.google.com/uc?id=1tisOgMVXeh7x1WhFvOnZJ-TVHfH7aQ4y --output ./data
osrm-extract --profile ./profiles/car.lua ./data/jateng_jabar.osm.pbf
osrm-partition ./data/jateng_jabar.osrm --max-cell-sizes 256,2048,16384,131072,262144 || echo "osrm-partition failed"
osrm-customize ./data/jateng_jabar.osrm || echo "osrm-customize failed"
osrm-routed --algorithm mld ./data/jateng_jabar.osrm &
OSRM_PID=$!
trap 'kill "$OSRM_PID" 2>/dev/null || true' EXIT
sleep 3

cd "$ROOT_DIR/Navigatorx"

pip install gdown
gdown https://drive.google.com/uc?id=1tisOgMVXeh7x1WhFvOnZJ-TVHfH7aQ4y --output ./data

go run eval/crp_alt/gen_rand_queries_coords/main.go

echo "------- OSRM Fastest Path Load Tests-------"

k6 run -e RPS=2000 -e MAXVUS=200  -e DURATION=4m --out web-dashboard  eval/osrm/load_tests/k6_sp.js & 

sleep 320

echo "------- Alternative Routes Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200 -e DURATION=4m --out web-dashboard  eval/osrm/load_tests/k6_alternatives.js &


sleep 320
echo "------- OSRM Alternative Routes Load Success Rate-------"
go run  eval/osrm/alternative_routes/main.go



