#!/usr/bin/env bash

set -e
ROOT_DIR="$(pwd)"
bash update_submodules.sh
cd osrm-backend
git checkout c3dc148 
ulimit -n 65536

# ---- osrm preprocessing ----
pip install gdown
gdown https://drive.google.com/uc?id=1tisOgMVXeh7x1WhFvOnZJ-TVHfH7aQ4y --output ./data
osrm-extract --profile ./profiles/car.lua ./data/jateng_jabar.osm.pbf
osrm-partition ./data/jateng_jabar.osrm --max-cell-sizes 256,2048,16384,131072,262144 || echo "osrm-partition failed"
osrm-customize ./data/jateng_jabar.osrm || echo "osrm-customize failed"

# --- generate random query coordinates ----
cd "$ROOT_DIR/Navigatorx"
cp ../osrm-backend/data/jateng_jabar.osm.pbf ./data/
go run eval/crp_alt/gen_rand_queries_coords/main.go --region=jateng_jabar



