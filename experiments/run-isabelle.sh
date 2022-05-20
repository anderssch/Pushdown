#!/bin/bash

# TODO: Make sure this points to your Isabelle installation.
ISABELLE_PATH="$HOME/Pushdown/Isabelle2021-1/bin/isabelle"


FOLDER="$1"
if [ -z ${FOLDER} ] ; then
    echo "Usage: run-isabelle.sh [folder] [from] [to] [name]"
    echo "  folder: The input folder with isabelle files produced by run-tool.sh"
    echo "  from: Specifies the start of the interval of tests to run (default 0)"
    echo "  to: Specifies the end of the interval of tests to run (default =from)"
    echo "  name: Optional name to prefix the test. (name 'exhaustive' has a special purpose)"
    exit 1
fi

FROM="$2"
if [ -z ${FROM} ] ; then
    FROM=0
fi
TO="$3"
if [ -z ${TO} ] ; then
    TO="${FROM}"
fi
NAME="$4"

ISABELLE_TEST_DIR="ISABELLE-TEST"
mkdir -p ${ISABELLE_TEST_DIR}
cd ${ISABELLE_TEST_DIR}
rm -rf *test*

echo "In folder ${FOLDER} from ${FROM} to ${TO}"

cp ../../Formalization/LTS.thy ../../Formalization/PDS.thy ../../Formalization/PDS_Code.thy .
cat ../../Formalization/ROOT | head -n 7 > ROOT
if [ "${NAME}" = "exhaustive" ] ; then
    cp ../exhaustive/Test_Setup.thy .
    echo "    Test_Setup" >> ROOT
fi
echo "" >> ROOT

for i in $(seq ${FROM} ${TO}) ; do
    TESTNAME="${NAME}test${i}"
    mkdir ${TESTNAME}
    cp ../${FOLDER}/test${i}.thy ${TESTNAME}/Ex.thy
    echo "session ${TESTNAME} (PDS) in ${TESTNAME} = "PDS" + theories Ex" >> ROOT
done

${ISABELLE_PATH} build -vD .
