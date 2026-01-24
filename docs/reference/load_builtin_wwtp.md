# Load Built-in WWTP Data from OSF

Load built-in WWTP data for specified year from OSF repository
(2007-2016 available)

Load built-in WWTP data for specified year from OSF repository
(2007-2016 available)

## Usage

``` r
load_builtin_wwtp(
  nutrient,
  year = 2016,
  force_download = FALSE,
  verbose = TRUE
)

load_builtin_wwtp(
  nutrient,
  year = 2016,
  force_download = FALSE,
  verbose = TRUE
)
```

## Arguments

- nutrient:

  Character. "nitrogen" or "phosphorus"

- year:

  Numeric. Year to filter data (available: 2007-2016)

- force_download:

  Logical. Force re-download even if cached

- verbose:

  Logical. Show download progress

## Value

Data frame with cleaned WWTP data for specified year

Data frame with cleaned WWTP data for specified year

## Examples

``` r
# \donttest{
# Load WWTP data for different years (2007-2016 available)
wwtp_n_2016 <- load_builtin_wwtp("nitrogen", 2016)
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2016
#> Number of facilities: 20846
wwtp_n_2012 <- load_builtin_wwtp("nitrogen", 2012)
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2012
#> Number of facilities: 26971
wwtp_n_2007 <- load_builtin_wwtp("nitrogen", 2007)
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2007
#> Number of facilities: 19738

# Load phosphorus data
wwtp_p_2015 <- load_builtin_wwtp("phosphorus", 2015)
#> Using cached version of wwtp_phosphorus_combined
#> Loaded WWTP phosphorus data for year 2015
#> Number of facilities: 9999
wwtp_p_2010 <- load_builtin_wwtp("phosphorus", 2010)
#> Using cached version of wwtp_phosphorus_combined
#> Loaded WWTP phosphorus data for year 2010
#> Number of facilities: 7548

# Force re-download
wwtp_fresh <- load_builtin_wwtp("nitrogen", 2014, force_download = TRUE)
#> Downloading wwtp_nitrogen_combined from OSF...
#>   File ID: 689c97483efa05a3a93ccdd2
#>   Downloaded successfully (11.71 MB)
#> Loaded WWTP nitrogen data for year 2014
#> Number of facilities: 29089
# }
```
