# Training

To run training, just modify the lines below so that they point to your
anemoi-house repo location.

In an interactive job

```
srun --jobid $SLURM_JOB_ID /path/to/anemoi-house/slurm2ddp.sh anemoi-training train --config-name=config
```

or submit the slurm script

```
sbatch submit_training.sh
```

## Configuration

Note that some of the directories will have to be changed for each user.
These will all be in [config.yaml](./config.yaml).
For example, the training data created in the preprocessing step is specified
For the most part, these should all be in the `hardware` section, which will
look like:

```yaml
hardware:
  num_gpus_per_model: 1
  paths:
    output: /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0/training-output
    data: /pscratch/sd/t/timothys/anemoi-house/replay/atmosphere-subsampled/p0
    # etc
```

## More documentation

For more information, check out the
[anemoi-training documentation](https://anemoi.readthedocs.io/projects/training/en/latest/).
