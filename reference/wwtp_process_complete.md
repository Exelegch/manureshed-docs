# Complete WWTP Processing Pipeline

Run complete WWTP processing pipeline for both nutrients

## Usage

``` r
wwtp_process_complete(
  nitrogen_path = NULL,
  phosphorus_path = NULL,
  column_mapping = NULL,
  skip_rows = 0,
  header_row = 1,
  load_units = "kg",
  verbose = TRUE
)
```

## Arguments

- nitrogen_path:

  Character. Path to nitrogen WWTP data (if NULL, loads from OSF)

- phosphorus_path:

  Character. Path to phosphorus WWTP data (if NULL, loads from OSF)

- column_mapping:

  Named list. Custom column mapping for user data

- skip_rows:

  Numeric. Rows to skip in user files

- header_row:

  Numeric. Header row in user files

- load_units:

  Character. Units of loads in user files

- verbose:

  Logical. Show processing messages

## Value

List with processed nitrogen and phosphorus WWTP data

## Examples

``` r
# \donttest{
# Process built-in OSF data (2016 default)
wwtp_results_builtin <- wwtp_process_complete(
  nitrogen_path = NULL,     # Use built-in data
  phosphorus_path = NULL,   # Use built-in data
  verbose = TRUE
)
#> Starting complete WWTP processing pipeline...
#> Loading nitrogen WWTP data from OSF...
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2016
#> Number of facilities: 20846
#> Filtered for positive nitrogen loads:
#>   Original: 20846 facilities
#>   With positive loads: 20846 facilities
#> WWTP nitrogen source classification:
#>   Minor Source: 17801 facilities
#>   Small Source: 1799 facilities
#>   Medium Source: 729 facilities
#>   Large Source: 417 facilities
#>   Very Large Source: 100 facilities
#> Created spatial WWTP data with 20846 facilities
#> Loading phosphorus WWTP data from OSF...
#> Using cached version of wwtp_phosphorus_combined
#> Loaded WWTP phosphorus data for year 2016
#> Number of facilities: 10148
#> Filtered for positive phosphorus loads:
#>   Original: 10148 facilities
#>   With positive loads: 10148 facilities
#> WWTP phosphorus source classification:
#>   Minor Source: 6846 facilities
#>   Small Source: 1839 facilities
#>   Medium Source: 795 facilities
#>   Large Source: 561 facilities
#>   Very Large Source: 107 facilities
#> Created spatial WWTP data with 10148 facilities
#> WWTP processing complete!
#>   Nitrogen facilities: 20846
#>   Phosphorus facilities: 10148

# Process custom user data
# wwtp_results_custom <- wwtp_process_complete(
#   nitrogen_path = "nitrogen_2020.csv",
#   phosphorus_path = "phosphorus_2020.csv",
#   load_units = "lbs"
# )

# Mixed: OSF for one nutrient, custom for another
# wwtp_results_mixed <- wwtp_process_complete(
#   nitrogen_path = NULL,           # Use OSF built-in
#   phosphorus_path = "custom_P.csv" # Use custom
# )
# }
```
