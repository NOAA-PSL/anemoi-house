# Conda Environment Setup

We will need two separate conda environments to get started, which are defined
by the two yaml files in this repo:
* [ufs2arco.yaml](ufs2arco.yaml): establishes the CPU based data preprocessing
  environment, using NOAA's [ufs2arco](https://github.com/NOAA-PSL/ufs2arco)
  package
* [anemoi.yaml](anemoi.yaml): establishes the GPU environment necessary for
  training and inference using ECMWF's
  [anemoi](https://anemoi.readthedocs.io/en/latest/) family of packages


## 1. Create an environment for Anemoi

First, we need to get the right modules loaded.
Be sure to start this off with `module restore` and not
`module purge` since Perlmutter has defaults for things like gcc which need to
be loaded.

```
module restore
module load conda
module load PrgEnv-nvidia cray-mpich cudatoolkit craype-accel-nvidia80
module load cudnn/8.9.3 nccl/2.21.5
```

Now we create the conda environment

```
conda env create -f anemoi.yaml
```

Once this is done, installing flash attention should go quickly...
[Flash attention](https://github.com/Dao-AILab/flash-attention)
is used to speed up attention in the transformer architecture.
To install, run

```
conda activate anemoi
pip install flash-attn --no-build-isolation
```

## 2. Create and environment for ufs2arco

First load modules, and note that these are different from the anemoi
environment.
It's not clear to me if all of these are necessary, but they are sufficient to
get the job done.

```
module restore
module load conda PrgEnv-gnu cray-mpich
```

Now we can create the environment

```
conda env create -f ufs2arco.yaml
```

And finally, install `mpi4py` into the ufs2arco environment

```
conda activate ufs2arco
MPICC="cc -shared" pip install --force --no-cache-dir --no-binary=mpi4py mpi4py
```
