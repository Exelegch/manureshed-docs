# Score County-Level Nutrient Recovery Hub Sites

Implements a 3-scenario x 3-nutrient scoring framework to rank all CONUS
counties as potential nutrient recovery hub locations. Takes the output
of
[`run_builtin_analysis`](https://exelegch.github.io/manureshed-docs/reference/run_builtin_analysis.md)
directly; year and spatial scale are controlled upstream.

## Usage

``` r
score_hub_sites(
  ms_output,
  cafo_data = NULL,
  cdl_path = NULL,
  catchment_miles = 50,
  scores = "all",
  top_n = 10,
  cdl_aggregate_factor = 10,
  n_threads = 1,
  verbose = TRUE
)
```

## Arguments

- ms_output:

  List. Output of
  `run_builtin_analysis( scale = "county", include_wwtp = TRUE)`.

- cafo_data:

  Character, data.frame, or `NULL`. Local path to `cafo.rds` /
  `cafo.csv`, a data.frame, or `NULL` to auto-download. Must contain
  `lon` / `lat` columns (WGS84).

- cdl_path:

  Character or `NULL`. CONUS CDL GeoTIFF (30 m). When supplied: (1)
  refines demand by cropland intensity, and (2) adds top-3 crop type
  profiles for every top-N county. Requires terra and exactextractr.

- catchment_miles:

  Numeric. Catchment radius in miles for transport centrality, demand
  calculations, and crop profile buffers. Default `50`.

- scores:

  Character vector or `"all"`. Scores to compute. Default `"all"`.

- top_n:

  Integer. Top-ranked sites per score. Default `10`.

- cdl_aggregate_factor:

  Integer. CDL aggregation factor for intensity fraction calculation.
  Default `10` (30 m -\> 300 m). The original (non-aggregated) raster is
  used for crop profile extraction to preserve crop-type detail.

- n_threads:

  Integer. Threads for terra. Default `1`.

- verbose:

  Logical. Default `TRUE`.

## Value

A list of class `"manureshed_hub"` with elements `master`, `scored_sf`,
`top_n`, `robustness`, `cafo_validation`, `score_registry`, `params`.
When CDL is supplied, each `top_n` table includes a `top3_crops` column
listing the dominant crop types within the catchment radius.

## Performance

A single county-to-county distance matrix is computed once and reused
for all catchment calculations, minimising expensive spatial operations.

## CDL usage

When `cdl_path` is supplied the CDL raster is used for two purposes:

1.  Cropland intensity fraction per county, which weights the demand
    signal (all counties).

2.  Top-3 dominant crop types within `catchment_miles` of each top-N hub
    county, added as a `top3_crops` column in every `top_n` table.

## Scoring framework

|            |         |         |                |
|------------|---------|---------|----------------|
|            | **N**   | **P**   | **N & P**      |
| S1 Ag      | Score 1 | Score 2 | Score 3        |
| S2 WWTP    | Score 4 | Score 5 | Score 6        |
| S3 Ag+WWTP | Score 7 | Score 8 | Score 9 **\*** |

Score 9 (8 equal-weight dimensions) is the flagship recommendation.

## See also

[`download_cafo_data`](https://exelegch.github.io/manureshed-docs/reference/download_cafo_data.md),
[`map_hub_sites`](https://exelegch.github.io/manureshed-docs/reference/map_hub_sites.md),
[`export_hub_results`](https://exelegch.github.io/manureshed-docs/reference/export_hub_results.md)

## Examples

``` r
# \donttest{
ms  <- run_builtin_analysis("county", 2016,
         c("nitrogen","phosphorus"), include_wwtp = TRUE)
#> 
#> ======================================================================
#> BATCH MANURESHED ANALYSIS
#> ======================================================================
#> Year: 2016
#> Scale: county
#> Nutrients: nitrogen, phosphorus
#> ----------------------------------------------------------------------
#> Checking data availability...
#> Data availability confirmed
#>   Available scales:county, huc8, huc2
#>   Available years forcounty:1987-2016
#>   Built-in WWTP data:Available (2007-2016)
#> 
#> Loading built-in NuGIS data...
#> Using cached version of nugis_county_data
#> Loaded NuGIS county data for year 2016
#> Number of spatial units: 3058
#> Loading built-in spatial boundaries...
#> Using cached version of county_boundaries
#> Loaded county boundaries
#> Number of spatial units: 3112
#> Calculating cropland threshold...
#> Cropland threshold:1235.53acres
#> 
#> Processing agricultural classifications...
#> Starting complete agricultural classification for county scale...
#> Processed NuGIS data for county scale:
#>   Spatial units: 3058
#>   Converted P2O5 to P using factor: 0.436
#> Nitrogen classification summary:
#>   Excluded: 158 units
#>   Sink_Deficit: 2450 units
#>   Sink_Fertilizer: 214 units
#>   Source: 83 units
#>   Within_County: 153 units
#> Phosphorus classification summary:
#>   Excluded: 158 units
#>   Sink_Deficit: 1891 units
#>   Sink_Fertilizer: 372 units
#>   Source: 317 units
#>   Within_County: 320 units
#> Agricultural classification complete!
#> Applied threshold: 1235.53 acres
#> Agricultural classification complete
#>   Spatial units processed:3112
#>   Nitrogen classes:Excluded ( 212 ), Sink_Deficit ( 2450 ), Sink_Fertilizer ( 214 ), Source ( 83 ), Within_County ( 153 )
#>   Phosphorus classes:Excluded ( 212 ), Sink_Deficit ( 1891 ), Sink_Fertilizer ( 372 ), Source ( 317 ), Within_County ( 320 )
#> 
#> Processing WWTP data...
#>   Nutrients:nitrogen, phosphorus
#>   WWTP year:2016
#>   Load units:kg
#>   Data source:Built-in (2016)
#>   Loading built-in nitrogen WWTP data for2016...
#> Using cached version of wwtp_nitrogen_combined
#> Loaded WWTP nitrogen data for year 2016
#> Number of facilities: 20846
#>   Loading built-in phosphorus WWTP data for2016...
#> Using cached version of wwtp_phosphorus_combined
#> Loaded WWTP phosphorus data for year 2016
#> Number of facilities: 10148
#>   Processing nitrogen WWTP facilities...
#> Filtered for positive nitrogen loads:
#>   Original: 20846 facilities
#>   With positive loads: 20846 facilities
#> WWTP nitrogen source classification:
#>   Minor Source: 17801 facilities
#>   Small Source: 1799 facilities
#>   Medium Source: 729 facilities
#>   Large Source: 417 facilities
#>   Very Large Source: 100 facilities
#> Created spatial WWTP data with 20846 facilities
#> Looking for boundary ID column: 'FIPS'
#> Available columns in boundaries: FIPS, County, State_Name, geometry
#> Aggregating WWTP nitrogen loads by spatial boundaries...
#> Aggregation complete:
#>   WWTP facilities: 20846
#>   Spatial units with facilities: 2581
#>   Total nitrogen load: 582738.6 tons/year
#>   Processing phosphorus WWTP facilities...
#> Filtered for positive phosphorus loads:
#>   Original: 10148 facilities
#>   With positive loads: 10148 facilities
#> WWTP phosphorus source classification:
#>   Minor Source: 6846 facilities
#>   Small Source: 1839 facilities
#>   Medium Source: 795 facilities
#>   Large Source: 561 facilities
#>   Very Large Source: 107 facilities
#> Created spatial WWTP data with 10148 facilities
#> Looking for boundary ID column: 'FIPS'
#> Available columns in boundaries: FIPS, County, State_Name, geometry
#> Aggregating WWTP phosphorus loads by spatial boundaries...
#> Aggregation complete:
#>   WWTP facilities: 10148
#>   Spatial units with facilities: 1966
#>   Total phosphorus load: 177064.66 tons/year
#> WWTP data processing complete
#>   nitrogen:20846facilities in2581spatial units
#>   phosphorus:10148facilities in1966spatial units
#> 
#> Integrating WWTP and agricultural data...
#> Integrating WWTP nitrogen data with agricultural classifications...
#> Using agricultural ID column: FIPS
#> Combined nitrogen classification summary:
#>   Excluded: 212 units
#>   Sink_Deficit: 2358 units
#>   Sink_Fertilizer: 185 units
#>   Source: 157 units
#>   Within_County: 200 units
#> Integrating WWTP phosphorus data with agricultural classifications...
#> Using agricultural ID column: FIPS
#> Combined phosphorus classification summary:
#>   Excluded: 212 units
#>   Sink_Deficit: 1819 units
#>   Sink_Fertilizer: 344 units
#>   Source: 389 units
#>   Within_County: 348 units
#>  Integration complete
#> 
#> Saving results...
#> Saved spatial data to: /tmp/RtmpUzSF9u/county_agricultural_2016.rds
#> File size: 1.04 MB
#> Rows: 3112, Columns: 17
#> Geometry type: POLYGON
#> CRS: EPSG:5070
#> Saved spatial data to: /tmp/RtmpUzSF9u/county_nitrogen_integrated_2016.rds
#> File size: 1.1 MB
#> Rows: 3112, Columns: 23
#> Geometry type: POLYGON
#> CRS: EPSG:5070
#> Saved centroid data to: /tmp/RtmpUzSF9u/county_nitrogen_centroids_2016.csv
#> File size: 760.52 KB
#> Rows: 3112, Columns: 24
#> Longitude range: [-124.158, -67.637]
#> Latitude range: [25.49, 48.826]
#> Saved spatial data to: /tmp/RtmpUzSF9u/county_phosphorus_integrated_2016.rds
#> File size: 1.09 MB
#> Rows: 3112, Columns: 23
#> Geometry type: POLYGON
#> CRS: EPSG:5070
#> Saved centroid data to: /tmp/RtmpUzSF9u/county_phosphorus_centroids_2016.csv
#> File size: 736.85 KB
#> Rows: 3112, Columns: 24
#> Longitude range: [-124.158, -67.637]
#> Latitude range: [25.49, 48.826]
#> Saved analysis summary to: /tmp/RtmpUzSF9u/analysis_summary_2016.rds
#> Format: RDS
#> File size: 0.76 KB
#>  Results saved to:/tmp/RtmpUzSF9u
#>   Files created:6
#> 
#> ======================================================================
#> ANALYSIS COMPLETE
#> ======================================================================
#> Processing time:0.08minutes
#> Scale:county
#> Year:2016
#> Nutrients analyzed:nitrogen, phosphorus
#> Spatial units:3112
#> WWTP facilities:30994
#> Output directory:/tmp/RtmpUzSF9u
#> ======================================================================
hub <- score_hub_sites(ms)
#> 
#> Step 1: 3112 counties loaded.
#> Step 2: Loading CAFO data...
#> CAFO data already cached: /tmp/RtmpUzSF9u/manureshed/data/cafo_detections.rds
#>   325249 detections -> 3074 counties with CAFOs.
#> Step 3: Demand layer (uniform weight)
#> Step 4: Computing distance matrix (once)...
#> Warning: st_centroid assumes attributes are constant over geometries
#>   Transport centrality...
#>   N demand catchment...
#>   P demand catchment...
#>   N demand counties > 0: 3104
#>   P demand counties > 0: 3090
#> Step 5: Assembling master table...
#> Step 6: Computing 9 scores...
#>   Score1_S1_N (4 dims)
#>   Score2_S1_P (4 dims)
#>   Score3_S1_NP (6 dims)
#>   Score4_S2_N (4 dims)
#>   Score5_S2_P (4 dims)
#>   Score6_S2_NP (7 dims)
#>   Score7_S3_N (5 dims)
#>   Score8_S3_P (5 dims)
#>   Score9_S3_NP (8 dims)
#> Step 7: CAFO validation...
#> Step 8: Top-10 per score...
#> 
#> ==================================================
#> Hub scoring complete.
#> Top-3 Score 9 flagship:
#>   #1 Sanilac, Michigan (0.883)
#>   #2 Lancaster, Nebraska (0.847)
#>   #3 Los Angeles, California (0.834)
#> ==================================================
print(hub)
#> manureshed hub site scoring
#> -------------------------------------- 
#> Scores computed  : 9 
#> Counties scored  : 3112 
#> Catchment radius : 50 miles
#> CDL used         : FALSE 
#> Timestamp        : 2026-05-11 11:40 
#> 
#> Top-3 (Score 9 flagship):
#>   #1 Sanilac, Michigan (0.883)
#>   #2 Lancaster, Nebraska (0.847)
#>   #3 Los Angeles, California (0.834)
#> 
#> map_hub_sites()  export_hub_results()

# Custom catchment, single score
hub <- score_hub_sites(ms, catchment_miles = 75,
                       scores = "Score9_S3_NP")
#> 
#> Step 1: 3112 counties loaded.
#> Step 2: Loading CAFO data...
#> CAFO data already cached: /tmp/RtmpUzSF9u/manureshed/data/cafo_detections.rds
#>   325249 detections -> 3074 counties with CAFOs.
#> Step 3: Demand layer (uniform weight)
#> Step 4: Computing distance matrix (once)...
#> Warning: st_centroid assumes attributes are constant over geometries
#>   Transport centrality...
#>   N demand catchment...
#>   P demand catchment...
#>   N demand counties > 0: 3108
#>   P demand counties > 0: 3105
#> Step 5: Assembling master table...
#> Step 6: Computing 1 scores...
#>   Score9_S3_NP (8 dims)
#> Step 8: Top-10 per score...
#> 
#> ==================================================
#> Hub scoring complete.
#> Top-3 Score 9 flagship:
#>   #1 Sanilac, Michigan (0.879)
#>   #2 Lancaster, Nebraska (0.85)
#>   #3 Frederick, Maryland (0.825)
#> ==================================================

# With CDL: adds crop profiles to top_n tables
hub <- score_hub_sites(ms, cdl_path = "path/to/cdl_2016.tif")
#> 
#> Step 1: 3112 counties loaded.
#> Step 2: Loading CAFO data...
#> CAFO data already cached: /tmp/RtmpUzSF9u/manureshed/data/cafo_detections.rds
#>   325249 detections -> 3074 counties with CAFOs.
#> Step 3: Demand layer (CDL)
#> Error: CDL raster not found: path/to/cdl_2016.tif
hub$top_n[["Score9_S3_NP"]][, c("NAME", "State_Name", "top3_crops")]
#> Error in hub$top_n[["Score9_S3_NP"]][, c("NAME", "State_Name", "top3_crops")]: Can't subset columns that don't exist.
#> ✖ Column `top3_crops` doesn't exist.
# }
```
