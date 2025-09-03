import os
import numpy as np
import xesmf

from anemoi.graphs.generate.utils import get_coordinates_ordering

if __name__ == "__main__":


    # 1.00 degree data space
    store_dir = f"{os.environ['SCRATCH']}/anemoi-house/gfs/1.00-degree/data"
    if not os.path.isdir(store_dir):
        os.makedirs(store_dir)

    ds = xesmf.util.grid_global(1, 1, cf=True, lon1=360)
    ds = ds.drop_vars("latitude_longitude")

    # GFS goes north -> south
    ds = ds.sortby("lat", ascending=False)

    ds.to_netcdf(f"{store_dir}/global_one_degree.nc")

    # 2.00 degree latent space
    store_dir = f"{os.environ['SCRATCH']}/anemoi-house/gfs/1.00-degree/latlon"
    if not os.path.isdir(store_dir):
        os.makedirs(store_dir)

    ds = xesmf.util.grid_global(2, 2, cf=True, lon1=360)
    ds = ds.drop_vars("latitude_longitude")
    glon, glat = np.meshgrid(ds["lon"], ds["lat"])

    coords = np.stack([glon.flatten(), glat.flatten()], axis=-1)
    order = get_coordinates_ordering(coords)
    glon = coords[order, 0]
    glat = coords[order, 1]

    np.savez(f"{store_dir}/latentx2.global1degree.sorted.npz", lon=glon, lat=glat)
