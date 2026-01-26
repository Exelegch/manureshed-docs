# Convert Load Units to Tons

Convert loads from various units to US tons

## Usage

``` r
convert_load_units(load_values, from_unit)
```

## Arguments

- load_values:

  Numeric vector of load values

- from_unit:

  Character. Input unit: "kg", "lbs", "pounds", "tons"

## Value

Numeric vector of loads in US tons

## Examples

``` r
# Convert from kilograms to tons
kg_loads <- c(1000, 2000, 3000)
tons_loads <- convert_load_units(kg_loads, "kg")

# Convert from pounds to tons
lbs_loads <- c(5000, 10000, 15000)
tons_loads <- convert_load_units(lbs_loads, "lbs")
```
