# Complete Agricultural Classification Pipeline with Custom Efficiency Factors

Run complete agricultural nutrient classification analysis for both N
and P with user-specified efficiency factors for sensitivity analysis.

## Usage

``` r
agri_classify_complete_custom(
  nugis_data,
  scale,
  cropland_threshold = NULL,
  county_data = NULL,
  n_efficiency = 0.5,
  p_efficiency = 1
)
```

## Arguments

- nugis_data:

  Data frame. Raw NuGIS data

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

- cropland_threshold:

  Numeric. Optional custom threshold

- county_data:

  Data frame. County data for threshold calculation (if needed)

- n_efficiency:

  Numeric. Nitrogen efficiency factor (default: 0.5)

- p_efficiency:

  Numeric. Phosphorus efficiency factor (default: 1.0)

## Value

Data frame with complete agricultural classifications for both nutrients

## Examples

``` r
# \donttest{
# Load county data
nugis_data <- load_builtin_nugis("county", 2016)
#> Created cache directory: /home/runner/.cache/R/manureshed/data
#> Downloading nugis_county_data from OSF...
#>   File ID: 689a80e81a020593fca5e8b4
#>   Downloaded successfully (1.89 MB)
#> Loaded NuGIS county data for year 2016
#> Number of spatial units: 3058

# Standard analysis
results_standard <- agri_classify_complete_custom(
  nugis_data, "county"
)
#> Starting complete agricultural classification with custom efficiency factors...
#>   Nitrogen efficiency: 0.5
#>   Phosphorus efficiency: 1
#> Processed NuGIS data for county scale:
#>   Spatial units: 3058
#>   Converted P2O5 to P using factor: 0.436
#> Nitrogen classification summary (efficiency = 0.5):
#>   Excluded: 158 units
#>   Sink_Deficit: 2450 units
#>   Sink_Fertilizer: 214 units
#>   Source: 83 units
#>   Within_County: 153 units
#> Phosphorus classification summary (efficiency = 1):
#>   Excluded: 158 units
#>   Sink_Deficit: 1891 units
#>   Sink_Fertilizer: 372 units
#>   Source: 317 units
#>   Within_County: 320 units
#> Agricultural classification complete!
#> Applied threshold: 1235.53 acres

# Sensitivity analysis with varied nitrogen efficiency
results_high_n <- agri_classify_complete_custom(
  nugis_data, "county",
  n_efficiency = 0.7
)
#> Starting complete agricultural classification with custom efficiency factors...
#>   Nitrogen efficiency: 0.7
#>   Phosphorus efficiency: 1
#> Processed NuGIS data for county scale:
#>   Spatial units: 3058
#>   Converted P2O5 to P using factor: 0.436
#> Using custom nitrogen efficiency factor: 0.7
#>   Standard factor is 0.5 representing typical losses
#>   Your factor represents 70% efficiency
#> Nitrogen classification summary (efficiency = 0.7):
#>   Excluded: 158 units
#>   Sink_Deficit: 1922 units
#>   Sink_Fertilizer: 570 units
#>   Source: 137 units
#>   Within_County: 271 units
#> Phosphorus classification summary (efficiency = 1):
#>   Excluded: 158 units
#>   Sink_Deficit: 1891 units
#>   Sink_Fertilizer: 372 units
#>   Source: 317 units
#>   Within_County: 320 units
#> Agricultural classification complete!
#> Applied threshold: 1235.53 acres

# Analysis with both custom efficiencies
results_custom <- agri_classify_complete_custom(
  nugis_data, "county",
  n_efficiency = 0.6,
  p_efficiency = 0.9
)
#> Starting complete agricultural classification with custom efficiency factors...
#>   Nitrogen efficiency: 0.6
#>   Phosphorus efficiency: 0.9
#> Processed NuGIS data for county scale:
#>   Spatial units: 3058
#>   Converted P2O5 to P using factor: 0.436
#> Using custom phosphorus efficiency factor: 0.9
#>   Standard factor is 1.0 (100% efficiency)
#>   Your factor represents 90% efficiency
#> Using custom nitrogen efficiency factor: 0.6
#>   Standard factor is 0.5 representing typical losses
#>   Your factor represents 60% efficiency
#> Nitrogen classification summary (efficiency = 0.6):
#>   Excluded: 158 units
#>   Sink_Deficit: 2209 units
#>   Sink_Fertilizer: 361 units
#>   Source: 109 units
#>   Within_County: 221 units
#> Phosphorus classification summary (efficiency = 0.9):
#>   Excluded: 158 units
#>   Sink_Deficit: 2032 units
#>   Sink_Fertilizer: 295 units
#>   Source: 294 units
#>   Within_County: 279 units
#> Agricultural classification complete!
#> Applied threshold: 1235.53 acres
# }
```
