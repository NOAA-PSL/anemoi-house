# Atmosphere Subsampled

The configurations here are an atmosphere-only configuration at a horizontal
resolution resulting from subsampling the original 1/4 degree output by
selecting every 4th point in longitude and latitude.
That is, it's approximately 1 degree.

Specifically, these configurations use the following zarr store

```python
import xarray
ds = xarray.open_zarr(
    "gs://noaa-ufs-gefsv13replay/ufs-hr1/0.25-degree-subsampled/03h-freq/zarr/fv3.zarr",
    storage_options={"token": "anon"},
)
```
