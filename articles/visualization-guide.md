# Creating Maps and Plots

``` r
library(manureshed)
#> 
#> =================================================================
#> manureshed package loaded successfully!
#> =================================================================
#> 
#> Built-in Data (Downloaded on-demand from OSF):
#>   • NuGIS data: 1987 - 2016 (all spatial scales)
#>   • WWTP data: 2007 - 2016 (nitrogen and phosphorus)
#>   • Spatial boundaries: county, HUC8, HUC2
#>   • Texas supplemental data (automatic for HUC8)
#> 
#> Quick Start:
#>   check_builtin_data()           # Check data availability
#>   download_all_data()            # Download all datasets
#>   quick_analysis()               # Complete analysis + visuals
#>   ?run_builtin_analysis          # Main workflow function
#> 
#> Data Management:
#>   clear_data_cache()             # Clear downloaded data
#>   download_osf_data()            # Download specific dataset
#> 
#> Documentation:
#>   vignette('getting-started')    # Getting started guide
#>   ?manureshed                    # Package overview
#> =================================================================
#> 
#> Data Summary:
#>   OSF Repository: https://osf.io/g39xa/
#>   Available scales: county, huc8, huc2
#>   Years available: 1987 - 2016
#>   WWTP years: 2007 - 2016 (nitrogen, phosphorus)
#>   Methodology Paper: Akanbi, O.D., Gupta, A., Mandayam, V., Flynn, K.C.,
#>       Yarus, J.M., Barcelos, E.I., French, R.H., 2026. Towards circular nutrient economies: An
#>       integrated manureshed framework for agricultural and municipal resource management.
#>       Resources, Conservation and Recycling, https://doi.org/10.1016/j.resconrec.2025.108697
#> 
#>   Cached datasets: 6/10 downloaded
#> 
```

## Overview

The `manureshed` package creates several types of visualizations:

1.  **Classification maps** - Show nutrient balance categories
2.  **WWTP facility maps** - Show treatment plant locations and sizes  
3.  **Influence maps** - Show how much WWTP contributes to each area
4.  **Comparison plots** - Before/after adding WWTP data
5.  **Network plots** - Show transitions between neighboring areas

## Quick Maps with quick_analysis()

The easiest way to get maps is with
[`quick_analysis()`](https://exelegch.github.io/manureshed-docs/reference/quick_analysis.md):

``` r
# This creates all maps automatically
results <- quick_analysis(
  scale = "huc8",
  year = 2016,
  nutrients = "nitrogen",
  include_wwtp = TRUE,
  output_dir = "my_maps"
)

# Maps are saved in the output directory
```

## Step-by-Step Map Creation

### 1. Get Analysis Results First

``` r
# Run analysis to get data for mapping
results <- run_builtin_analysis(
  scale = "county",
  year = 2016, 
  nutrients = c("nitrogen", "phosphorus"),
  include_wwtp = TRUE
)
```

### 2. Agricultural Classification Maps

``` r
# Basic nitrogen map
nitrogen_map <- map_agricultural_classification(
  data = results$agricultural,
  nutrient = "nitrogen",
  classification_col = "N_class", 
  title = "Agricultural Nitrogen Classifications"
)

# View the map
print(nitrogen_map)

# Save the map
save_plot(nitrogen_map, "nitrogen_classes.png", width = 10, height = 8)

# Phosphorus map
phosphorus_map <- map_agricultural_classification(
  data = results$agricultural,
  nutrient = "phosphorus",
  classification_col = "P_class",
  title = "Agricultural Phosphorus Classifications" 
)
```

### 3. Combined Maps (Agricultural + WWTP)

``` r
# Map showing effect of adding WWTP data
combined_nitrogen <- map_agricultural_classification(
  data = results$integrated$nitrogen,
  nutrient = "nitrogen",
  classification_col = "combined_N_class",
  title = "Nitrogen with WWTP Integration"
)

combined_phosphorus <- map_agricultural_classification(
  data = results$integrated$phosphorus, 
  nutrient = "phosphorus",
  classification_col = "combined_P_class",
  title = "Phosphorus with WWTP Integration"
)
```

### 4. WWTP Facility Maps

``` r
# Map showing WWTP locations colored by size
facility_map <- map_wwtp_points(
  wwtp_sf = results$wwtp$nitrogen$spatial_data,
  nutrient = "nitrogen",
  title = "Nitrogen WWTP Facilities"
)

print(facility_map)
```

### 5. WWTP Influence Maps

``` r
# Map showing how much WWTP contributes to each area
influence_map <- map_wwtp_influence(
  data = results$integrated$nitrogen,
  nutrient = "nitrogen",
  title = "WWTP Contribution to Total Nitrogen"
)

print(influence_map)
```

## Comparison Plots

### Before/After WWTP Integration

``` r
# Create summary data
summary_data <- create_classification_summary(
  data = results$integrated$nitrogen,
  agricultural_col = "N_class",
  combined_col = "combined_N_class"
)

# Before/after bar chart
comparison_plot <- plot_before_after_comparison(
  data = summary_data,
  nutrient = "nitrogen",
  title = "Effect of Adding WWTP Data"
)

print(comparison_plot)

# Impact ratios
impact_plot <- plot_impact_ratios(
  data = summary_data,
  title = "WWTP Impact on Classifications"
)

# Absolute changes
change_plot <- plot_absolute_changes(
  data = summary_data,
  title = "Change in Number of Counties"
)
```

## Network Plots

### Spatial Transition Networks

``` r
# Add coordinates to the data
centroids <- add_centroid_coordinates(results$integrated$nitrogen)

# Calculate how often different classes are next to each other
transitions <- calculate_transition_probabilities(
  centroids, "combined_N_class"
)

# Create network plot
create_network_plot(
  transition_df = transitions,
  nutrient = "nitrogen",
  analysis_type = "WWTP + Agricultural", 
  output_path = "nitrogen_network.png"
)

# View the transition table
print(transitions)
```

## Customizing Maps

### Save Options

``` r
# Different resolutions and formats
save_plot(nitrogen_map, "map_web.png", width = 8, height = 6, dpi = 150)      # Web
save_plot(nitrogen_map, "map_print.png", width = 10, height = 8, dpi = 300)   # Print  
save_plot(nitrogen_map, "map_publication.png", width = 12, height = 9, dpi = 600) # Publication

# Vector formats
save_plot(nitrogen_map, "map_vector.pdf", width = 10, height = 8)
```

### Custom Colors

``` r
# Use different colors
custom_map <- map_agricultural_classification(
  data = results$agricultural,
  nutrient = "nitrogen",
  classification_col = "N_class",
  title = "Custom Colors"
) +
  ggplot2::scale_fill_manual(
    values = c("Source" = "red", "Sink_Deficit" = "blue", 
               "Sink_Fertilizer" = "green", "Within_County" = "yellow",
               "Excluded" = "gray"),
    labels = c("Source", "Sink Deficit", "Sink Fertilizer", 
               "Within County", "Excluded")
  )
```

## Working with Different Scales

### County Level

``` r
# County analysis
county_results <- run_builtin_analysis(scale = "county", year = 2016, 
                                       nutrients = "nitrogen", include_wwtp = TRUE)

county_map <- map_agricultural_classification(
  county_results$agricultural, "nitrogen", "N_class",
  "County-Level Nitrogen Classifications"
)
```

### HUC8 Watersheds

``` r
# Watershed analysis  
huc8_results <- run_builtin_analysis(scale = "huc8", year = 2016,
                                     nutrients = "nitrogen", include_wwtp = TRUE)

huc8_map <- map_agricultural_classification(
  huc8_results$agricultural, "nitrogen", "N_class", 
  "Watershed-Level Nitrogen Classifications"
)
```

### HUC2 Regions

``` r
# Regional analysis
huc2_results <- run_builtin_analysis(scale = "huc2", year = 2016,
                                     nutrients = "nitrogen", include_wwtp = TRUE)

huc2_map <- map_agricultural_classification(
  huc2_results$agricultural, "nitrogen", "N_class",
  "Regional-Level Nitrogen Classifications"
)
```

## State-Specific Maps

``` r
# Create maps for a specific state
iowa_results <- run_state_analysis(
  state = "IA", 
  scale = "county",
  year = 2016,
  nutrients = "nitrogen",
  include_wwtp = TRUE
)

iowa_map <- map_agricultural_classification(
  iowa_results$agricultural, "nitrogen", "N_class",
  "Iowa Nitrogen Classifications"
)

# Quick state maps
texas_maps <- quick_state_analysis(
  state = "TX",
  scale = "huc8", 
  year = 2015,
  nutrients = "phosphorus",
  create_maps = TRUE
)
```

## Multi-Panel Figures

``` r
# Create side-by-side comparison
library(ggplot2)
library(gridExtra)  # or cowplot

# Create two maps
map1 <- map_agricultural_classification(
  results$agricultural, "nitrogen", "N_class", "Agricultural Only"
)

map2 <- map_agricultural_classification(
  results$integrated$nitrogen, "nitrogen", "combined_N_class", "With WWTP"
)

# Combine them
combined_figure <- grid.arrange(map1, map2, ncol = 2)

# Save combined figure
ggsave("combined_maps.png", combined_figure, width = 16, height = 8)
```

## Tips for Good Maps

### Map Quality

``` r
# For presentations (screen)
save_plot(map, "presentation.png", width = 12, height = 8, dpi = 150)

# For reports (print)  
save_plot(map, "report.png", width = 10, height = 8, dpi = 300)

# For journals (high quality)
save_plot(map, "journal.png", width = 8, height = 6, dpi = 600)
```

### Color Choices

- Use the built-in colors for consistency
- Consider colorblind-friendly palettes
- Make sure colors show up in grayscale
- Use high contrast for important categories

### File Management

``` r
# Organize your outputs
create_maps_folder <- function(analysis_name) {
  dir.create(analysis_name, showWarnings = FALSE)
  dir.create(file.path(analysis_name, "maps"), showWarnings = FALSE)
  dir.create(file.path(analysis_name, "plots"), showWarnings = FALSE)
  dir.create(file.path(analysis_name, "data"), showWarnings = FALSE)
}

create_maps_folder("nitrogen_analysis_2016")
```

## Troubleshooting

### Common Issues

``` r
# If maps are blank, check your data
quick_check(results)

# If colors are wrong, check classification column names
table(results$agricultural$N_class)

# If coordinates are missing
centroids <- add_centroid_coordinates(results$agricultural)

# If maps are too slow, try smaller scale or fewer years
```

This covers the essential mapping and visualization functions in
`manureshed`. The package makes it easy to create publication-quality
maps and plots for nutrient flow analysis.
