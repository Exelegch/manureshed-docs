# Filter Data by State

Filter spatial data to a specific state

## Usage

``` r
filter_by_state(data, state, scale, boundaries = NULL)
```

## Arguments

- data:

  Data frame or sf object. Spatial data with FIPS or HUC codes

- state:

  Character. Two-letter state abbreviation

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

- boundaries:

  sf object. Spatial boundaries (optional, for HUC scales)

## Value

Filtered data for the specified state
