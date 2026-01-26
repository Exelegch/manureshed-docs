# Get Cropland Threshold by Scale

Get appropriate cropland threshold based on spatial scale

## Usage

``` r
get_cropland_threshold(
  scale,
  county_data = NULL,
  target_data = NULL,
  baseline_ha = 500
)
```

## Arguments

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

- county_data:

  Data frame. County-level data (required for huc8/huc2)

- target_data:

  Data frame. Target scale data (required for huc8/huc2)

- baseline_ha:

  Numeric. Baseline for county exclusion (default: 500)

## Value

Numeric. Threshold value
