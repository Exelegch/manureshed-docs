# Complete Integration Pipeline (Updated)

Run complete integration of WWTP and agricultural data for both
nutrients

## Usage

``` r
integrate_complete(
  agri_data,
  wwtp_nitrogen_aggregated,
  wwtp_phosphorus_aggregated,
  cropland_threshold,
  scale = "huc8",
  add_texas = FALSE,
  year = 2016
)
```

## Arguments

- agri_data:

  Data frame or sf object. Agricultural classification data

- wwtp_nitrogen_aggregated:

  Data frame. Aggregated nitrogen WWTP data

- wwtp_phosphorus_aggregated:

  Data frame. Aggregated phosphorus WWTP data

- cropland_threshold:

  Numeric. Threshold for exclusion

- scale:

  Character. Spatial scale

- add_texas:

  Logical. Whether to add Texas HUC8 data (only for HUC8 scale)

- year:

  Numeric. Year for Texas data

## Value

List with integrated nitrogen and phosphorus data
