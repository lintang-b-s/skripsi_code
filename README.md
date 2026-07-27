# skripsi_code

## Correctness test

### Dimacs 9th Implementation Challenge: Shortest Path

https://www.diag.uniroma1.it/~challenge9/ \
map data: https://www.diag.uniroma1.it/~challenge9/download.shtml \
file format: https://www.diag.uniroma1.it/~challenge9/format.shtml#ss.chk \
dimacs scripts untuk correctnes/performance test (sudah saya clone di ./dimacs-ch9-1.1): https://www.diag.uniroma1.it/~challenge9/code/ch9-1.1.tar.gz

```
sh scripts/automate_dimacs_test.sh -m <MAP_NAME> -n <NUMBER_OF_SOURCES>
```

#### Example

map CAL (california) ~1.8jt vertices.\
ini cek correctness dari implementasi Customizable Route Planning [[1]](#ref1) Query Phase yang ada di Navigatorx.\
bandingin output dari sssp solver nya DIMACS 9th (1 source ke all other vertices): ./dimacs-ch9-1.1/solvers/mlb-dimacs/sqC.exe \
dengan p2p CRP Query nya Navigatorx (~1.8 jt query) sekitar 10 menit \
note that Customizable Ruote Planning (CRP) [[1]](#ref1) hanya mempercepat point-to-point (p2p) shortest path query....

```
sh scripts/automate_dimacs_test.sh -m CAL -n 1
```

#### Hasil Saat ini

##### Correctness Test dari Implementasi Customizable Route Planning (CRP) [[1]](#ref1)

map CAL (california) ~1.8jt vertices. \
ini cek correctness dari implementasi Customizable Route Planning [[1]](#ref1) Query Phase yang ada di Navigatorx (https://github.com/lintang-b-s/Navigatorx/blob/main/pkg/engine/routing/multilevel_astar_landmarks_without_turn_cost.go). \
bandingin output dari sssp solver nya DIMACS 9th (dari 50 sources ke all other vertices): ./dimacs-ch9-1.1/solvers/mlb-dimacs/sqC.exe . \
dengan p2p CRP [[1]](#ref1) Query nya Navigatorx (~97 jt query) yang sudah saya jalankan.. ( https://drive.google.com/uc?id=10gsLu7J7EiT1C1s831UOkFGTC9ukh6lR dan https://drive.google.com/uc?id=100LjlJ1imz7hYJbP6hMO5ZvO79FTgNzz )
dan bandingin output test cases programming contest problems:

script:
prequisite: install golang: https://go.dev/doc/install

```
sh ./scripts/current_results.sh
```

```
c ---------------------------------------------------
c SQ/SQP DIMACS Challenge version
c ---------------------------------------------------
p res ss sq
c
c Nodes:                  1890815       Arcs:                4657742
c MinArcLen:                    1       MaxArcLen:            538385
c Trials:                      50
--- Comparing Checksums for CAL ---
Comparing /home/lintangbs/Documents/kuliah/skripsi/progress/routing_engine/skripsi_code/dimacs-ch9-1.1/solvers/mlb-dimacs/my_results.ss.res and /home/lintangbs/Documents/kuliah/skripsi/progress/routing_engine/skripsi_code/results/DIMACS_9_USA_CAL.ss.chk using sources from /home/lintangbs/Documents/kuliah/skripsi/progress/routing_engine/skripsi_code/results/USA-road-t.CAL.ss
Source 1361141: OK (11766657599962)
Source 1715429: OK (11121440503511)
Source 240158: OK (9578320934328)
Source 1685029: OK (18185369227534)
Source 200066: OK (8835712846586)
Source 927239: OK (14052023445527)
Source 1363452: OK (10052857133301)
Source 15524: OK (15829978373469)
Source 86528: OK (9674415650193)
Source 1719616: OK (9401177473651)
Source 679753: OK (12324809752366)
Source 1137778: OK (10484326879112)
Source 314092: OK (9113230527411)
Source 1683406: OK (13557449398391)
Source 1539150: OK (10227425861993)
Source 1173458: OK (14293960446000)
Source 19762: OK (16127989877010)
Source 1498490: OK (9666997842218)
Source 77015: OK (9847023555058)
Source 1673641: OK (16338330469412)
Source 1642510: OK (10340164639805)
Source 242926: OK (9451845853962)
Source 975553: OK (16614877353798)
Source 1336735: OK (10598591098947)
Source 168432: OK (9397378648041)
Source 307463: OK (9033639925849)
Source 1043302: OK (18666140661681)
Source 673933: OK (11796690398375)
Source 489363: OK (10723698509795)
Source 1309633: OK (9080393693687)
Source 883806: OK (9882395880794)
Source 242509: OK (9403673118314)
Source 1457797: OK (9856825628526)
Source 1731479: OK (12319459031225)
Source 1890768: OK (20385073060787)
Source 66066: OK (10714562126641)
Source 1063190: OK (16461830432893)
Source 1061195: OK (15569103820000)
Source 1144970: OK (9149247376098)
Source 1594073: OK (11254687965925)
Source 1428775: OK (10618444804736)
Source 1646308: OK (9830492754006)
Source 1439637: OK (11140041010011)
Source 242990: OK (9417693405932)
Source 1338535: OK (14050660178303)
Source 345926: OK (9135920849031)
Source 322516: OK (9057861566112)
Source 1457572: OK (10565023057781)
Source 947015: OK (13041013877600)
Source 1434747: OK (13537578283381)

SUCCESS: All checksums match!

Dimacs 9th shortest path correctness test completed....

   delftdistance_test.go:249: calculating shortest path...
    delftdistance_test.go:283: solved test case: ../shortestpath/data/tests/shortestpath/icpc_nwerc2022_delftdistance/secret/72-moon2
--- PASS: TestCRPQueryDelftDistanceMALT (46.04s)
    --- PASS: TestCRPQueryDelftDistanceMALT/sample/1 (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/sample/2 (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/01-small-X (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/02-small-O (0.00s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/03-small (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/04-small (0.00s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/05-small (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/06-row (0.00s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/07-col (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/08-medium (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/09-medium (0.05s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/10-medium (0.35s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/12-large-few-o (3.91s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/13-large-few-o (11.09s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/17-large-many-o (3.82s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/20-tall (0.31s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/21-tall (0.38s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/22-tall (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/23-tall (0.10s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/24-wide (0.09s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/25-wide (0.07s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/26-wide (0.30s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/27-wide (0.41s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/39-diag (17.22s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/46-diag-400 (7.62s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/54-manual (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/55-manual (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/56-manual (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/57-manual (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/58-manual (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/59-manual (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/65-corner1 (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/66-corner2 (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/67-sidel (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/68-sider (0.02s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/69-sideu (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/70-sided (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/71-moon1 (0.01s)
    --- PASS: TestCRPQueryDelftDistanceMALT/secret/72-moon2 (0.01s)
PASS

 galaxyquest2_test.go:235: calculating shortest paths from planet 1 to other planets.....
    galaxyquest2_test.go:321: solved test case: ../shortestpath/data/tests/shortestpath/icpc_nwerc2023_galaxyquest/secret/48-random-small-coords
--- PASS: TestCRPQueryGalaxyQuestMALT (6.70s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/sample/1 (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/sample/2 (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/01-cancellation (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/02-min (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/26-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/27-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/28-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/29-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/30-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/31-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/32-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/33-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/34-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/35-random-small (0.00s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/41-random (4.88s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/43-random (1.14s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/46-random-small-coords (0.36s)
    --- PASS: TestCRPQueryGalaxyQuestMALT/secret/48-random-small-coords (0.28s)
PASS
ok      github.com/lintang-b-s/Navigatorx/tests/shortestpath_crp_alt    6.961s


--- PASS: TestCRPQueryShoppingMallsMALT (0.48s)
    --- PASS: TestCRPQueryShoppingMallsMALT/secret/1 (0.00s)
    --- PASS: TestCRPQueryShoppingMallsMALT/secret/2 (0.07s)
    --- PASS: TestCRPQueryShoppingMallsMALT/secret/3 (0.08s)
    --- PASS: TestCRPQueryShoppingMallsMALT/secret/4 (0.14s)
    --- PASS: TestCRPQueryShoppingMallsMALT/secret/5 (0.11s)
    --- PASS: TestCRPQueryShoppingMallsMALT/secret/6 (0.07s)
PASS
ok      github.com/lintang-b-s/Navigatorx/tests/shortestpath_crp_alt    0.791s

    showroom_test.go:249: solved test case: ../shortestpath/data/tests/shortestpath/ukiepc2016_showroom/sample/2
--- PASS: TestShowroomMALT (135.77s)
    --- PASS: TestShowroomMALT/secret/1.random (0.03s)
    --- PASS: TestShowroomMALT/secret/10.large-circle (0.01s)
    --- PASS: TestShowroomMALT/secret/11.all-cars-max (0.03s)
    --- PASS: TestShowroomMALT/secret/12.400 (24.59s)
    --- PASS: TestShowroomMALT/secret/13.400 (28.71s)
    --- PASS: TestShowroomMALT/secret/14.400 (28.78s)
    --- PASS: TestShowroomMALT/secret/15.400 (29.21s)
    --- PASS: TestShowroomMALT/secret/16.bigzag (24.29s)
    --- PASS: TestShowroomMALT/secret/2.random (0.02s)
    --- PASS: TestShowroomMALT/secret/3.doorcut (0.00s)
    --- PASS: TestShowroomMALT/secret/4.harder-random (0.02s)
    --- PASS: TestShowroomMALT/secret/5.harder-random (0.02s)
    --- PASS: TestShowroomMALT/secret/6.harder-random (0.02s)
    --- PASS: TestShowroomMALT/secret/7.circle (0.01s)
    --- PASS: TestShowroomMALT/secret/8.all-doors (0.01s)
    --- PASS: TestShowroomMALT/secret/9.smallest (0.01s)
    --- PASS: TestShowroomMALT/sample/1 (0.01s)
    --- PASS: TestShowroomMALT/sample/2 (0.01s)
PASS
ok      github.com/lintang-b-s/Navigatorx/tests/shortestpath_crp_alt    136.036s



    simple_graph_test.go:122: solveSimpleGraphd test case: ../shortestpath/data/tests/shortestpath/simple_graph/3
--- PASS: TestCRPQuerySimpleGraphMALT (0.01s)
    --- PASS: TestCRPQuerySimpleGraphMALT/../shortestpath/data/tests/shortestpath/simple_graph//1 (0.00s)
    --- PASS: TestCRPQuerySimpleGraphMALT/../shortestpath/data/tests/shortestpath/simple_graph//2 (0.00s)
    --- PASS: TestCRPQuerySimpleGraphMALT/../shortestpath/data/tests/shortestpath/simple_graph//3 (0.00s)
PASS
ok      github.com/lintang-b-s/Navigatorx/tests/shortestpath_crp_alt    0.288


 osn2024_krl_test.go:342: calculating shortest path from P: 4, to: Q: 1
    osn2024_krl_test.go:399: solved test case: ../shortestpath/data/tests/shortestpath/osn2024_krl/tc/practice_sample_3
--- PASS: TestOSN2024KRLMALT (2448.22s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_10 (17.65s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_11 (0.03s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_3 (107.64s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_4 (114.24s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_5 (117.25s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_6 (144.42s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_10_7 (3.33s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_1 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_10 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_11 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_12 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_16 (12.39s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_17 (132.69s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_18 (144.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_19 (198.95s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_21 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_3 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_4 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_5 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_6 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_7 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_8 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_11_9 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_1_1 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_1 (0.06s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_2 (0.09s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_3 (0.07s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_4 (0.06s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_5 (0.06s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_6 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_7 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_2_8 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_4_1 (174.64s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_6_1 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_6_10 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_1 (0.06s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_10 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_2 (0.07s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_3 (0.04s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_4 (0.02s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_5 (0.06s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_6 (0.07s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_7 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_8 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_7_9 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_8_1 (154.84s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_8_2 (128.93s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_8_3 (114.94s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_8_5 (308.99s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_8_6 (137.00s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_8_8 (155.45s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_1 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_10 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_11 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_17 (278.96s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_19 (0.04s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_2 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_3 (0.07s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_4 (0.07s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_5 (0.06s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_6 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_7 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_8 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_9_9 (0.05s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_sample_1 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_sample_2 (0.01s)
    --- PASS: TestOSN2024KRLMALT/tc/practice_sample_3 (0.01s)
PASS
ok      github.com/lintang-b-s/Navigatorx/tests/shortestpath_crp_alt    2448.494s


--- PASS: TestCRPQueryAJourneyToGreeceMALT (91.08s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsample/1 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/01_expensivebridge1 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/02_expensivebridge2 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/03_expensivebridge3 (0.00s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/04_expensivebridge4 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/05_double_edge (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/06_wantOnlyAthens1 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/07_wantOnlyAthens2 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/08_staytooShortForSites (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/09_pureTSP1 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/10_pureTSP2 (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/11_pathimpossible (0.01s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/12_pathpossible (0.00s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/13_largest (1.14s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/13_largest2 (1.26s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/14_large.0 (1.27s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/15_large.1 (1.28s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/16_large.2 (1.20s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/17_large.3 (1.27s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/18_large.4 (1.26s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/19_large.5 (1.35s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/20_large.6 (1.35s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/21_large.7 (1.25s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/22_large.8 (1.37s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/23_large.9 (1.28s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/24_manySmall.0 (0.32s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/25_manySmall.1 (0.29s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/26_manySmall.2 (0.29s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/27_manySmall.3 (0.34s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/28_manySmall.4 (0.35s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/29_manySmall.5 (0.33s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/30_manySmall.6 (0.31s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/31_manySmall.7 (0.30s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/32_manySmall.8 (0.31s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/33_manySmall.9 (0.30s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/34_manySmall.10 (0.29s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/35_manySmall.11 (0.29s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/36_manySmall.12 (0.31s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/37_manySmall.13 (0.29s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/38_manySmall.14 (0.30s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/39_manySmall.15 (0.30s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/40_manySmall.16 (0.31s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/41_manySmall.17 (0.31s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/42_manySmall.18 (0.32s)
    --- PASS: TestCRPQueryAJourneyToGreeceMALT/Multilevel-ALT_without_turn_costsecret/43_manySmall.19 (0.35s)
PASS
ok      github.com/lintang-b-s/Navigatorx/tests/shortestpath_crp_alt_without_turn_cost  91.108s


2026-05-07T15:36:27.302290082+07:00     info    done query id: 2620000

2026-05-07T15:36:27.710278022+07:00     info    done query id: 2625000

2026-05-07T15:36:28.057520208+07:00     info    done query id: 2630000

2026-05-07T15:36:28.38627531+07:00      info    done query id: 2635000

2026-05-07T15:36:28.830828924+07:00     info    done query id: 2640000

2026-05-07T15:36:29.33951375+07:00      info    done query id: 2645000

2026-05-07T15:36:29.702802838+07:00     info    done query id: 2650000

2026-05-07T15:36:29.999540801+07:00     info    done query id: 2655000

2026-05-07T15:36:30.348303279+07:00     info    done query id: 2660000

2026-05-07T15:36:30.740179324+07:00     info    done query id: 2665000

2026-05-07T15:36:31.303687894+07:00     info    done query id: 2670000

2026-05-07T15:36:31.659166944+07:00     info    done query id: 2675000

2026-05-07T15:36:32.107895598+07:00     info    done query id: 2680000

2026-05-07T15:36:32.547078223+07:00     info    done query id: 2685000

2026-05-07T15:36:33.034012219+07:00     info    done query id: 2690000

2026-05-07T15:36:33.497855533+07:00     info    done query id: 2695000

2026-05-07T15:36:34.051435022+07:00     info    done query id: 2700000

2026-05-07T15:36:34.400811911+07:00     info    done query id: 2705000

2026-05-07T15:36:34.638603279+07:00     info    done query id: 2710000

2026-05-07T15:36:34.925512801+07:00     info    done query id: 2715000

2026-05-07T15:36:35.360910144+07:00     info    done query id: 2720000

2026-05-07T15:36:35.871856072+07:00     info    done query id: 2725000

2026-05-07T15:36:36.286823311+07:00     info    done query id: 2730000

2026-05-07T15:36:36.585430035+07:00     info    done query id: 2735000

2026-05-07T15:36:37.021424216+07:00     info    done query id: 2740000

2026-05-07T15:36:37.478693076+07:00     info    done query id: 2745000

2026-05-07T15:36:37.802501281+07:00     info    done query id: 2750000

2026-05-07T15:36:38.239906989+07:00     info    done query id: 2755000

2026-05-07T15:36:38.424009457+07:00     info    done
completed shortest path correctness test......
```

## Evaluasi Alternative Routes in Road Network [[2]](#ref2)

Evaluasi implementasi Algoritma untuk mencari Alternative Routes in Road Network [[2]](#ref2) yang ada di Navigatorx (https://github.com/lintang-b-s/Navigatorx/blob/main/pkg/engine/routing/alternative_routes.go).

```
processed 10000 queries
success rate: 0.947100
stretch: 1.104162
diversity: 0.386089
runtime: 1.028000 ms
```

script:
prequisite: install golang: https://go.dev/doc/install

```
sh ./scripts/alternative_routes_results.sh
```

## Load Tests && runtime CRP Query [[1]](#ref1)

script:
prequisite: install golang: https://go.dev/doc/install
install k6: https://grafana.com/docs/k6/latest/set-up/install-k6/

```
sh ./scripts/load_tests_runtime.sh

# buka http://localhost:5665/ui saat k6 load test sudah jalan
```

### Laptop Spec

```
Vendor ID:                   AuthenticAMD
  Model name:                AMD Ryzen 5 7540U w/ Radeon(TM) 740M Graphics
    CPU family:              25
    Model:                   116
    Thread(s) per core:      2
    Core(s) per socket:      6
    Socket(s):               1
    Stepping:                1
    Microcode version:       0xa704108
    Frequency boost:         enabled
    CPU(s) scaling MHz:      40%
    CPU max MHz:             4979.3340
    CPU min MHz:             406.4770
    BogoMIPS:                6388.24

RAM 16GB
```

### Avg Runtime CRP Query

```
2026-05-07T16:54:07.241898894+07:00	info	done query 9000
2026-05-07T16:54:08.604881903+07:00	info	done query 10000
avg query times: 1.020100 ms
avg efficiency: 0.688671
avg number of vertices scanned: 1142
avg query runtime: 0.618300 ms
avg path unpacking runtime: 0.085400 ms
avg number of overlay vertices scanned: 410
```

### Fastest Path CRP Query Load Test

[![k6 Load Test Report navigatorx fastest](docs/images/k6_crp_query_result.png)](docs/images/k6_crp_query_result.png)

### Alternative Routes in Road Network Load Test

[![k6 Load Test Report navigatorx alternatives](docs/images/k6_alternative_routes_result.png)](docs/images/k6_alternative_routes_result.png)

### Perbandingan dengan OSRM v26.5.0 [[4]](#ref4) Multilevel-dijkstra (MLD) pipeline

Saya juga melakukan load test pada software Open Source Routing Machine (OSRM) v26.5.0 [[4]](#ref4) Multilevel-Dijkstra (MLD) pipeline (commit c3dc148). \
alasan saya menggunakan pipeline Multilevel-Dijkstra (MLD) adalah karena pipeline ini sangat mirip dengan Customizable Route Planning (CRP) [[1]](#ref1). Seperti yang dikatakan oleh lead developer dari [OSRM](https://github.com/Project-OSRM/osrm-backend) sendiri, Dennis Luxen, pada komen akun Hacker News beliau: https://news.ycombinator.com/item?id=45463199 .

script:

```
sh scripts/load_tests_osrm.sh

# buka http://localhost:5665/ui saat k6 load test sudah jalan
```

#### OSRM v26.5.0 (commit c3dc148) computeRoutes (/route/v1/driving) with alternatives=false

[![k6 Load Test Report osrm fastest](docs/images/k6_osrm_fastest.png)](docs/images/k6_osrm_fastest.png)

#### OSRM v26.5.0 (commit c3dc148) computeRoutes (/route/v1/driving) with alternatives=true

[![k6 Load Test Report osrm alternatives](docs/images/k6_osrm_alternative_routes.png)](docs/images/k6_osrm_alternative_routes.png)

#### OSRM v26.5.0 (commmit c3dc148) Alternative Routes Success rate

```
processed 5000 queries
success rate: 0.575600
```

## Demo Software

mobile app: https://github.com/lintang-b-s/navigatorx-rn

[![Navigatorx Demo1](https://img.youtube.com/vi/z3GPaacAKAo/maxresdefault.jpg)](https://www.youtube.com/watch?v=z3GPaacAKAo)

[![Navigatorx Demo2](https://img.youtube.com/vi/YKw3FaLH5Fc/maxresdefault.jpg)](https://www.youtube.com/watch?v=YKw3FaLH5Fc)

frontend web online: https://navigatorx-crp-fe.vercel.app/ \
[![Navigatorx Demo3](https://img.youtube.com/vi/MblDGyEF7fk/maxresdefault.jpg)](https://www.youtube.com/watch?v=MblDGyEF7fk)

## Referensi & Acknowledgements

### Referensi

<a id="ref1"></a>1. Delling, D. et al. (2015) “Customizable Route Planning in Road
Networks,” Transportation Science [Preprint]. Available at:
https://doi.org/10.1287/trsc.2014.0579 .

<a id="ref2"></a>2. Abraham, I. et al. (2010) “Alternative Routes in Road Networks,” in P. Festa (ed.)
Experimental Algorithms. Berlin, Heidelberg: Springer, pp. 23–34. Available at:
https://doi.org/10.1007/978-3-642-13193-6_3 .

<a id="ref3"></a>3. Goldberg, A. and Harrelson, C. (2005) “Computing the shortest path: A search meets
graph theory,” in. ACM-SIAM Symposium on Discrete Algorithms. Vancouver:
ACM, pp. 156 - 165.

<a id="ref4"></a>4. Luxen, D. and Vetter, C. (2011) ‘Real-time routing with OpenStreetMap data’, in Proceedings of the 19th ACM SIGSPATIAL International Conference on Advances in Geographic Information Systems. New York, NY, USA: ACM (GIS ’11), pp. 513–516. Available at: https://doi.org/10.1145/2093973.2094062. code: https://github.com/Project-OSRM/osrm-backend.

### Acknowledgements

Penulis ingin mengucapkan terima kasih sebesar-besaarnya pada kontributor proyek open source dibawah ini. Kode pada project Navigatorx banyak diadaptasi dan terinspirasi dari proyek open source berikut:

1. [CRP](https://github.com/michaelwegner/CRP)
2. [OSRM Backend](https://github.com/Project-OSRM/osrm-backend)
3. [GraphHopper](https://github.com/graphhopper/graphhopper)
4. [Telenav](https://github.com/Telenav/open-source-spec)
