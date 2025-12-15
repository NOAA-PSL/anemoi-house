# Example Inference and Evaluation with 1 Degree Model


First, run inference on a GPU node

```
eagle-tools inference inference.validation.yaml
```

Then evaluate on a CPU node. Note that this is just an example,
and running all of these will take multiple hours.
The spectra computation is especially time consuming.

```
eagle-tools metrics metrics.validation.yaml
eagle-tools spatial spatial.validation.yaml
eagle-tools spectra spectra.validation.yaml
eagle-tools figures visualize.yaml
eagle-tools movies visualize.yaml
```

Note that using the same `visualize.yaml` for figures and movies means that you'll
get figures of a 10 day forecast, and a movie of every timestamp up to that
point.
Change `end_date` to get an earlier forecast figure, or grab any of the
intermediate snapshots from the `.gif` file produced when creating movies.
