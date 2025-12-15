# Test KNN Encoding value

Vary knn encoder 4 - 12, fixing the following parameters (at least):
* Graph Decoder: 3 KNN determines graph decoding
* Processor architecture: sliding window transformer
* Custom latent space, essentially inherited (coarsened) from data space
* Model channel width = 512
* Training steps = 30k
* "Empirical" loss weights per-variable group, essentially following AIFS
* window size 1080
