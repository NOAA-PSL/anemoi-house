# Training Steps Test

Find the minimum necessary `window_size` for the sliding window processor.

Vary training steps, 30k-300 epochs, fixing the following parameters (at least):
* Graph Encoder: 4 KNN determines graph encoding
* Graph Decoder: 3 KNN determines graph decoding
* Processor architecture: sliding window transformer
* Custom latent space, essentially inherited (coarsened) from data space
* Model channel width = 512
* "Empirical" loss weights per-variable group, essentially following AIFS
* window size = 2160


## Versions


### 300 epochs
```
anemoi-datasets==0.5.26
anemoi-core ... commit=5dd32ca1 + feature/aml
* training-0.5.1+
* models-0.8.1+
* graphs-0.6.2+
anemoi-inference = d9efac5 ... 0.6.3+
anemoi-utils ... fdf0fc8 ... 0.4.28+
anemoi-transform==0.1.13
```

### 30k steps


(and debug.yaml) This one is with:

```
anemoi-datasets 410d1e
anemoi-core feature/azure-mlflow (rebased on top of 8e97af)
anemoi-inference 0.7.1
anemoi-utils 732182
anemoi-transforms 32cb93
```
