# Run State-Level Analysis

Run manureshed analysis for a specific state

## Usage

``` r
run_state_analysis(
  state,
  scale = "huc8",
  year = 2016,
  nutrients = c("nitrogen", "phosphorus"),
  include_wwtp = TRUE,
  output_dir = file.path(tempdir(), paste0("state_", tolower(state), "_results")),
  verbose = TRUE,
  ...
)
```

## Arguments

- state:

  Character. Two-letter state abbreviation (e.g., "OH", "TX")

- scale:

  Character. Spatial scale: "county", "huc8", or "huc2"

- year:

  Numeric. Year to analyze

- nutrients:

  Character vector. Nutrients to analyze

- include_wwtp:

  Logical. Whether to include WWTP analysis

- output_dir:

  Character. Output directory

- verbose:

  Logical. Show progress messages

- ...:

  Additional arguments passed to run_builtin_analysis

## Value

List with analysis results for the state

## Examples

``` r
# \donttest{
# Use Texas which has more data
texas_results <- run_state_analysis(
  state = "TX",
  scale = "county",  # Use county for faster processing
  year = 2016,
  nutrients = "nitrogen",  # Single nutrient for speed
  include_wwtp = TRUE
)
#> 
#> ======================================================================
#> STATE-LEVEL MANURESHED ANALYSIS
#> ======================================================================
#> State:TX
#> Scale:county
#> Year:2016
#> ----------------------------------------------------------------------
#> Loading national data...
#> Filtering to stateTX...
#> Filtered to state TX: 248 spatial units
#> Filtered to state TX: 254 spatial units
#> Processing agricultural classifications...
#> Starting complete agricultural classification for county scale...
#> Processed NuGIS data for county scale:
#>   Spatial units: 248
#>   Converted P2O5 to P using factor: 0.436
#> Nitrogen classification summary:
#>   Excluded: 9 units
#>   Sink_Deficit: 199 units
#>   Sink_Fertilizer: 22 units
#>   Source: 5 units
#>   Within_County: 13 units
#> Phosphorus classification summary:
#>   Excluded: 9 units
#>   Sink_Deficit: 126 units
#>   Sink_Fertilizer: 28 units
#>   Source: 35 units
#>   Within_County: 50 units
#> Agricultural classification complete!
#> Applied threshold: 1235.53 acres
#> Processing state WWTP data...
#> Filtered for positive nitrogen loads:
#>   Original: 1397 facilities
#>   With positive loads: 1397 facilities
#> WWTP nitrogen source classification:
#>   Minor Source: 1323 facilities
#>   Small Source: 52 facilities
#>   Medium Source: 15 facilities
#>   Large Source: 7 facilities
#>   Very Large Source: 0 facilities
#> Created spatial WWTP data with 1397 facilities
#> Looking for boundary ID column: 'FIPS'
#> Available columns in boundaries: FIPS, County, State_Name, geometry
#> Aggregating WWTP nitrogen loads by spatial boundaries...
#> Aggregation complete:
#>   WWTP facilities: 1397
#>   Spatial units with facilities: 176
#>   Total nitrogen load: 6377.22 tons/year
#> Integrating WWTP and agricultural data...
#> Integrating WWTP nitrogen data with agricultural classifications...
#> Using agricultural ID column: FIPS
#> Combined nitrogen classification summary:
#>   Excluded: 9 units
#>   Sink_Deficit: 197 units
#>   Sink_Fertilizer: 21 units
#>   Source: 8 units
#>   Within_County: 19 units
#> 
#> ======================================================================
#> STATE ANALYSIS COMPLETE
#> ======================================================================
#> State:TX
#> Spatial units:254
#> WWTP facilities:1397
#> ======================================================================

# California county-level analysis
ca_results <- run_state_analysis(
  state = "CA",
  scale = "county",
  year = 2010,
  nutrients = "nitrogen"
)
#> 
#> ======================================================================
#> STATE-LEVEL MANURESHED ANALYSIS
#> ======================================================================
#> State:CA
#> Scale:county
#> Year:2010
#> ----------------------------------------------------------------------
#> Loading national data...
#> Filtering to stateCA...
#> Filtered to state CA: 57 spatial units
#> Filtered to state CA: 58 spatial units
#> Processing agricultural classifications...
#> Starting complete agricultural classification for county scale...
#> Processed NuGIS data for county scale:
#>   Spatial units: 57
#>   Converted P2O5 to P using factor: 0.436
#> Nitrogen classification summary:
#>   Excluded: 7 units
#>   Sink_Deficit: 32 units
#>   Sink_Fertilizer: 15 units
#>   Source: 1 units
#>   Within_County: 2 units
#> Phosphorus classification summary:
#>   Excluded: 7 units
#>   Sink_Deficit: 18 units
#>   Sink_Fertilizer: 15 units
#>   Source: 9 units
#>   Within_County: 8 units
#> Agricultural classification complete!
#> Applied threshold: 1235.53 acres
#> Processing state WWTP data...
#> Filtered for positive nitrogen loads:
#>   Original: 549 facilities
#>   With positive loads: 549 facilities
#> WWTP nitrogen source classification:
#>   Minor Source: 260 facilities
#>   Small Source: 144 facilities
#>   Medium Source: 70 facilities
#>   Large Source: 60 facilities
#>   Very Large Source: 15 facilities
#> Created spatial WWTP data with 549 facilities
#> Looking for boundary ID column: 'FIPS'
#> Available columns in boundaries: FIPS, County, State_Name, geometry
#> Aggregating WWTP nitrogen loads by spatial boundaries...
#> Aggregation complete:
#>   WWTP facilities: 549
#>   Spatial units with facilities: 42
#>   Total nitrogen load: 93743.95 tons/year
#> Integrating WWTP and agricultural data...
#> Integrating WWTP nitrogen data with agricultural classifications...
#> Using agricultural ID column: FIPS
#> Combined nitrogen classification summary:
#>   Excluded: 7 units
#>   Sink_Deficit: 30 units
#>   Sink_Fertilizer: 9 units
#>   Source: 7 units
#>   Within_County: 5 units
#> 
#> ======================================================================
#> STATE ANALYSIS COMPLETE
#> ======================================================================
#> State:CA
#> Spatial units:58
#> WWTP facilities:549
#> ======================================================================
# }
```
