#!/bin/bash
# hasil saat ini

set -e

pip install gdown
# hasil saat ini untuk map CAL (California https://www.diag.uniroma1.it/~challenge9/download.shtml) 
# untuk p2p query (implementasi Cusotmizable Route Planning (CRP) Query pada Navigatorx) dari 50 sources ke all other vertices 
gdown https://drive.google.com/uc?id=10gsLu7J7EiT1C1s831UOkFGTC9ukh6lR --output ./results 
gdown https://drive.google.com/uc?id=100LjlJ1imz7hYJbP6hMO5ZvO79FTgNzz --output ./results 



# list of map names to check (manual entry)
MAP_NAMES=("CAL")

ROOT_DIR=$(pwd)
RESULTS_DIR="$ROOT_DIR/results"
DIMACS_DIR="$ROOT_DIR/dimacs-ch9-1.1"
INPUT_DIR="$DIMACS_DIR/inputs/USA-road-t"
SOLVER_DIR="$DIMACS_DIR/solvers/mlb-dimacs"

for MAP_NAME in "${MAP_NAMES[@]}"; do
    GR_FILE="$INPUT_DIR/USA-road-t.$MAP_NAME.gr"
    SS_FILE="$RESULTS_DIR/USA-road-t.$MAP_NAME.ss"
    CHK_FILE="$RESULTS_DIR/DIMACS_9_USA_$MAP_NAME.ss.chk"
    RES_FILE="my_results.ss.res"

    echo "=== Running Benchmark Solver for $MAP_NAME ==="
    
    if [ ! -f "$GR_FILE" ]; then
        echo "Error: Graph file $GR_FILE not found. Skipping $MAP_NAME."
        continue
    fi

    if [ ! -f "$SS_FILE" ]; then
        echo "Error: Query file $SS_FILE not found. Skipping $MAP_NAME."
        continue
    fi

    # Use relative paths to stay under the 100-character buffer limit in sqC.exe
    REL_GR_FILE="../../inputs/USA-road-t/USA-road-t.$MAP_NAME.gr"
    REL_SS_FILE="../../../results/USA-road-t.$MAP_NAME.ss"
    
    cd "$SOLVER_DIR"
    rm -f "$RES_FILE"
    
    echo "--- Running Benchmark Solver ---"
    ./sqC.exe "$REL_GR_FILE" "$REL_SS_FILE" "$RES_FILE"

    echo "--- Comparing Checksums for $MAP_NAME ---"
    cd "$ROOT_DIR"
    python3 scripts/compare_checksums.py "$SS_FILE" "$SOLVER_DIR/$RES_FILE" "$CHK_FILE"
    echo ""
done

echo "Dimacs 9th shortest path correctness test completed...."

echo "Running other shortest path correctness test using programming contest problems......"
cd ./Navigatorx/tests/shortestpath_crp_alt && go test -run TestCRPQueryDelftDistance  -v -timeout=0  -count=1
go test -run TestCRPQueryGalaxyQuest  -v -timeout=0  -count=1
go test -run TestCRPQueryShoppingMalls  -v -timeout=0  -count=1
go test -run TestShowroom  -v -timeout=0  -count=1
go test -run TestCRPQuerySimpleGraph -v -timeout=0  -count=1


echo "Running other shortest path correctness test by comparing the result (with no turn costs) with the result of plain dijkstra algorithm"
cd "$ROOT_DIR"
cd ./Navigatorx/eval/gen_rand_queries_coords && go run main.go
cd ../stress_tests &&  go run main.go

cd "$ROOT_DIR"
# cd ./Navigatorx/tests/shortestpath_crp_alt && go test -run TestOSN2024KRL  -v -timeout=0  -count=1 

echo "completed shortest path correctness test......."

