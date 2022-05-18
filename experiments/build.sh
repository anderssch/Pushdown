#!/bin/bash

mkdir -p bin
mkdir -p build
cd build

for i in $(seq 1 4) ; do
    mkdir -p v${i}
    cd v${i}
    cmake -DCMAKE_BUILD_TYPE=Release -DPDAAAL_BuildStatic=ON ../../PDAAAL-v${i} 
    make generate test-before-isabelle delta-debug -j
    mv benchmark/generate ../../bin/generate-v${i}
    mv benchmark/test-before-isabelle ../../bin/test-before-isabelle-v${i}
    mv benchmark/delta-debug ../../bin/delta-debug-v${i}
    cd ..
done
cd ..
rm -rf build
ls bin
