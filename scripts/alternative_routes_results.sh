#!/bin/bash
# hasil saat ini
set -e
sh ./update_submodules.sh

cd Navigatorx
cd eval/crp_alt && go run alternative_routes/main.go && cd ../..

