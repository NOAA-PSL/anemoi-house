#!/bin/bash

#SBATCH -J globaleagle2obs
#SBATCH -o slurm/wxvx.0.2.1.%j.out
#SBATCH -e slurm/wxvx.0.2.1.%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --cpus-per-task=4
#SBATCH --qos=regular
#SBATCH --account=m4718
#SBATCH --constraint=cpu
#SBATCH -t 6:00:00

## Preprocess forecast files for wxvx
#conda activate anemoi
#eagle-tools prewxvx prewxvx.validation.yaml
#conda deactivate

## Run wxvx workflow
conda activate wxvx

# These worked fine with 64 tasks and took about 30-35 min
# 128 tasks = too much
# - all ncobs failures are not obs failures, so they are in addition to files that can't be found?
for task in "obs" "ncobs" "grids" "stats"; do
    echo "Running: wxvx -t ${task} -n ${SLURM_NTASKS}"
    wxvx -c "wxvx.validation.yaml" -t "${task}" -n "${SLURM_NTASKS}" > "log.wxvx.${task}" 2>&1
done

#conda deactivate

## Postprocess into a single file for each variable
#conda activate anemoi
#eagle-tools postwxvx postwxvx.validation.yaml
#conda deactivate
