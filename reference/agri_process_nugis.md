# Process NuGIS Data for Manureshed Analysis

Clean and standardize NuGIS data for agricultural nutrient analysis

## Usage

``` r
agri_process_nugis(nugis_data, scale)
```

## Arguments

- nugis_data:

  Data frame. Raw NuGIS data for specified year

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

## Value

Data frame with standardized columns for analysis
