#!/bin/bash
# hasil saat ini
set -e
sh ./update_submodules.sh

cd Navigatorx

# --- download map data ---
pip install gdown
gdown https://drive.google.com/uc?id=1HBswl5-JkFXWh--AFLC2ElYC4Tbsj1i0 --output ./data
sh scripts/build_pgo.sh
gdown https://drive.google.com/uc?id=1tisOgMVXeh7x1WhFvOnZJ-TVHfH7aQ4y --output ./data
export GOFLAGS="-buildvcs=false"
ulimit -n 65536

# --- preprocesssing ----
go build -o ./bin/preprocessor ./cmd/preprocessor
./bin/preprocessor  --osm_file=./data/jateng_jabar.osm.pbf --region=jateng_jabar  --us=8,12,14,16,20 
go build -o ./bin/customizer ./cmd/customizer
./bin/customizer  --region=jateng_jabar
go run ./eval/crp_alt/gen_rand_queries_coords/main.go  --region=jateng_jabar
go run ./eval/crp_alt/gen_rand_queries/main.go  --region=jateng_jabar
go build -o ./bin/engine -pgo=./bin/default.pgo   ./cmd/engine




