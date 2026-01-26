# Launch Interactive Manureshed Dashboard

Opens an interactive Shiny dashboard for exploring nutrient balance data
without writing R code. Users can select analysis parameters, view
interactive maps, explore statistics, and download results.

## Usage

``` r
launch_dashboard(port = NULL, launch.browser = TRUE)
```

## Arguments

- port:

  Integer. Port number for the Shiny server (default: random available
  port)

- launch.browser:

  Logical. Open browser automatically? (default: TRUE)

## Value

NULL (invisibly). Launches the Shiny application.

## Details

This function launches an interactive dashboard with the following
features:

- Select analysis parameters (year, scale, nutrients, WWTP inclusion)

- View interactive maps of nutrient classifications

- Explore summary statistics and distributions

- Browse results in interactive data tables

- Download results as CSV files

- Generate and download PDF reports

The dashboard requires several suggested packages. If not installed,
run:
`install.packages(c("shiny", "shinydashboard", "leaflet", "plotly", "DT"))`

## Examples

``` r
if (FALSE) { # \dontrun{
# Launch the dashboard (requires suggested packages)
launch_dashboard()

# Launch on specific port
launch_dashboard(port = 3838)
} # }
```
