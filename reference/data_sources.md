# NuGIS and EPA WWTP Data Sources

This package uses two primary data sources:

## NuGIS Agricultural Data

The Nutrient Use Geographic Information System (NuGIS) presents cropland
nutrient balances for the conterminous United States from 1987-2016.

**Source:** The Fertilizer Institute (TFI) and Plant Nutrition Canada
(PNC)

**Website:** <https://nugis.tfi.org/tabular_data>

**Contact:** nugis@tfi.org

**Components:**

- County-level crop and livestock data from USDA Census of Agriculture

- Fertilizer use data from AAPFCO

- Geospatial nutrient balance estimates

- Available for counties, HUC8, and HUC2 watersheds

**Data Processing:** The manureshed package uses cleaned versions of
NuGIS data with resolved metadata issues and enhanced spatial
integration, as detailed in the manureshed methodology paper (Akanbi et
al., 2026).

## EPA WWTP Data

**Source:** U.S. Environmental Protection Agency

**System:** Discharge Monitoring Report (DMR) Loading Tool via ECHO

**Website:**
<https://echo.epa.gov/trends/loading-tool/water-pollution-search>

**Data Years:** 2007-2016 (nitrogen and phosphorus loads)

**License:** Public domain (U.S. Government work)

## Data Attribution

When using this package, please cite both the package, methodology
paper, and the underlying data sources. Use
[`citation_info()`](https://exelegch.github.io/manureshed-docs/reference/citation_info.md)
to display full citation information.
