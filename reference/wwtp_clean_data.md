# Clean WWTP Data

Clean and validate WWTP data for analysis

Clean and validate WWTP data for analysis

## Usage

``` r
wwtp_clean_data(wwtp_data, nutrient)

wwtp_clean_data(wwtp_data, nutrient)
```

## Arguments

- wwtp_data:

  Data frame. Raw or standardized WWTP data

- nutrient:

  Character. "nitrogen" or "phosphorus"

## Value

Data frame with cleaned WWTP data

Data frame with cleaned WWTP data

## Examples

``` r
if (FALSE) { # \dontrun{
# Clean user-loaded data will not run. They need to be supplied by users
clean_data <- wwtp_clean_data(raw_wwtp_data, "nitrogen")

# Clean OSF data (usually already clean, available 2007-2016)
osf_data <- load_builtin_wwtp("phosphorus", 2012)
clean_data <- wwtp_clean_data(osf_data, "phosphorus")
} # }
# \donttest{
# Load and clean WWTP data
raw_wwtp_data <- load_builtin_wwtp("nitrogen", 2016)
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2016
#> Number of facilities: 20846
clean_data <- wwtp_clean_data(raw_wwtp_data, "nitrogen")
#> Cleaning WWTP nitrogen data...
#> Cleaning complete:
#>   Original facilities: 20846
#>   Removed: 3476 (missing data, duplicates, or outside CONUS)
#>   Final facilities: 17370
# }
```
