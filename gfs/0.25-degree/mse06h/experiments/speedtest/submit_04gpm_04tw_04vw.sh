#!/bin/bash

#SBATCH -J 04gpm-04tw-04vw
#SBATCH -o slurm/04gpm_04tw_04vw.%j.out
#SBATCH -e slurm/04gpm_04tw_04vw.%j.err
#SBATCH --nodes=8
#SBATCH --tasks-per-node=4
#SBATCH --gpus-per-node=4
#SBATCH --qos=debug
#SBATCH --account=m4718
#SBATCH --constraint='gpu&hbm80g'
#SBATCH -t 00:30:00

conda activate anemoi
srun --jobid $SLURM_JOB_ID ~/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=04gpm_04tw_04vw
