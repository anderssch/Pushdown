#!/bin/bash

usage () {
    echo "Usage: run.sh [type] [size] [version]"
    echo "  type: {network, random, exhaustive} The type of test to run"
    echo "  size: {small, large, all} The size of the subset of experiments (default small)"
    echo "  version: Version of PDAAAL tool to run {1,2,3,4} (default 1)"
    exit 1
}

TYPE="$1"
if [ -z ${TYPE} ] ; then
    usage
fi
SIZE="$2"
if [ -z ${SIZE} ] ; then
    SIZE="small"
fi
VERSION="$3"
if [ -z ${VERSION} ] ; then
    VERSION=1
fi

echo "Using tool version ${VERSION}"

run_isabelle() {
    OUTPUT_FOLDER="$1"
    FROM="$2"
    TO="$3"
    LOG_FILE="$4"
    TEST_NAME="$5" # Optional
    ./run-isabelle.sh ${OUTPUT_FOLDER} ${FROM} ${TO} ${TEST_NAME} > ${LOG_FILE}
    
    echo "Checking log file using: grep 'Unfinished session(s)' ${LOG_FILE}"
    grep 'Unfinished session' ${LOG_FILE}
}

run_network() {
    TOPO="$1"
    INPUT_FOLDER="network-tests-json/${TOPO}"
    OUTPUT_FOLDER="network-tests-${VERSION}-thy/${TOPO}"
    FROM=0
    TO="$2"
    if [ -z ${TO} ] ; then
        TO=$(($(ls ${INPUT_FOLDER}/pda* | wc -l) - 1))  # Default to all test cases in folder
    fi

    echo "Now running network tests for network ${TOPO} test cases ${FROM} to ${TO}. Writing Isabelle files to ${OUTPUT_FOLDER}."
    ./run-tool.sh ${INPUT_FOLDER} ${VERSION} ${FROM} ${TO} " " ${OUTPUT_FOLDER}
    
    LOG_FILE="network-isabelle-v${VERSION}-${TOPO}-${FROM}-${TO}.log"
    echo "Now running Isabelle for network test cases ${FROM} to ${TO} of network ${TOPO}. Writing to ${LOG_FILE}"
    run_isabelle ${OUTPUT_FOLDER} ${FROM} ${TO} ${LOG_FILE} ${TOPO}
}

if [ "${TYPE}" = "network" ] ; then
    #** Network test cases **#
    if [ ! -d "network-tests-json" ] ; then 
        echo "Please extract network test files: tar -xzf network-tests-json.tar.gz"
        exit 1
    fi

    if [ "${SIZE}" = "small" ] ; then
        echo "run.sh network small: Runs 10 test cases of network Abilene - may take a few minutes."
        run_network "Abilene" 9
    elif [ "${SIZE}" = "large" ] ; then
        echo "run.sh network large: Runs all test cases of the first 10 networks. NOTE: This takes several hours."
        for TOPO in $(ls network-tests-json | head -n 10) ; do
            run_network ${TOPO}
        done
    elif [ "${SIZE}" = "all" ] ; then
        echo "run.sh network all: Runs all test cases of all networks."
        echo "!! WARNING !! This may take several days !!"
        for TOPO in $(ls network-tests-json) ; do
            run_network ${TOPO}
        done
    else
        echo "Unknown value of second parameter [size]"
        usage
    fi


elif [ "${TYPE}" = "random" ] ; then
    #** Random test cases **#
    if [ ! -d "random-tests-json" ] ; then 
        echo "Please either extract test case files: tar -xzf random-tests-json.tar.gz"
        echo "  or generate your own: mkdir -p random-tests-json && bin/generate-v1 --random -s 1 -d random-tests-json -n 15000"
        exit 1
    fi
    if [ "${SIZE}" = "small" ] ; then
        echo "run.sh random small: Runs the first 10 of the random test cases - may take a few minutes."
        FROM=0
        TO=9
    elif [ "${SIZE}" = "large" ] ; then
        echo "run.sh random large: Runs 1000 of the test cases (interval 9000-9999, since it contains an interesting case) - may take 2 hours."
        FROM=9000
        TO=9999
    elif [ "${SIZE}" = "all" ] ; then
        echo "run.sh random all: Runs all (15000) random test cases."
        echo "!! WARNING !! This may take 1-2 days !!"
        FROM=0
        TO=$(($(ls random-tests-json/pda* | wc -l) - 1))
    else
        echo "Unknown value of second parameter [size]"
        usage
    fi

    OUTPUT_FOLDER="random-tests-${VERSION}-thy"
    echo "Now running random test cases ${FROM} to ${TO}. Writing Isabelle files to ${OUTPUT_FOLDER}."
    ./run-tool.sh random-tests-json ${VERSION} ${FROM} ${TO} "--state-names" ${OUTPUT_FOLDER}
    
    LOG_FILE="random-isabelle-v${VERSION}-${FROM}-${TO}.log"
    echo "Now running Isabelle for random test cases ${FROM} to ${TO}. Writing to ${LOG_FILE}"
    run_isabelle ${OUTPUT_FOLDER} ${FROM} ${TO} ${LOG_FILE}

elif [ "${TYPE}" = "exhaustive" ] ; then
    #** Exhaustive test cases **#
    if [ "${SIZE}" = "small" ] ; then
        echo "run.sh exhaustive small: Runs just 1000 of the exhaustive test cases - may take 5-10 minutes."
        STEP=5
        P_MAX=9
        I_MAX=9
        F_MAX=9
    elif [ "${SIZE}" = "large" ] ; then
        echo "run.sh exhaustive large: Runs 125000 of the exhaustive test cases"
        echo "!! WARNING !! This may take 10-15 hours !!"
        STEP=10
        P_MAX=49
        I_MAX=49
        F_MAX=49
    elif [ "${SIZE}" = "all" ] ; then
        echo "run.sh exhaustive all: Runs all (~27 million) exhaustive test cases."
        echo "########################################################################"
        echo "!!!!! WARNING !!!!! This may take several month, maybe even a year !!!!!"
        echo "! This is only really feasible to run distributed on a compute cluster !"
        echo "########################################################################"
        STEP=15
        P_MAX=388
        I_MAX=467
        F_MAX=147
    else
        echo "Unknown value of second parameter [size]"
        usage
    fi

    OUTPUT_FOLDER="exhaustive-tests-v${VERSION}-thy"
    echo "Now running exhaustive test cases. Writing Isabelle files to ${OUTPUT_FOLDER} (several files to batch it up a bit)."
    ./run-exhaustive.sh ${VERSION} ${OUTPUT_FOLDER} ${STEP} ${P_MAX} ${I_MAX} ${F_MAX}

    FROM=0
    TO=$(($(ls ${OUTPUT_FOLDER}/test*.thy | wc -l) - 1))
    LOG_FILE="exhaustive-isabelle-v${VERSION}-${FROM}-${TO}.log"
    echo "Now running Isabelle for all exhaustive test cases. This is files test{${FROM}-${TO}}.thy in ${OUTPUT_FOLDER}. Writing to ${LOG_FILE}"
    run_isabelle ${OUTPUT_FOLDER} ${FROM} ${TO} ${LOG_FILE} "exhaustive"
    
else
    echo "Unknown value of first parameter [type]"
    usage
fi
