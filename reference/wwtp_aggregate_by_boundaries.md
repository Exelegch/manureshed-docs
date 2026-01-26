# Aggregate WWTP Data by Spatial Boundaries

Aggregate WWTP loads by spatial units (counties, HUC8s, etc.)

## Usage

``` r
wwtp_aggregate_by_boundaries(wwtp_sf, boundaries, nutrient, boundary_id_col)
```

## Arguments

- wwtp_sf:

  sf object. Spatial WWTP data

- boundaries:

  sf object. Spatial boundaries for aggregation

- nutrient:

  Character. "nitrogen" or "phosphorus"

- boundary_id_col:

  Character. Name of boundary ID column

## Value

Data frame with aggregated loads by spatial unit
