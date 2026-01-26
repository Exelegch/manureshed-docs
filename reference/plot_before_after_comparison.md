# Create Before/After Comparison Plot

Create side-by-side comparison of agricultural vs WWTP+agricultural
classifications

## Usage

``` r
plot_before_after_comparison(data, nutrient, title)
```

## Arguments

- data:

  Data frame. Summary data from create_classification_summary

- nutrient:

  Character. "nitrogen" or "phosphorus" for coloring

- title:

  Character. Plot title

## Value

ggplot object
