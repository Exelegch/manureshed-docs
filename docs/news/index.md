# Changelog

## manureshed 0.1.5

- Added optional hub site selection module for identifying county-level
  nutrient recovery hub locations across CONUS.

- Optional CDL raster integration (requires `terra` + `exactextractr`)
  refines demand signal by cropland intensity fraction.

- New vignette: “Hub Site Selection for Nutrient Recovery Operations”.

- Shiny dashboard updated with Hub Selection tab: interactive Leaflet
  suitability map, top sites table, and cross-score robustness table.

## manureshed 0.1.4

CRAN release: 2026-03-09

- Fixed persistent cache issue

## manureshed 0.1.3

CRAN release: 2026-02-21

- Fixed cache issue

## manureshed 0.1.2

CRAN release: 2026-01-28

- Fixed the hexa color problems
- Added a cheatsheet
- Added region comparison function

## manureshed 0.1.1

CRAN release: 2026-01-26

### New Features

- Added github pkgdown for documentation
- Added
  [`compare_scenarios()`](https://exelegch.github.io/manureshed-docs/reference/compare_scenarios.md)
  for side-by-side scenario comparison
- Added
  [`launch_dashboard()`](https://exelegch.github.io/manureshed-docs/reference/launch_dashboard.md)
  for interactive Shiny interface
- Dashboard requires optional packages: shiny, shinydashboard, leaflet,
  plotly, DT

### Documentation

- New vignette: “Scenario Comparison Analysis”
- New vignette: “Using the Interactive Dashboard”

### Bug Fixes

- Fixed deprecated ggplot2 `size` aesthetic (changed to `linewidth`)
- Fixed graphics device compatibility with ragg package

## manureshed 0.1.0

CRAN release: 2025-12-22

- Initial CRAN submission.
