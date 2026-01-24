# Add Texas HUC8 Data (Updated for OSF)

Add manually supplied Texas HUC8 data for missing watersheds Uses OSF
data loading instead of built-in data

## Usage

``` r
add_texas_huc8(huc8_data, year = 2016, cropland_threshold, verbose = TRUE)
```

## Arguments

- huc8_data:

  sf object. Existing HUC8 agricultural data

- year:

  Numeric. Year to extract from Texas data

- cropland_threshold:

  Numeric. Threshold for classification

- verbose:

  Logical. Show progress messages

## Value

sf object with Texas data added
