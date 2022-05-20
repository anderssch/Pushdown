#!/bin/bash

# TODO: Make sure this points to your Isabelle installation.
ISABELLE_PATH="$HOME/Pushdown/Isabelle2021-1/bin/isabelle"

INPUT_FOLDER="$1"
if [ -z ${INPUT_FOLDER} ] ; then
    echo "Usage: delta-debug.sh [folder] [version] [test-case]"
    echo "  folder: The input folder with the JSON test case files, can be e.g. random-tests-json"
    echo "  version: Version of PDAAAL tool to use {1,2,3,4} (default 1)"
    echo "  test-case: The id of the test case (default 0). For exhaustive tests, this can be three numbers: [pda-id] [initial-id] [final-id]"
    exit 1
fi

VERSION="$2"
if [ -z ${VERSION} ] ; then
    VERSION=1
fi

echo "Using tool version ${VERSION}"

ID_P="$3"
if [ -z ${ID_P} ] ; then
    ID_P=0
fi
ID_I="$4"
if [ -z ${ID_I} ] ; then
    ID_I=${ID_P}
fi
ID_F="$5"
if [ -z ${ID_F} ] ; then
    ID_F=${ID_P}
fi

EXTRA_PARAMS="--state-names"
if [[ ${INPUT_FOLDER} == *"network"* ]] ; then
    EXTRA_PARAMS=""  # Yes this really should be an input parameter to the script, but let's not complicate the interface too much. Good enough for the case study. 
fi

DDBIN="delta-debug-v${VERSION}"
TESTBIN="test-before-isabelle-v${VERSION}"

PD="$(pwd)"
INFOLDER="${PD}/${INPUT_FOLDER}"

INSTANCE_DIR="current_instances"
DD_DIR="DD-DIR"
mkdir -p ${DD_DIR}
cd ${DD_DIR}
rm -f *.log
rm -rf backup* test*
[ -d "${INSTANCE_DIR}" ] && rm -r ${INSTANCE_DIR}

cp ../../Formalization/LTS.thy ../../Formalization/PDS.thy ../../Formalization/PDS_Code.thy .
cat ../../Formalization/ROOT | head -n 7 > ROOT
echo -e "    Test_Setup\n" >> ROOT
cp ROOT TEMPROOT

${PD}/bin/${TESTBIN} --setup --state-names -d ${INFOLDER} -p ${ID_P} -i ${ID_I} -f ${ID_F} > Test_Setup.thy

${ISABELLE_PATH} build -vD . > isabelle-init.log
EXIT_CODE=$?
if [ ${EXIT_CODE} -ne 0 ] ; then
    echo "Error when initializing Isabelle theories. Exiting now."
    exit ${EXIT_CODE}
fi
DD_STATE=$(${PD}/bin/${DDBIN} --init -d ${INFOLDER} -p ${ID_P} -i ${ID_I} -f ${ID_F})
echo "Init done"

i=0
FAIL=""
while true; do
    echo -n "[${i}] Starting"
    echo "${DD_STATE}" > state_${i}.log
    mkdir ${INSTANCE_DIR}
    DD_TEMP=$(echo "${DD_STATE}" | ${PD}/bin/${DDBIN} --step ${FAIL} -p ${i} -i ${i} -f ${i} -o ${INSTANCE_DIR})
    [ -f "${INSTANCE_DIR}/pda-minimal.json" ] && break
    DD_STATE=${DD_TEMP}
    echo -ne "\r[${i}] Delta-debug done"

    rm ROOT
    cp TEMPROOT ROOT
    
    TESTNAME="test${i}"
    mkdir ${TESTNAME}
    ${PD}/bin/${TESTBIN} --instance ${EXTRA_PARAMS} -d ${INSTANCE_DIR} -p ${i} -i ${i} -f ${i} > ${TESTNAME}/Ex.thy
    echo "session ${TESTNAME} (PDS) in ${TESTNAME} = "PDS" + theories Ex" >> ROOT
    
    echo -ne "\r[${i}] PDAAAL test done"
    ${ISABELLE_PATH} build -vD . > isabelle-${i}.log

    mkdir backup${i} && mv -t backup${i} ${INSTANCE_DIR} test*
    # rm -r ${INSTANCE_DIR} test*

    COUNT_FAILS=$(cat isabelle-${i}.log | grep "Unfinished session" | wc -l)
    echo -ne "\r[${i}] Isabelle done   "
    if [ "${COUNT_FAILS}" -eq "0" ] ; then
        FAIL=""
        echo -e "\r[${i}] Test succes     "
    else
        FAIL="--fail"
        echo -e "\r[${i}] Test fail       "
    fi
    
    i=$((i+1))
done

echo -e "\r[${i}] DONE!     "
i=$((i-1))
echo "*** DD STATE ***"
echo ${DD_STATE}

echo "*** PDA ***"
cat ${INSTANCE_DIR}/pda-minimal.json
echo "*** Initial ***"
cat ${INSTANCE_DIR}/initial-minimal.json
echo "*** Final ***"
cat ${INSTANCE_DIR}/final-minimal.json

