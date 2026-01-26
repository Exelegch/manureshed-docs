# Package index

## Core Analysis Functions

Main workflow functions for nutrient balance analysis

- [`run_builtin_analysis()`](https://exelegch.github.io/manureshed-docs/reference/run_builtin_analysis.md)
  : Complete Manureshed Analysis Workflow (Built-in Data)
- [`quick_analysis()`](https://exelegch.github.io/manureshed-docs/reference/quick_analysis.md)
  : Quick Analysis with Visualization
- [`batch_analysis_years()`](https://exelegch.github.io/manureshed-docs/reference/batch_analysis_years.md)
  : Batch Analysis Across Multiple Years
- [`batch_analysis_enhanced()`](https://exelegch.github.io/manureshed-docs/reference/batch_analysis_enhanced.md)
  : Enhanced Batch Analysis with Full Visualizations
- [`batch_analysis_parallel()`](https://exelegch.github.io/manureshed-docs/reference/batch_analysis_parallel.md)
  : Batch Analysis with Parallel Processing
- [`benchmark_analysis()`](https://exelegch.github.io/manureshed-docs/reference/benchmark_analysis.md)
  : Benchmark Analysis Performance

## Scenario Comparison

Compare multiple analysis scenarios

- [`compare_scenarios()`](https://exelegch.github.io/manureshed-docs/reference/compare_scenarios.md)
  : Compare Multiple Analysis Scenarios
- [`compare_analyses()`](https://exelegch.github.io/manureshed-docs/reference/compare_analyses.md)
  : Compare Two Analysis Results
- [`extract_scenario_metrics()`](https://exelegch.github.io/manureshed-docs/reference/extract_scenario_metrics.md)
  : Extract Metrics from Analysis Results

## Interactive Dashboard

Launch interactive Shiny interface

- [`launch_dashboard()`](https://exelegch.github.io/manureshed-docs/reference/launch_dashboard.md)
  : Launch Interactive Manureshed Dashboard

## State-Level Analysis

Analyze specific states or regions

- [`run_state_analysis()`](https://exelegch.github.io/manureshed-docs/reference/run_state_analysis.md)
  : Run State-Level Analysis
- [`quick_state_analysis()`](https://exelegch.github.io/manureshed-docs/reference/quick_state_analysis.md)
  : Quick State Analysis with Visualization
- [`get_state_fips()`](https://exelegch.github.io/manureshed-docs/reference/get_state_fips.md)
  : Get State FIPS Code
- [`filter_by_state()`](https://exelegch.github.io/manureshed-docs/reference/filter_by_state.md)
  : Filter Data by State

## Data Loading Functions

Load and prepare data for analysis

- [`load_builtin_nugis()`](https://exelegch.github.io/manureshed-docs/reference/load_builtin_nugis.md)
  : Load Built-in NuGIS Data from OSF
- [`load_builtin_wwtp()`](https://exelegch.github.io/manureshed-docs/reference/load_builtin_wwtp.md)
  : Load Built-in WWTP Data from OSF
- [`load_builtin_boundaries()`](https://exelegch.github.io/manureshed-docs/reference/load_builtin_boundaries.md)
  : Load Built-in Spatial Boundaries from OSF
- [`load_user_wwtp()`](https://exelegch.github.io/manureshed-docs/reference/load_user_wwtp.md)
  : Load User WWTP Data
- [`load_texas_huc8_data()`](https://exelegch.github.io/manureshed-docs/reference/load_texas_huc8_data.md)
  : Load Texas HUC8 Data from OSF
- [`load_texas_huc8_boundaries()`](https://exelegch.github.io/manureshed-docs/reference/load_texas_huc8_boundaries.md)
  : Load Texas HUC8 Boundaries from OSF
- [`check_builtin_data()`](https://exelegch.github.io/manureshed-docs/reference/check_builtin_data.md)
  : Check Data Availability from OSF
- [`download_all_data()`](https://exelegch.github.io/manureshed-docs/reference/download_all_data.md)
  : Download All Datasets from OSF
- [`download_osf_data()`](https://exelegch.github.io/manureshed-docs/reference/download_osf_data.md)
  : Download and Cache Data from OSF
- [`clear_data_cache()`](https://exelegch.github.io/manureshed-docs/reference/clear_data_cache.md)
  : Clear Data Cache
- [`list_available_years()`](https://exelegch.github.io/manureshed-docs/reference/list_available_years.md)
  : List Available Built-in Years

## WWTP Data Functions

Process wastewater treatment plant data

- [`wwtp_clean_data()`](https://exelegch.github.io/manureshed-docs/reference/wwtp_clean_data.md)
  : Clean WWTP Data
- [`wwtp_filter_positive_loads()`](https://exelegch.github.io/manureshed-docs/reference/wwtp_filter_positive_loads.md)
  : Filter WWTP Data for Positive Loads
- [`wwtp_classify_sources()`](https://exelegch.github.io/manureshed-docs/reference/wwtp_classify_sources.md)
  : Classify WWTP Sources by Load Size
- [`wwtp_aggregate_by_boundaries()`](https://exelegch.github.io/manureshed-docs/reference/wwtp_aggregate_by_boundaries.md)
  : Aggregate WWTP Data by Spatial Boundaries
- [`wwtp_to_spatial()`](https://exelegch.github.io/manureshed-docs/reference/wwtp_to_spatial.md)
  : Convert WWTP Data to Spatial Format
- [`wwtp_process_complete()`](https://exelegch.github.io/manureshed-docs/reference/wwtp_process_complete.md)
  : Complete WWTP Processing Pipeline
- [`map_wwtp_columns()`](https://exelegch.github.io/manureshed-docs/reference/map_wwtp_columns.md)
  : Map WWTP Column Names to Standard Format

## Agricultural Classification

Agricultural nutrient balance calculations and classification

- [`agri_process_nugis()`](https://exelegch.github.io/manureshed-docs/reference/agri_process_nugis.md)
  : Process NuGIS Data for Manureshed Analysis
- [`agri_classify_nitrogen()`](https://exelegch.github.io/manureshed-docs/reference/agri_classify_nitrogen.md)
  : Classify Agricultural Nitrogen Status
- [`agri_classify_phosphorus()`](https://exelegch.github.io/manureshed-docs/reference/agri_classify_phosphorus.md)
  : Classify Agricultural Phosphorus Status
- [`agri_classify_complete()`](https://exelegch.github.io/manureshed-docs/reference/agri_classify_complete.md)
  : Complete Agricultural Classification Pipeline
- [`agri_classify_nitrogen_custom()`](https://exelegch.github.io/manureshed-docs/reference/agri_classify_nitrogen_custom.md)
  : Classify Agricultural Nitrogen Status with Custom Efficiency Factor
- [`agri_classify_phosphorus_custom()`](https://exelegch.github.io/manureshed-docs/reference/agri_classify_phosphorus_custom.md)
  : Classify Agricultural Phosphorus Status with Custom Efficiency
  Factor
- [`agri_classify_complete_custom()`](https://exelegch.github.io/manureshed-docs/reference/agri_classify_complete_custom.md)
  : Complete Agricultural Classification Pipeline with Custom Efficiency
  Factors

## Integration Functions

Combine agricultural and WWTP data

- [`integrate_wwtp_agricultural()`](https://exelegch.github.io/manureshed-docs/reference/integrate_wwtp_agricultural.md)
  : Integrate WWTP Data with Agricultural Classifications (Updated)
- [`integrate_complete()`](https://exelegch.github.io/manureshed-docs/reference/integrate_complete.md)
  : Complete Integration Pipeline (Updated)
- [`add_texas_huc8()`](https://exelegch.github.io/manureshed-docs/reference/add_texas_huc8.md)
  : Add Texas HUC8 Data (Updated for OSF)

## Visualization Functions

Create maps and plots

- [`map_agricultural_classification()`](https://exelegch.github.io/manureshed-docs/reference/map_agricultural_classification.md)
  : Create Agricultural Classification Map
- [`map_wwtp_points()`](https://exelegch.github.io/manureshed-docs/reference/map_wwtp_points.md)
  : Create WWTP Point Map
- [`map_wwtp_influence()`](https://exelegch.github.io/manureshed-docs/reference/map_wwtp_influence.md)
  : Create WWTP Influence Map
- [`create_network_plot()`](https://exelegch.github.io/manureshed-docs/reference/create_network_plot.md)
  : Create Network Plot from Transition Probabilities
- [`plot_before_after_comparison()`](https://exelegch.github.io/manureshed-docs/reference/plot_before_after_comparison.md)
  : Create Before/After Comparison Plot
- [`plot_impact_ratios()`](https://exelegch.github.io/manureshed-docs/reference/plot_impact_ratios.md)
  : Create Impact Ratio Plot
- [`plot_absolute_changes()`](https://exelegch.github.io/manureshed-docs/reference/plot_absolute_changes.md)
  : Create Absolute Change Plot
- [`create_classification_trend_plot()`](https://exelegch.github.io/manureshed-docs/reference/create_classification_trend_plot.md)
  : Create Classification Trend Plot
- [`create_stacked_area_plot()`](https://exelegch.github.io/manureshed-docs/reference/create_stacked_area_plot.md)
  : Create Stacked Area Plot
- [`create_yoy_change_plot()`](https://exelegch.github.io/manureshed-docs/reference/create_yoy_change_plot.md)
  : Create Year-over-Year Change Plot
- [`create_year_comparison_plots()`](https://exelegch.github.io/manureshed-docs/reference/create_year_comparison_plots.md)
  : Create Year-over-Year Comparison Plots

## Spatial Analysis

Spatial operations and transition analysis

- [`add_centroid_coordinates()`](https://exelegch.github.io/manureshed-docs/reference/add_centroid_coordinates.md)
  : Add Centroid Coordinates to Spatial Data
- [`calculate_transition_probabilities()`](https://exelegch.github.io/manureshed-docs/reference/calculate_transition_probabilities.md)
  : Calculate Spatial Transition Probabilities
- [`save_transition_matrix()`](https://exelegch.github.io/manureshed-docs/reference/save_transition_matrix.md)
  : Save Transition Probability Matrix
- [`get_state_boundaries()`](https://exelegch.github.io/manureshed-docs/reference/get_state_boundaries.md)
  : Get State Boundaries for Mapping

## File I/O Functions

Save and export analysis results

- [`save_spatial_data()`](https://exelegch.github.io/manureshed-docs/reference/save_spatial_data.md)
  : Save Spatial Data
- [`save_centroid_data()`](https://exelegch.github.io/manureshed-docs/reference/save_centroid_data.md)
  : Save Centroid Data
- [`save_plot()`](https://exelegch.github.io/manureshed-docs/reference/save_plot.md)
  : Save Plot
- [`save_analysis_summary()`](https://exelegch.github.io/manureshed-docs/reference/save_analysis_summary.md)
  : Save Analysis Summary
- [`export_for_gis()`](https://exelegch.github.io/manureshed-docs/reference/export_for_gis.md)
  : Export Results for GIS Applications
- [`export_for_policy()`](https://exelegch.github.io/manureshed-docs/reference/export_for_policy.md)
  : Export for Policy Briefs
- [`export_for_publication()`](https://exelegch.github.io/manureshed-docs/reference/export_for_publication.md)
  : Export for Publication

## Reporting Functions

Generate analysis reports

- [`create_analysis_report()`](https://exelegch.github.io/manureshed-docs/reference/create_analysis_report.md)
  : Create Analysis Report
- [`create_batch_summary_report()`](https://exelegch.github.io/manureshed-docs/reference/create_batch_summary_report.md)
  : Create Batch Summary Report
- [`create_classification_summary()`](https://exelegch.github.io/manureshed-docs/reference/create_classification_summary.md)
  : Create Classification Summary Table
- [`create_comparison_summary()`](https://exelegch.github.io/manureshed-docs/reference/create_comparison_summary.md)
  : Create Comparison Summary Statistics
- [`create_comprehensive_comparisons()`](https://exelegch.github.io/manureshed-docs/reference/create_comprehensive_comparisons.md)
  : Create Comprehensive Batch Comparisons
- [`generate_report_content()`](https://exelegch.github.io/manureshed-docs/reference/generate_report_content.md)
  : Generate Report Content
- [`summarize_results()`](https://exelegch.github.io/manureshed-docs/reference/summarize_results.md)
  : Print Summary of Analysis Results

## Comparison and Plotting

Additional comparison tools

- [`create_comparison_plots()`](https://exelegch.github.io/manureshed-docs/reference/create_comparison_plots.md)
  : Create Comparison Plots
- [`extract_trend_data()`](https://exelegch.github.io/manureshed-docs/reference/extract_trend_data.md)
  : Extract Trend Data from Batch Results

## Utility Functions

Helper functions and data validation

- [`quick_check()`](https://exelegch.github.io/manureshed-docs/reference/quick_check.md)
  : Quick Data Check
- [`health_check()`](https://exelegch.github.io/manureshed-docs/reference/health_check.md)
  : Check Package Health and Dependencies
- [`test_osf_connection()`](https://exelegch.github.io/manureshed-docs/reference/test_osf_connection.md)
  : Test OSF Connection
- [`citation_info()`](https://exelegch.github.io/manureshed-docs/reference/citation_info.md)
  : Display Package Citation Information
- [`get_nutrient_colors()`](https://exelegch.github.io/manureshed-docs/reference/get_nutrient_colors.md)
  : Default Color Schemes for Nutrient Classifications
- [`get_cropland_threshold()`](https://exelegch.github.io/manureshed-docs/reference/get_cropland_threshold.md)
  : Get Cropland Threshold by Scale
- [`calculate_cropland_threshold()`](https://exelegch.github.io/manureshed-docs/reference/calculate_cropland_threshold.md)
  : Calculate Cropland Threshold for Exclusion
- [`format_huc8()`](https://exelegch.github.io/manureshed-docs/reference/format_huc8.md)
  : Format HUC8 Codes
- [`clean_text()`](https://exelegch.github.io/manureshed-docs/reference/clean_text.md)
  : Clean Text Data
- [`clean_category_names()`](https://exelegch.github.io/manureshed-docs/reference/clean_category_names.md)
  : Clean Category Names for Display
- [`validate_columns()`](https://exelegch.github.io/manureshed-docs/reference/validate_columns.md)
  : Validate Required Columns
- [`convert_load_units()`](https://exelegch.github.io/manureshed-docs/reference/convert_load_units.md)
  : Convert Load Units to Tons

## Constants and Data

Package constants and reference data

- [`MANURESHED_CRS`](https://exelegch.github.io/manureshed-docs/reference/MANURESHED_CRS.md)
  : Standard CRS for Manureshed Analysis
- [`KG_TO_TONS`](https://exelegch.github.io/manureshed-docs/reference/KG_TO_TONS.md)
  : Conversion Factor: Kilograms to US Tons
- [`LBS_TO_KG`](https://exelegch.github.io/manureshed-docs/reference/LBS_TO_KG.md)
  : Conversion Factor: Pounds to Kilograms
- [`LBS_TO_TONS`](https://exelegch.github.io/manureshed-docs/reference/LBS_TO_TONS.md)
  : Conversion Factor: Pounds to US Tons
- [`P2O5_TO_P`](https://exelegch.github.io/manureshed-docs/reference/P2O5_TO_P.md)
  : Conversion Factor: P2O5 to P
- [`CONUS_STATES`](https://exelegch.github.io/manureshed-docs/reference/CONUS_STATES.md)
  : CONUS States
- [`data_sources`](https://exelegch.github.io/manureshed-docs/reference/data_sources.md)
  : NuGIS and EPA WWTP Data Sources

## Package Information

Package metadata and help

- [`manureshed-package`](https://exelegch.github.io/manureshed-docs/reference/manureshed.md)
  [`manureshed`](https://exelegch.github.io/manureshed-docs/reference/manureshed.md)
  : manureshed: Manureshed Analysis with WWTP Integration
