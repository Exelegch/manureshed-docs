# Map WWTP Column Names to Standard Format

Create mapping between EPA WWTP data column names and standardized
format. Handles various EPA data formats across different years.

## Usage

``` r
map_wwtp_columns(raw_data, nutrient, custom_mapping = NULL)
```

## Arguments

- raw_data:

  Data frame. Raw WWTP data

- nutrient:

  Character. "nitrogen" or "phosphorus"

- custom_mapping:

  Named list. Custom column mappings (optional)

## Value

Named list with column mappings

## Examples

``` r
if (FALSE) { # \dontrun{
mapping <- map_wwtp_columns(raw_wwtp_data, "nitrogen")

# Custom mapping for different format
custom_map <- list(facility_name = "Plant_Name",
                  pollutant_load = "Annual_Load_kg")
mapping <- map_wwtp_columns(raw_data, "nitrogen", custom_map)
} # }
```
