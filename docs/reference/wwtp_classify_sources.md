# Classify WWTP Sources by Load Size

Classify WWTP facilities into size categories based on annual nutrient
loads

## Usage

``` r
wwtp_classify_sources(wwtp_data, nutrient)
```

## Arguments

- wwtp_data:

  Data frame. WWTP data with load information

- nutrient:

  Character. "nitrogen" or "phosphorus"

## Value

Data frame with source_class column added

## Examples

``` r
# \donttest{
# Load WWTP data first
wwtp_data <- load_builtin_wwtp("nitrogen", 2016)
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2016
#> Number of facilities: 20846

# Classify nitrogen sources
classified_data <- wwtp_classify_sources(wwtp_data, "nitrogen")
#> WWTP nitrogen source classification:
#>   Minor Source: 17801 facilities
#>   Small Source: 1799 facilities
#>   Medium Source: 729 facilities
#>   Large Source: 417 facilities
#>   Very Large Source: 100 facilities
table(classified_data$source_class)
#> 
#>      Minor Source      Small Source     Medium Source      Large Source 
#>             17801              1799               729               417 
#> Very Large Source 
#>               100 
# }
```
