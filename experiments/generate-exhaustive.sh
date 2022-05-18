#!/bin/bash

FOLDER="exhaustive"
mkdir -p ${FOLDER}
# Generate .json and .thy files in exhaustive/ folder.
bin/generate-v1 -d ${FOLDER}

# Make Isabelle file with some common setup among all exhaustive tests. (This can improve performance.)
bin/test-before-isabelle-v1 --setup --state-names -d ${FOLDER} -p 388 -i 467 -f 147 > ${FOLDER}/Test_Setup.thy

# Quick fix for a little inconsistency in label naming.
sed -i 's/lA/A/g' ${FOLDER}/Test_Setup.thy
sed -i 's/lB/B/g' ${FOLDER}/Test_Setup.thy
