#!/usr/bin/env bash

set -e

ROOT_DIR="$(pwd)"

bash update_submodules.sh

cd osrm-backend

pip install gdown
gdown https://drive.google.com/uc?id=1uBoFWUSRka9pqH2dVPKpcystxXmkkSgs --output ./data
osrm-extract --profile ./profiles/car.lua ./data/diy_solo_semarang.osm.pbf
osrm-partition ./data/diy_solo_semarang.osrm --max-cell-sizes 256,2048,16384,131072,262144 || echo "osrm-partition failed"
osrm-customize ./data/diy_solo_semarang.osrm || echo "osrm-customize failed"
osrm-routed --algorithm mld ./data/diy_solo_semarang.osrm &
OSRM_PID=$!
trap 'kill "$OSRM_PID" 2>/dev/null || true' EXIT
sleep 3

cd "$ROOT_DIR/Navigatorx"

pip install gdown
gdown https://drive.google.com/uc?id=1uBoFWUSRka9pqH2dVPKpcystxXmkkSgs --output ./data

go run eval/crp_alt/gen_rand_queries_coords/main.go

K6_WEB_DASHBOARD=true k6 run -e VUS=1500 -e DURATION=4m eval/osrm/load_tests/k6_sp.js
K6_WEB_DASHBOARD=true k6 run -e VUS=1500 -e DURATION=4m eval/osrm/load_tests/k6_alternatives.js


