# Preprocessing

The yaml files here create separate datasets for training, validation, and
testing, respectively.

Note that the "directories" section of each yaml file needs to be prepended with
a user-specific directory, for example on Perlmutter, we could use something
like:

```yaml
directories:
  zarr: /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0/training.zarr
  cache: /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0/ufs2arco-cache/
  logs: /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0/ufs2arco-logs/training
```

but then this will have to be changed to each user's specific directories.

## Job submission

Either submit the batch job

```
sbatch submit_ufs2arco.sh
```

or do it interactively (which gets the node faster and allows for debugging):

```
salloc --nodes 1 --tasks-per-node 128 --cpus-per-task 2 --qos interactive --time 01:00:00 --constraint cpu --account m4718
module load conda
conda activate ufs2arco
srun ufs2arco training.yaml --overwrite
srun ufs2arco validation.yaml --overwrite
srun ufs2arco testing.yaml --overwrite
```

## Checking on progress

You can monitor progress by watching the log files generated inside of the
directory specified in the "logs" option noted above.
When it's done you'll get something like:

```
tail -n 1 /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0/ufs2arco-logs/training/log.0000.0128.out
[329 s] [INFO   ] 🚀🚀🚀 Dataset is ready for launch at: /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0/training.zarr
```

And noting the time, this should take 5-6 minutes or so.
