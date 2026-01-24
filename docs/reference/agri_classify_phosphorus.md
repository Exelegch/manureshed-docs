# Classify Agricultural Phosphorus Status

Classify spatial units based on phosphorus balance (no efficiency factor
for P)

## Usage

``` r
agri_classify_phosphorus(data, cropland_threshold, scale = "huc8")
```

## Arguments

- data:

  Data frame with processed agricultural data

- cropland_threshold:

  Numeric. Threshold for excluding small cropland areas

- scale:

  Character. Spatial scale for within-unit classification

## Value

Data frame with phosphorus classification added
