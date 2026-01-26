# Complete Agricultural Classification Pipeline

Run complete agricultural nutrient classification analysis for both N
and P

## Usage

``` r
agri_classify_complete(
  nugis_data,
  scale,
  cropland_threshold = NULL,
  county_data = NULL
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

## Value

Data frame with complete agricultural classifications for both nutrients
