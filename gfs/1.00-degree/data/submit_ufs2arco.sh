#!/bin/bash

#SBATCH -J gfs-1.00-degree-data
#SBATCH -o preprocessing.%j.out
#SBATCH -e preprocessing.%j.err
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --cpus-per-task=4
#SBATCH --qos=regular
#SBATCH --account=m4718
#SBATCH --constraint=cpu
#SBATCH -t 02:00:00

module load conda
conda activate ufs2arco
python create_grids.py

srun ufs2arco gfs.yaml --overwrite
