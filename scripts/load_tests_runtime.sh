#!/bin/bash
# hasil saat ini
set -e
sh ./update_submodules.sh

cd Navigatorx
sh scripts/build_pgo.sh
pip install gdown
gdown https://drive.google.com/uc?id=1uBoFWUSRka9pqH2dVPKpcystxXmkkSgs --output ./data
export GOFLAGS="-buildvcs=false"

go build -o ./bin/preprocessor ./cmd/preprocessor
./bin/preprocessor

go build -o ./bin/customizer ./cmd/customizer
./bin/customizer

go build -o ./bin/generator ./cmd/generator
./bin/generator

go run ./eval/crp_alt/gen_rand_queries_coords/main.go
go run ./eval/crp_alt/gen_rand_queries/main.go

go build -o ./bin/engine -pgo=auto  ./cmd/engine
./bin/engine &
ENGINE_PID=$!
trap "kill $ENGINE_PID" EXIT

echo "waiting the server to initialize..."
# nunggu initialize routing engine
sleep 15


echo "-------CRP Query Runtime--------"
go run ./eval/crp_alt/random_queries_crp_alt/main.go
echo "-------CRP Query Load Tests-------"
k6 run -e VUS=1500 -e DURATION=4m --out web-dashboard  eval/crp_alt/load_tests/k6_sp.js &

sleep 300
echo "-------Alternative Routes Load Tests-------"
k6 run -e VUS=1000 -e DURATION=4m --out web-dashboard eval/crp_alt/load_tests/k6_alternatives.js
