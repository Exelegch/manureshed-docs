# Batch Analysis with Parallel Processing

Run batch analysis using multiple cores for faster processing

## Usage

``` r
batch_analysis_parallel(years, n_cores = NULL, ...)
```

## Arguments

- years:

  Numeric vector. Years to analyze

- n_cores:

  Integer. Number of cores (default: detectCores() - 1)

- ...:

  Arguments passed to run_builtin_analysis

## Value

List of results

## Examples

``` r
# \donttest{
results <- batch_analysis_parallel(
  years = 2015:2016,  # Use valid years only
  n_cores = 2,        # Max 2 cores for CRAN
  scale = "county",   # Use county for faster processing
  nutrients = "nitrogen"
)
#> Starting parallel batch analysis with 2 cores
#> Processing 2 years
#> 
#> Parallel processing complete:
#>   Successful: 1/2
#>   Failed years: 2016
# }
```
