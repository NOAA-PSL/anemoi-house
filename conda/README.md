# Conda Environment Setup

We will need two separate conda environments to get started, which are defined
by the two yaml files in this repo:
* [ufs2arco.yaml](ufs2arco.yaml): establishes the CPU based data preprocessing
  environment, using NOAA's [ufs2arco](https://github.com/NOAA-PSL/ufs2arco)
  package
* [anemoi.yaml](anemoi.yaml): establishes the GPU environment necessary for
  training and inference using ECMWF's
  [anemoi](https://anemoi.readthedocs.io/en/latest/) family of packages

## 1. Create the two environments

```
conda env create -f ufs2arco.yaml
conda env create -f anemoi.yaml
```

## 2. Install `mpi4py` into the ufs2arco environment

This step will vary by machine.
If you are on an HPC machine with an MPI distribution, then the
steps outlined below for
[the NERSC machine Perlmutter](https://docs.nersc.gov/systems/perlmutter/architecture/)
will probably work, but simply swap out the `module load` statements with whatever modules
are recommended on your machine.
Otherwise, you can simply install mpi4py from conda forge (outlined at the
bottom).

### Perlmutter instructions

These instructions are adapted to the CPU modules from
[these instructions](https://docs.nersc.gov/development/languages/python/using-python-perlmutter/#mpi4py-on-perlmutter).

```
module load conda
module load PrgEnv-gnu
module load cray-mpich
conda activate ufs2arco
MPICC="cc -shared" pip install --force --no-cache-dir --no-binary=mpi4py mpi4py
```

### No existing MPI instructions

If you are somewhere (e.g., a personal laptop) where MPI is not already
installed, then simply install it from conda-forge

```
conda activate ufs2arco
conda install -c conda-forge mpi4py
```

## 3. Install `flash-attn` into the anemoi environment

[Flash attention](https://github.com/Dao-AILab/flash-attention)
is used to speed up attention in the transformer architecture.
To install, run

```
conda activate anemoi
pip install flash-attn --no-build-isolation
```
