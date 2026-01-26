# Convert WWTP Data to Spatial Format

Convert WWTP data frame to sf spatial object

## Usage

``` r
wwtp_to_spatial(wwtp_data, crs = 4326)
```

## Arguments

- wwtp_data:

  Data frame. WWTP data with Lat/Long coordinates

- crs:

  Numeric. Coordinate reference system (default: 4326 for WGS84)

## Value

sf object with WWTP facilities as point geometries

## Examples

``` r
# \donttest{
# Load and convert to spatial format
wwtp_data <- load_builtin_wwtp("nitrogen", 2016)
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2016
#> Number of facilities: 20846
wwtp_clean_data <- wwtp_clean_data(wwtp_data, "nitrogen")
#> Cleaning WWTP nitrogen data...
#> Cleaning complete:
#>   Original facilities: 20846
#>   Removed: 3476 (missing data, duplicates, or outside CONUS)
#>   Final facilities: 17370
wwtp_sf <- wwtp_to_spatial(wwtp_clean_data)
#> Created spatial WWTP data with 17370 facilities

# Convert and transform to analysis CRS (without using pipe operator)
wwtp_sf <- wwtp_to_spatial(wwtp_clean_data)
#> Created spatial WWTP data with 17370 facilities
wwtp_sf_transformed <- sf::st_transform(wwtp_sf, 5070)  # Albers Equal Area Conic
# }
```
