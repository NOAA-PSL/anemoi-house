#!/bin/bash

#SBATCH -J gfs-latlon-030k
#SBATCH -o slurm/steps030k.%j.out
#SBATCH -e slurm/steps030k.%j.err
#SBATCH --nodes=16
#SBATCH --tasks-per-node=4
#SBATCH --gpus-per-node=4
#SBATCH --qos=regular
#SBATCH --account=m4718
#SBATCH --constraint='gpu&hbm80g'
#SBATCH -t 24:00:00

conda activate anemoi
srun --jobid $SLURM_JOB_ID ~/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=steps030k
