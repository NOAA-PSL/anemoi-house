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
