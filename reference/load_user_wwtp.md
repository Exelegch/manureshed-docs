# Load User WWTP Data

Load and standardize user-provided WWTP data with flexible formatting

Load and standardize user-provided WWTP data with flexible formatting

## Usage

``` r
load_user_wwtp(
  file_path,
  nutrient,
  column_mapping = NULL,
  skip_rows = 0,
  header_row = 1,
  load_units = "kg"
)

load_user_wwtp(
  file_path,
  nutrient,
  column_mapping = NULL,
  skip_rows = 0,
  header_row = 1,
  load_units = "kg"
)
```

## Arguments

- file_path:

  Character. Path to WWTP data file

- nutrient:

  Character. "nitrogen" or "phosphorus"

- column_mapping:

  Named list. Custom column mapping (optional)

- skip_rows:

  Numeric. Number of rows to skip (default: 0)

- header_row:

  Numeric. Row containing headers (default: 1)

- load_units:

  Character. Units of pollutant loads: "kg", "lbs", "pounds", "tons"

## Value

Data frame with standardized WWTP data

Data frame with standardized WWTP data

## Examples

``` r
if (FALSE) { # \dontrun{
# Standard EPA format but will not run because data needs to be supplied as custom
# Load custom WWTP data (for years outside 2007-2016)
wwtp_data <- load_user_wwtp("nitrogen_2020.csv", "nitrogen")

# For years 2007-2016, consider using built-in data:
# wwtp_builtin <- load_builtin_wwtp("nitrogen", 2015)

# Custom format with different units
wwtp_data <- load_user_wwtp("custom_wwtp.csv", "phosphorus",
                          load_units = "lbs", skip_rows = 3)


# Custom column mapping
custom_map <- list(facility_name = "Plant_Name",
                  pollutant_load = "Load_lbs_per_year")
wwtp_data <- load_user_wwtp("custom.csv", "nitrogen", custom_map)
} # }
if (FALSE) { # \dontrun{

# Standard EPA format
wwtp_data <- load_user_wwtp("nitrogen_2020.csv", "nitrogen")

# Custom format with different units
wwtp_data <- load_user_wwtp("custom_wwtp.csv", "phosphorus",
                          load_units = "lbs", skip_rows = 3)

# Custom column mapping
custom_map <- list(facility_name = "Plant_Name",
                  pollutant_load = "Load_lbs_per_year")
wwtp_data <- load_user_wwtp("custom.csv", "nitrogen", custom_map)
} # }
```
