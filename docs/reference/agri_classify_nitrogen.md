# Classify Agricultural Nitrogen Status

Classify spatial units based on nitrogen balance using standard 0.5
efficiency factor

## Usage

``` r
agri_classify_nitrogen(data, cropland_threshold, scale = "huc8")
```

## Arguments

- data:

  Data frame with processed agricultural data

- cropland_threshold:

  Numeric. Threshold for excluding small cropland areas

- scale:

  Character. Spatial scale for within-unit classification

## Value

Data frame with nitrogen classification added
