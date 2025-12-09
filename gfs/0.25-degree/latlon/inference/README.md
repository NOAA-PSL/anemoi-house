# Inference at Quarter Degree

Using 32 processes per node works, 64 uses too much memory.

```
salloc --nodes 1 --cpus-per-task=8 --tasks-per-node=32 --constraint=cpu ...
conda activate anemoi
srun eagle-tools metrics metrics.validation.yaml
```
