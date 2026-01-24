# manureshed: Manureshed Analysis with WWTP Integration

This package provides comprehensive tools for analyzing agricultural
nutrient balances at multiple spatial scales with optional integration
of wastewater treatment plant (WWTP) nutrient loads for both nitrogen
and phosphorus.

## Details

All datasets are downloaded on-demand from OSF repository to minimize
package size while maintaining full functionality.

## Main Functions

### Data Loading and Management:

- [`load_builtin_nugis`](https://cwru-sdle.github.io/manureshed/reference/load_builtin_nugis.md):
  Load NuGIS data from OSF

- [`load_builtin_boundaries`](https://cwru-sdle.github.io/manureshed/reference/load_builtin_boundaries.md):
  Load spatial boundaries from OSF

- [`load_builtin_wwtp`](https://cwru-sdle.github.io/manureshed/reference/load_builtin_wwtp.md):
  Load WWTP data from OSF (2016)

- [`check_builtin_data`](https://cwru-sdle.github.io/manureshed/reference/check_builtin_data.md):
  Check available datasets and cache status

- [`download_all_data`](https://cwru-sdle.github.io/manureshed/reference/download_all_data.md):
  Download all datasets at once

- [`download_osf_data`](https://cwru-sdle.github.io/manureshed/reference/download_osf_data.md):
  Download specific dataset

- [`clear_data_cache`](https://cwru-sdle.github.io/manureshed/reference/clear_data_cache.md):
  Clear cached datasets

### High-Level Workflows:

- [`run_builtin_analysis`](https://cwru-sdle.github.io/manureshed/reference/run_builtin_analysis.md):
  Complete end-to-end analysis workflow

- [`quick_analysis`](https://cwru-sdle.github.io/manureshed/reference/quick_analysis.md):
  Analysis with automatic visualizations

- [`batch_analysis_years`](https://cwru-sdle.github.io/manureshed/reference/batch_analysis_years.md):
  Multi-year analysis workflow

### Agricultural Classification:

- [`agri_process_nugis`](https://cwru-sdle.github.io/manureshed/reference/agri_process_nugis.md):
  Process and standardize NuGIS data

- [`agri_classify_nitrogen`](https://cwru-sdle.github.io/manureshed/reference/agri_classify_nitrogen.md):
  Classify nitrogen balance

- [`agri_classify_phosphorus`](https://cwru-sdle.github.io/manureshed/reference/agri_classify_phosphorus.md):
  Classify phosphorus balance

- [`agri_classify_complete`](https://cwru-sdle.github.io/manureshed/reference/agri_classify_complete.md):
  Complete agricultural pipeline

### WWTP Processing:

- [`load_user_wwtp`](https://cwru-sdle.github.io/manureshed/reference/load_user_wwtp.md):
  Load custom WWTP data with flexible formatting

- [`wwtp_clean_data`](https://cwru-sdle.github.io/manureshed/reference/wwtp_clean_data.md):
  Clean and filter WWTP data

- [`wwtp_classify_sources`](https://cwru-sdle.github.io/manureshed/reference/wwtp_classify_sources.md):
  Classify WWTP facilities by load size

- [`convert_load_units`](https://cwru-sdle.github.io/manureshed/reference/convert_load_units.md):
  Handle different load units (kg, lbs, tons)

### Data Integration:

- [`integrate_wwtp_agricultural`](https://cwru-sdle.github.io/manureshed/reference/integrate_wwtp_agricultural.md):
  Combine WWTP and agricultural data

- [`integrate_complete`](https://cwru-sdle.github.io/manureshed/reference/integrate_complete.md):
  Complete integration pipeline

- [`add_texas_huc8`](https://cwru-sdle.github.io/manureshed/reference/add_texas_huc8.md):
  Add Texas HUC8 supplemental data

### Visualization and Mapping:

- [`map_agricultural_classification`](https://cwru-sdle.github.io/manureshed/reference/map_agricultural_classification.md):
  Map nutrient classifications

- [`map_wwtp_points`](https://cwru-sdle.github.io/manureshed/reference/map_wwtp_points.md):
  Map WWTP facility locations

- [`map_wwtp_influence`](https://cwru-sdle.github.io/manureshed/reference/map_wwtp_influence.md):
  Map WWTP influence/proportion

- [`get_state_boundaries`](https://cwru-sdle.github.io/manureshed/reference/get_state_boundaries.md):
  Get US state boundaries for mapping

### Spatial Analysis:

- [`calculate_transition_probabilities`](https://cwru-sdle.github.io/manureshed/reference/calculate_transition_probabilities.md):
  Spatial transition analysis

- [`create_network_plot`](https://cwru-sdle.github.io/manureshed/reference/create_network_plot.md):
  Network visualization of transitions

- [`add_centroid_coordinates`](https://cwru-sdle.github.io/manureshed/reference/add_centroid_coordinates.md):
  Calculate spatial centroids

### Comparison Analysis:

- [`create_classification_summary`](https://cwru-sdle.github.io/manureshed/reference/create_classification_summary.md):
  Before/after comparison summaries

- [`plot_before_after_comparison`](https://cwru-sdle.github.io/manureshed/reference/plot_before_after_comparison.md):
  Comparison bar plots

- [`plot_impact_ratios`](https://cwru-sdle.github.io/manureshed/reference/plot_impact_ratios.md):
  Impact ratio visualizations

- [`plot_absolute_changes`](https://cwru-sdle.github.io/manureshed/reference/plot_absolute_changes.md):
  Absolute change plots

### Utility Functions:

- [`get_nutrient_colors`](https://cwru-sdle.github.io/manureshed/reference/get_nutrient_colors.md):
  Get color schemes for nutrients

- [`clean_category_names`](https://cwru-sdle.github.io/manureshed/reference/clean_category_names.md):
  Clean classification names for display

- [`format_huc8`](https://cwru-sdle.github.io/manureshed/reference/format_huc8.md):
  Format HUC8 codes with leading zeros

- [`get_cropland_threshold`](https://cwru-sdle.github.io/manureshed/reference/get_cropland_threshold.md):
  Calculate exclusion thresholds

## Spatial Scales

The package supports analysis at three spatial scales:

- **County**: US county boundaries (3,000+ units)

- **HUC8**: 8-digit Hydrologic Unit Code watersheds (2,000+ units)

- **HUC2**: 2-digit Hydrologic Unit Code regions (18 units)

## Nutrients Supported

The package supports analysis for both major nutrients with appropriate
methodologies:

- **Nitrogen**: Uses 0.5 availability factor for manure nitrogen in
  calculations

- **Phosphorus**: Direct calculation without availability factor

Users can analyze one nutrient, both nutrients, or different
combinations in the same workflow:
`nutrients = c("nitrogen", "phosphorus")`

## Classification System

Spatial units are classified into five categories based on nutrient
balance:

- **Source**: Net nutrient surplus available for export

- **Sink Deficit**: Total deficit requiring nutrient imports

- **Sink Fertilizer**: Fertilizer surplus available for manure import

- **Within Watershed/County**: Balanced for internal nutrient transfers

- **Excluded**: Insufficient cropland for meaningful analysis (\<500 ha
  equivalent)

## Data Sources

The package provides access to comprehensive built-in datasets:

### NuGIS Data:

- County-level data (1987 - 2016)

- HUC8 watershed data (1987 - 2016)

- HUC2 regional data (1987 - 2016)

- All nutrient balance components (manure, fertilizer, removal,
  fixation)

### Spatial Boundaries:

- US county boundaries (CONUS)

- HUC8 watershed boundaries

- HUC2 regional boundaries

- All in Albers Equal Area Conic projection (EPSG:5070)

### WWTP Data:

- Nitrogen discharge data (2007 - 2016)

- Phosphorus discharge data (2007 - 2016)

- Pre-processed and classification-ready

- Includes facility metadata and spatial coordinates

### Supplemental Data:

- Texas HUC8 data (automatically integrated for HUC8 analyses)

- Texas spatial boundaries

## OSF Data Repository

All datasets are hosted on OSF and downloaded on-demand:

- **Repository**: https://osf.io/g39xa/

- **Automatic caching**: Data downloaded once and reused

- **Flexible loading**: Load only the data you need

- **Version control**: Permanent DOI for reproducibility

- **Size efficiency**: Package \<1MB, full datasets ~25MB

## WWTP Data Flexibility

The package handles varying EPA WWTP data formats across different
years:

- **Unit Conversion**: Automatic conversion between kg, lbs, pounds, and
  tons

- **Column Mapping**: Flexible mapping to handle EPA naming changes

- **Header Detection**: Support for different header row positions

- **Built-in 2016**: Ready-to-use cleaned data for immediate analysis

- **Custom Integration**: Easy integration of user data for other years

## Workflow Examples

    # Check what data is available
    check_builtin_data()

    # Download all datasets (optional, ~40MB)
    download_all_data()

    # Basic analysis using built-in data - any year 2007-2016
    results <- run_builtin_analysis(
      scale = "huc8",
      year = 2012,  # Any year 2007-2016 now supported
      nutrients = c("nitrogen", "phosphorus"),
      include_wwtp = TRUE
    )

    wwtp_n_2010 <- load_builtin_wwtp("nitrogen", year = 2010)
    wwtp_p_2015 <- load_builtin_wwtp("phosphorus", year = 2015)


    # Quick analysis with automatic visualizations
    viz_results <- quick_analysis(
      scale = "county",
      year = 2016,
      nutrients = "nitrogen",
      include_wwtp = TRUE
    )

    # Historical analysis without WWTP
    historical <- run_builtin_analysis(
      scale = "huc8",
      year = 2010,
      nutrients = c("nitrogen", "phosphorus"),
      include_wwtp = FALSE
    )

    # Load specific datasets manually
    county_2016 <- load_builtin_nugis("county", 2016)
    boundaries <- load_builtin_boundaries("county")
    wwtp_n <- load_builtin_wwtp("nitrogen")

## Analysis Outputs

The package generates comprehensive outputs for each nutrient analyzed:

- **Spatial Data**: Classification results as sf objects

- **Maps**: Classification, influence, and facility maps

- **Networks**: Transition probability visualizations

- **Comparisons**: Before/after WWTP integration analysis

- **Data Files**: CSV centroids, RDS spatial data

- **Metadata**: Analysis parameters and processing information

## Performance and Scalability

- Optimized for CONUS-scale analysis (1000s of spatial units)

- Memory-efficient spatial operations

- On-demand data loading reduces memory footprint

- Progress reporting for long-running analyses

- Automatic garbage collection for memory management

## See also

Useful links:

- <https://osf.io/g39xa/>

- <https://github.com/cwru-sdle/manureshed>

- <https://cwru-sdle.github.io/manureshed>

## Author

**Maintainer**: Olatunde D. Akanbi <olatunde.akanbi@case.edu>
([ORCID](https://orcid.org/0000-0001-7719-2619)) \[copyright holder\]

Authors:

- Vibha Mandayam ([ORCID](https://orcid.org/0009-0008-8628-9904))

- Atharva Gupta ([ORCID](https://orcid.org/0009-0004-5372-0260))

- K. Colton Flynn ([ORCID](https://orcid.org/0000-0002-5718-1071))

- Jeffrey Yarus ([ORCID](https://orcid.org/0000-0002-9331-9568))

- Erika I. Barcelos <erika.barcelos@case.edu>
  ([ORCID](https://orcid.org/0000-0002-9273-8488)) \[copyright holder\]

- Roger H. French <roger.french@case.edu>
  ([ORCID](https://orcid.org/0000-0002-6162-0532)) \[copyright holder\]
