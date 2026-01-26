# Classify Agricultural Phosphorus Status with Custom Efficiency Factor

Classify spatial units based on phosphorus balance with user-specified
efficiency factor. While standard phosphorus classification uses 100\\
allows sensitivity analysis by varying the phosphorus efficiency
assumption for different management scenarios or application methods.

## Usage

``` r
agri_classify_phosphorus_custom(
  data,
  cropland_threshold,
  scale = "huc8",
  p_efficiency = 1
)
```

## Arguments

- data:

  Data frame with processed agricultural data

- cropland_threshold:

  Numeric. Threshold for excluding small cropland areas

- scale:

  Character. Spatial scale for within-unit classification

- p_efficiency:

  Numeric. Phosphorus efficiency factor (default: 1.0, range: 0-1)

## Value

Data frame with phosphorus classification added

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

# Standard analysis with default 1.0 efficiency (100%)
results_default <- agri_classify_phosphorus_custom(
  processed_data, cropland_threshold = cropland_threshold, p_efficiency = 1.0
)
#> Phosphorus classification summary (efficiency = 1):
#>   Excluded: 158 units
#>   Sink_Deficit: 1891 units
#>   Sink_Fertilizer: 372 units
#>   Source: 317 units
#>   Within_Watershed: 320 units

# Analysis with reduced efficiency (e.g., accounting for losses)
results_reduced <- agri_classify_phosphorus_custom(
  processed_data, cropland_threshold = cropland_threshold, p_efficiency = 0.8
)
#> Using custom phosphorus efficiency factor: 0.8
#>   Standard factor is 1.0 (100% efficiency)
#>   Your factor represents 80% efficiency
#> Phosphorus classification summary (efficiency = 0.8):
#>   Excluded: 158 units
#>   Sink_Deficit: 2187 units
#>   Sink_Fertilizer: 232 units
#>   Source: 255 units
#>   Within_Watershed: 226 units

# Conservative analysis with lower efficiency
results_conservative <- agri_classify_phosphorus_custom(
  processed_data, cropland_threshold = cropland_threshold, p_efficiency = 0.6
)
#> Using custom phosphorus efficiency factor: 0.6
#>   Standard factor is 1.0 (100% efficiency)
#>   Your factor represents 60% efficiency
#> Phosphorus classification summary (efficiency = 0.6):
#>   Excluded: 158 units
#>   Sink_Deficit: 2444 units
#>   Sink_Fertilizer: 119 units
#>   Source: 198 units
#>   Within_Watershed: 139 units

# Compare classification changes across efficiency scenarios
table(results_default$P_class)
#> 
#>         Excluded     Sink_Deficit  Sink_Fertilizer           Source 
#>              158             1891              372              317 
#> Within_Watershed 
#>              320 
table(results_reduced$P_class)
#> 
#>         Excluded     Sink_Deficit  Sink_Fertilizer           Source 
#>              158             2187              232              255 
#> Within_Watershed 
#>              226 
table(results_conservative$P_class)
#> 
#>         Excluded     Sink_Deficit  Sink_Fertilizer           Source 
#>              158             2444              119              198 
#> Within_Watershed 
#>              139 
# }
```
