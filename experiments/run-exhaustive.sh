#!/bin/bash

VERSION="$1"
if [ -z ${VERSION} ] ; then
    VERSION=1
fi
TESTBIN="test-before-isabelle-v${VERSION}"

FOLDER="$2"
if [ -z ${FOLDER} ] ; then
    FOLDER="exhaustive-tests-v${VERSION}-thy"
fi
mkdir -p ${FOLDER}
rm -f ${FOLDER}/*

P_MIN=0
I_MIN=0
F_MIN=0

STEP="$3"
if [ -z ${STEP} ] ; then
    STEP=15
fi
P_MAX="$4"
if [ -z ${P_MAX} ] ; then
    P_MAX=388
fi
I_MAX="$5"
if [ -z ${I_MAX} ] ; then
    I_MAX=467
fi
F_MAX="$6"
if [ -z ${F_MAX} ] ; then
    F_MAX=147
fi

INDEX=0

for P_FROM in $(seq ${P_MIN} ${STEP} ${P_MAX}) ; do
    P_TO=$(echo "if (${P_FROM} + ${STEP} - 1 <= ${P_MAX}) ${P_FROM} + ${STEP} - 1 else ${P_MAX}" | bc)
    for I_FROM in $(seq ${I_MIN} ${STEP} ${I_MAX}) ; do
        I_TO=$(echo "if (${I_FROM} + ${STEP} - 1 <= ${I_MAX}) ${I_FROM} + ${STEP} - 1 else ${I_MAX}" | bc)
        for F_FROM in $(seq ${F_MIN} ${STEP} ${F_MAX}) ; do
            F_TO=$(echo "if (${F_FROM} + ${STEP} - 1 <= ${F_MAX}) ${F_FROM} + ${STEP} - 1 else ${F_MAX}" | bc)

            FILE="${FOLDER}/test${INDEX}.thy"
            echo -e "theory Ex\n  imports PDS.Test_Setup\nbegin" > ${FILE}
            eval $(echo "cat exhaustive/pda{$(seq -s , ${P_FROM} ${P_TO})}.thy exhaustive/initial{$(seq -s , ${I_FROM} ${I_TO})}.thy exhaustive/final{$(seq -s , ${F_FROM} ${F_TO})}.thy") >> ${FILE}

            RES=$(for p in $(seq ${P_FROM} ${P_TO}) ; do for i in $(seq ${I_FROM} ${I_TO}) ; do for f in $(seq ${F_FROM} ${F_TO}) ; do bin/${TESTBIN} --state-names -d exhaustive -p ${p} -i ${i} -f ${f} ; done ; done ; done ; echo "end" )
            echo "${RES}" >> ${FILE}

            INDEX=$((INDEX+1))
        done
    done
done
