#!/bin/bash
# hasil saat ini
set -e
sh ./update_submodules.sh

cd Navigatorx
gdown https://drive.google.com/uc?id=1HBswl5-JkFXWh--AFLC2ElYC4Tbsj1i0 --output ./data
sh scripts/build_pgo.sh
pip install gdown
gdown https://drive.google.com/uc?id=1tisOgMVXeh7x1WhFvOnZJ-TVHfH7aQ4y --output ./data
export GOFLAGS="-buildvcs=false"

ulimit -n 65536

go build -o ./bin/preprocessor ./cmd/preprocessor
./bin/preprocessor  --osm_file=./data/jateng_jabar.osm.pbf --mlp_file=./data/jateng_jabar.mlp --region=jateng_jabar  --us=8,11,14,17,18

go build -o ./bin/customizer ./cmd/customizer
./bin/customizer  --region=jateng_jabar

# go build -o ./bin/generator ./cmd/generator
# ./bin/generator --region=jateng_jabar

go run ./eval/crp_alt/gen_rand_queries_coords/main.go  --region=jateng_jabar
go run ./eval/crp_alt/gen_rand_queries/main.go  --region=jateng_jabar

go build -o ./bin/engine -pgo=auto  ./cmd/engine
./bin/engine --region=jateng_jabar &
ENGINE_PID=$!
trap "kill $ENGINE_PID" EXIT

echo "waiting the server to initialize..."
# nunggu initialize routing engine
sleep 15


echo "-------CRP Query Runtime--------"
go run ./eval/crp_alt/random_queries_crp_alt/main.go

echo "-------CRP Query Fastest Path Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200   -e DURATION=4m --out web-dashboard  eval/crp_alt/load_tests/k6_sp.js &

sleep 310
echo "-------Alternative Routes Load Tests-------"
k6 run -e RPS=2000 -e MAXVUS=200  -e DURATION=4m --out web-dashboard eval/crp_alt/load_tests/k6_alternatives.js





