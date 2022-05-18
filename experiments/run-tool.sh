#!/bin/bash

INPUT_FOLDER="$1"
if [ -z ${INPUT_FOLDER} ] ; then
    echo "Usage: run-tool.sh [input-folder] [version] [from] [to] [extra-params] [output-folder]"
    echo "  folder: The input folder can be e.g. random-tests-json or network-tests-json"
    echo "  version: Version of PDAAAL tool to run {1,2,3,4} (default 1)"
    echo "  from: Specifies the start of the interval of tests to run (default 0)"
    echo "  to: Specifies the end of the interval of tests to run (default =from)"
    echo "  extra-params: Specify here --state-names if the JSON files have named states (do this for random, not for network)"
    echo "  output-folder: The folder to output Isabelle theory files. (default based on input-folder and ends with -[version]-thy)"
    exit 1
fi

VERSION="$2"
if [ -z ${VERSION} ] ; then
    VERSION=1
fi
TESTBIN="test-before-isabelle-v${VERSION}"

FROM="$3"
if [ -z ${FROM} ] ; then
    FROM=0
fi
TO="$4"
if [ -z ${TO} ] ; then
    TO="${FROM}"
fi
EXTRA_PARAMS="$5" # For the random tests, we use a JSON format with --state-names, but for the network tests the states are not named (just indexed).
OUTPUT_FOLDER="$6"
if [ -z ${OUTPUT_FOLDER} ] ; then
    OUTPUT_FOLDER="${INPUT_FOLDER%-json}-${VERSION}-thy"
fi
mkdir -p ${OUTPUT_FOLDER}

for i in $(seq ${FROM} ${TO}) ; do
    bin/${TESTBIN} -d ${INPUT_FOLDER} -p ${i} -i ${i} -f ${i} --full ${EXTRA_PARAMS} > ${OUTPUT_FOLDER}/test${i}.thy
done