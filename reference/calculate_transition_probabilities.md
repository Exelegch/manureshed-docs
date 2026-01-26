# Calculate Spatial Transition Probabilities

Calculate transition probabilities between adjacent spatial units

## Usage

``` r
calculate_transition_probabilities(
  data,
  class_column,
  longitude_col = "longitude",
  latitude_col = "latitude"
)
```

## Arguments

- data:

  Data frame. Data with classification and coordinate columns

- class_column:

  Character. Name of classification column

- longitude_col:

  Character. Name of longitude column (default: "longitude")

- latitude_col:

  Character. Name of latitude column (default: "latitude")

## Value

Data frame with transition probabilities as percentages
