# Download and Cache Data from OSF

Download built-in datasets from OSF repository using Files API

## Usage

``` r
download_osf_data(
  dataset_name,
  force_download = FALSE,
  cache_dir = NULL,
  verbose = TRUE
)
```

## Arguments

- dataset_name:

  Character. Name of dataset to download

- force_download:

  Logical. Force re-download even if cached version exists

- cache_dir:

  Character. Directory to cache downloaded data (default: user data dir)

- verbose:

  Logical. Show download progress

## Value

Path to cached data file
