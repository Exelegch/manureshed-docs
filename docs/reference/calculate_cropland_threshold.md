# Calculate Cropland Threshold for Exclusion

Calculate cropland threshold for excluding small agricultural areas Uses
county 500ha baseline to determine percentile for other scales

## Usage

``` r
calculate_cropland_threshold(
  county_data,
  target_data,
  county_cropland_col,
  target_cropland_col,
  baseline_ha = 500
)
```

## Arguments

- county_data:

  Data frame. County-level NuGIS data with cropland column

- target_data:

  Data frame. Target scale data (HUC8, HUC2) with cropland column

- county_cropland_col:

  Character. Name of cropland column in county data

- target_cropland_col:

  Character. Name of cropland column in target data

- baseline_ha:

  Numeric. Baseline cropland in hectares for exclusion (default: 500)

## Value

Numeric. Threshold value for target scale
