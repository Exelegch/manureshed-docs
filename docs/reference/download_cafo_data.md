# Download CAFO Deep-Learning Detection Data from OSF

Downloads the CAFO (Concentrated Animal Feeding Operation) facility
detection dataset (~325,000 facilities across CONUS) from OSF. The RDS
file (~5 MB) is cached locally and only re-downloaded when
`force_download = TRUE` or the cache is absent.

## Usage

``` r
download_cafo_data(
  format = c("rds", "csv"),
  force_download = FALSE,
  cache_dir = NULL,
  verbose = TRUE
)
```

## Arguments

- format:

  Character. `"rds"` (default, ~5 MB) or `"csv"` (~31 MB).

- force_download:

  Logical. Re-download even if cached. Default `FALSE`.

- cache_dir:

  Character. Cache directory. Defaults to
  `getOption("manureshed.cache_dir")` or
  `file.path(tempdir(), "manureshed", "data")`. Set
  `options(manureshed.cache_dir = "~/my_cache")` in `.Rprofile` for a
  persistent cache across sessions.

- verbose:

  Logical. Default `TRUE`.

## Value

Invisibly returns the local file path.

## Details

The dataset is a static snapshot used as a logistics layer and is
year-agnostic.

## See also

[`score_hub_sites`](https://exelegch.github.io/manureshed-docs/reference/score_hub_sites.md)

## Examples

``` r
# \donttest{
path <- download_cafo_data()
#> Downloading CAFO data from OSF (rds)...
#>   URL: https://osf.io/download/e8npw/
#>   Done (5.2 MB) -> /tmp/RtmpUzSF9u/manureshed/data/cafo_detections.rds
cafo <- readRDS(path)
nrow(cafo)
#> [1] 325249
# }
```
