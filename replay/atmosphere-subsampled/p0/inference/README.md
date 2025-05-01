# Inference

Run with

```
anemoi-inference run forecast.yaml
```

The yaml file shows how to run a single 10 day forecast.
Some quick notes:

* The yaml file needs to be updated with paths to your model checkpoints, and
  where you want to store inference
* There's currently a bug in anemoi-inference, and it errors out on the last
  timestep due to bad indexing. A simple workaround for now is to increase
  the desired lead time by an extra model time step


## More documentation

For more information, check out the
[anemoi-inference documentation](https://anemoi.readthedocs.io/projects/inference/en/latest/).
