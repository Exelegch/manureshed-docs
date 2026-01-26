# Create WWTP Point Map

Create map showing WWTP locations classified by load size

## Usage

``` r
map_wwtp_points(wwtp_sf, nutrient, title)
```

## Arguments

- wwtp_sf:

  sf object. Spatial WWTP data with classifications

- nutrient:

  Character. "nitrogen" or "phosphorus"

- title:

  Character. Map title

## Value

ggplot object
