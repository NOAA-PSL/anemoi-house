#!/bin/bash

#SBATCH -J replay-atm-p0-preprocess
#SBATCH -o preprocessing.%j.out
#SBATCH -e preprocessing.%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=2
#SBATCH --qos=debug
#SBATCH --account=m4718
#SBATCH --constraint=cpu
#SBATCH -t 00:30:00

module load conda
conda activate ufs2arco
srun ufs2arco training.yaml --overwrite
