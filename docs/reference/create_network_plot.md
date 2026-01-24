# Create Network Plot from Transition Probabilities

Create network visualization of spatial transition probabilities

## Usage

``` r
create_network_plot(
  transition_df,
  nutrient,
  analysis_type,
  output_path,
  highlight_transitions = TRUE
)
```

## Arguments

- transition_df:

  Data frame. Transition probability matrix

- nutrient:

  Character. "nitrogen" or "phosphorus" for coloring

- analysis_type:

  Character. Description of analysis type

- output_path:

  Character. Path to save PNG file

- highlight_transitions:

  Logical. Whether to highlight specific transitions

## Value

NULL (saves plot to file)
