# Half Degree Latent Space

Setups with a direct mapping to the 1 degree setup (a 2x coarsening from data to
latent space in latitude and longitude).
However, this is just too expensive.
More compute and need a huge window size...

Fixing the following parameters (at least):
* Graph Encoder: 4 KNN determines graph encoding
* Graph Decoder: 3 KNN determines graph decoding
* Processor architecture: sliding window transformer
* Custom latent space, essentially inherited (coarsened) from data space
  (2x lat, 2x lon)
* Model channel width = 512
* Training steps = 30k
* "Empirical" loss weights per-variable group, essentially following AIFS
* window size
