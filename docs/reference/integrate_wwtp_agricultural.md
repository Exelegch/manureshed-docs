# Integrate WWTP Data with Agricultural Classifications (Updated)

Combine WWTP loads with agricultural nutrient balance classifications

## Usage

``` r
integrate_wwtp_agricultural(
  agri_data,
  wwtp_aggregated,
  nutrient,
  cropland_threshold,
  scale = "huc8"
)
```

## Arguments

- agri_data:

  Data frame. Agricultural classification data

- wwtp_aggregated:

  Data frame. Aggregated WWTP loads by spatial unit

- nutrient:

  Character. "nitrogen" or "phosphorus"

- cropland_threshold:

  Numeric. Threshold for exclusion classification

- scale:

  Character. Spatial scale for within-unit classification

## Value

Data frame with combined WWTP + agricultural classifications
