# Conda Environment Setup

We will need two separate conda environments to get started, which are defined
by the two yaml files in this repo:
* [ufs2arco.yaml](ufs2arco.yaml): establishes the CPU based data preprocessing
  environment, using NOAA's [ufs2arco](https://github.com/NOAA-PSL/ufs2arco)
  package
* [anemoi.yaml](anemoi.yaml): establishes the GPU environment necessary for
  training and inference using ECMWF's
  [anemoi](https://anemoi.readthedocs.io/en/latest/) family of packages


## General Build Tips

A lot of these pertain to flash attention, because it's a tricky one.
* If you're on an HPC system, make sure you have a recent version of gcc
  installed, or loaded via lmod (the usual module system).
  On Perlmutter, version 12.2 is working just fine.
* Make sure the `flash-attn` and `pytorch` versions work well together.
  For example, look at `flash-attn` version 2.7.4.post1
  [here](https://github.com/Dao-AILab/flash-attention/releases/tag/v2.7.4.post1).
  Notice that there is no wheel for torch version 2.7, but there is for version
  2.6. To see this, ctrl+f search for torch2.6 - lots of options there, but none
  for torch2.7.



## Perlmutter Instructions

These instructions will get you setup on Perlmutter, and should be helpful for
other machines too.

### 0. Clear unnecessary disk space

Before getting started, I recommend clearing unnecessary space that is taken up
by conda and pip.
This prevents you from running out of disk space during the installation, which
might create an inconsistent environment.


For conda:
```
module load conda
conda clean --all
```

For pip:
```
module load conda
conda activate base
pip cache purge
```


### 1. Create an environment for Anemoi

First, we need to get the right modules loaded.
Be sure to start this off with `module restore` and not
`module purge` since Perlmutter has defaults for things like gcc which need to
be loaded.

```
module purge
source /opt/cray/pe/cpe/24.07/restore_lmod_system_defaults.sh
module restore
module load conda
module load gcc cudnn/8.9.3 nccl/2.21.5
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

## 2. Create an environment for ufs2arco

The modules used in the anemoi environment should work here, but either way the
following commands will be sufficient.

```
module purge
source /opt/cray/pe/cpe/24.07/restore_lmod_system_defaults.sh
module restore
module load conda
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
