# Load Built-in NuGIS Data from OSF

Load built-in NuGIS data from OSF repository for specified year and
spatial scale. Data includes all years from 1987 through 2016.

## Usage

``` r
load_builtin_nugis(scale, year = 2016, force_download = FALSE, verbose = TRUE)
```

## Arguments

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

- year:

  Numeric. Year to filter data (available: 1987-2016)

- force_download:

  Logical. Force re-download even if cached

- verbose:

  Logical. Show download progress

## Value

Data frame of NuGIS data for specified scale and year

## Examples

``` r
# \donttest{
# Load county data for 2016
county_2016 <- load_builtin_nugis("county", 2016)
#> Using cached version of nugis_county_data
#> Loaded NuGIS county data for year 2016
#> Number of spatial units: 3058

# Load HUC8 data for 2010
huc8_2010 <- load_builtin_nugis("huc8", 2010)
#> Using cached version of nugis_huc8_data
#> Loaded NuGIS huc8 data for year 2010
#> Number of spatial units: 2111

# Load county data for 2010, force fresh download
county_2010 <- load_builtin_nugis("county", 2010, force_download = TRUE)
#> Downloading nugis_county_data from OSF...
#>   File ID: 689a80e81a020593fca5e8b4
#>   Downloaded successfully (1.89 MB)
#> Loaded NuGIS county data for year 2010
#> Number of spatial units: 3064
# }
```
