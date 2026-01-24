# Load Built-in Spatial Boundaries from OSF

Load built-in spatial boundary data for specified scale from OSF
repository

## Usage

``` r
load_builtin_boundaries(scale, force_download = FALSE, verbose = TRUE)
```

## Arguments

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

- force_download:

  Logical. Force re-download even if cached

- verbose:

  Logical. Show download progress

## Value

sf object with spatial boundaries
