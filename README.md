# skripsi_code

## Correctness test

### Dimacs 9th Implementation Challenge: Shortest Path

https://www.diag.uniroma1.it/~challenge9/
map data: https://www.diag.uniroma1.it/~challenge9/download.shtml


```
sh scripts/automate_dimacs_test.sh -m <MAP_NAME> -n <NUMBER_OF_SOURCES>
```

#### Example
map CAL (california) ~1.8jt vertices.
ini cek correctness dari implementasi Customizable Route Planning [1] Query Phase yang ada di Navigatorx.
bandingin output dari sssp solver nya DIMACS 9th (1 source ke all other vertices): ./dimacs-ch9-1.1/solvers/mlb-dimacs/sqC.exe
dengan p2p CRP Query nya Navigatorx (~1.8 jt query) sekitar 10 menit
note that Customizable Ruote Planning (CRP) [1] hanya mempercepat point-to-point (p2p) shortest path query....
```
sh scripts/automate_dimacs_test.sh -m CAL -n 1
```

#### Hasil Saat ini
map CAL (california) ~1.8jt vertices.
ini cek correctness dari implementasi Customizable Route Planning [1] Query Phase yang ada di Navigatorx.
bandingin output dari sssp solver nya DIMACS 9th (dari 50 sources ke all other vertices): ./dimacs-ch9-1.1/solvers/mlb-dimacs/sqC.exe
dengan p2p CRP [1] Query nya Navigatorx (~97 jt query) yang sudah saya jalankan..
dan bandingin output test cases programming contest problems
```
sh ./scripts/current_results.sh
```

## Referensi & Acknowledgements
```
1. Delling, D. et al. (2015) “Customizable Route Planning in Road
Networks,” Transportation Science [Preprint]. Available at:
https://doi.org/10.1287/trsc.2014.0579.
```





