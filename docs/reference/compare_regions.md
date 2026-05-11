# Compare Multiple Regions

Compare Multiple Regions

## Usage

``` r
compare_regions(
  regions,
  scale = "county",
  year = 2016,
  nutrients = "nitrogen",
  include_wwtp = TRUE,
  verbose = TRUE
)
```

## Arguments

- regions:

  Named list of state vectors, or character vector of built-in region
  names

- scale:

  Spatial scale

- year:

  Year to analyze

- nutrients:

  Nutrients to analyze

- include_wwtp:

  Include WWTP?

- verbose:

  Show messages?

## Value

List with regional comparison results

## Examples

``` r
if (FALSE) { # \dontrun{
# Compare built-in regions
comparison <- compare_regions(
  regions = c("corn_belt", "dairy_belt"),
  scale = "county",
  year = 2016,
  nutrients = "nitrogen"
)

# Compare custom regions
comparison <- compare_regions(
  regions = list(
    "Upper Midwest" = c("WI", "MN", "MI"),
    "Lower Midwest" = c("IL", "IN", "OH")
  ),
  scale = "county",
  year = 2016
)

# View comparison
print(comparison$summary)
comparison$plots$bar_chart
} # }
```
