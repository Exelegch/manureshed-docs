# Classify Agricultural Nitrogen Status with Custom Efficiency Factor

Classify spatial units based on nitrogen balance with user-specified
efficiency factor. This function allows sensitivity analysis by varying
the nitrogen efficiency assumption. The default value of 0.5 represents
typical losses during nutrient cycling, uptake, and application, but
regional conditions may warrant different values.

## Usage

``` r
agri_classify_nitrogen_custom(
  data,
  cropland_threshold,
  scale = "huc8",
  n_efficiency = 0.5
)
```

## Arguments

- data:

  Data frame with processed agricultural data

- cropland_threshold:

  Numeric. Threshold for excluding small cropland areas

- scale:

  Character. Spatial scale for within-unit classification

- n_efficiency:

  Numeric. Nitrogen efficiency factor (default: 0.5, range: 0-1)

## Value

Data frame with nitrogen classification added

## Examples

``` r
# \donttest{
# Load and process data first
nugis_data <- load_builtin_nugis("county", 2016)
#> Using cached version of nugis_county_data
#> Loaded NuGIS county data for year 2016
#> Number of spatial units: 3058
processed_data <- agri_process_nugis(nugis_data, "county")
#> Processed NuGIS data for county scale:
#>   Spatial units: 3058
#>   Converted P2O5 to P using factor: 0.436
cropland_threshold <- 500 * 2.47105  # 500 ha in acres

# Standard analysis with default 0.5 efficiency
results_default <- agri_classify_nitrogen_custom(
  processed_data, cropland_threshold = cropland_threshold, n_efficiency = 0.5
)
#> Nitrogen classification summary (efficiency = 0.5):
#>   Excluded: 158 units
#>   Sink_Deficit: 2450 units
#>   Sink_Fertilizer: 214 units
#>   Source: 83 units
#>   Within_Watershed: 153 units

# Sensitivity analysis with higher efficiency (e.g., improved management)
results_high <- agri_classify_nitrogen_custom(
  processed_data, cropland_threshold = cropland_threshold, n_efficiency = 0.7
)
#> Using custom nitrogen efficiency factor: 0.7
#>   Standard factor is 0.5 representing typical losses
#>   Your factor represents 70% efficiency
#> Nitrogen classification summary (efficiency = 0.7):
#>   Excluded: 158 units
#>   Sink_Deficit: 1922 units
#>   Sink_Fertilizer: 570 units
#>   Source: 137 units
#>   Within_Watershed: 271 units

# Conservative analysis with lower efficiency
results_low <- agri_classify_nitrogen_custom(
  processed_data, cropland_threshold = cropland_threshold, n_efficiency = 0.3
)
#> Using custom nitrogen efficiency factor: 0.3
#>   Standard factor is 0.5 representing typical losses
#>   Your factor represents 30% efficiency
#> Nitrogen classification summary (efficiency = 0.3):
#>   Excluded: 158 units
#>   Sink_Deficit: 2753 units
#>   Sink_Fertilizer: 71 units
#>   Source: 39 units
#>   Within_Watershed: 37 units

# Compare classification changes across efficiency scenarios
table(results_default$N_class)
#> 
#>         Excluded     Sink_Deficit  Sink_Fertilizer           Source 
#>              158             2450              214               83 
#> Within_Watershed 
#>              153 
table(results_high$N_class)
#> 
#>         Excluded     Sink_Deficit  Sink_Fertilizer           Source 
#>              158             1922              570              137 
#> Within_Watershed 
#>              271 
table(results_low$N_class)
#> 
#>         Excluded     Sink_Deficit  Sink_Fertilizer           Source 
#>              158             2753               71               39 
#> Within_Watershed 
#>               37 
# }
```
