#!/bin/bash

# activate virtual environment
module unload python
module load anaconda
conda deactivate
conda activate /scratch16/jgray21/smahaja4_active/repositories/conda_deeph3_hal

# set pythonpath
export PYTHONPATH=$PATH_TO_REPO:$PYTHONPATH
echo $PATH_TO_REPO

TARGET_PDB=$PATH_TO_REPO/data/herceptin_dataset/1n8z.truncated.pdb
PREFIX=$PATH_TO_REPO/examples/herceptin_cdrh3
echo $TARGET_PDB
echo $PREFIX

# Generating 50 designs; recommended number of designs for cdrh3 is > 500.
start=0
stop=50
for ((j = $start; j < $stop; j++)); do
python3 $PATH_TO_REPO/hallucinate.py \
--target $TARGET_PDB \
--iterations 50 \
--suffix $j \
--prefix $PREFIX \
--seed $j \
--cdr_list h3 \
--disallow_aas_at_all_positions C
done

