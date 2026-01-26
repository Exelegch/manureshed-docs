# Check Package Health and Dependencies

Diagnostic function to check package installation and dependencies

## Usage

``` r
health_check(verbose = FALSE)
```

## Arguments

- verbose:

  Logical. Whether to display detailed information

## Value

Logical. TRUE if all checks pass

## Examples

``` r
# \donttest{
# Quick health check
health_check()
#> manureshed Package Health Check
#> ===================================
#> ✓ Core dependencies: OK
#> ✓ OSF data access: OK (repository accessible)
#> ✓ Spatial libraries: OK
#> ✓ Mapping capabilities: OK
#> ✓ Network analysis: OK
#> ✓ Cache directory: OK
#> -----------------------------------
#> Health Score:6/6
#> 
#> ✓ All systems ready! Package is fully functional.

# Detailed diagnostic information
health_check(verbose = TRUE)
#> manureshed Package Health Check
#> ===================================
#> ✓ Core dependencies: OK
#> ✓ OSF data access: OK (repository accessible)
#> ✓ Spatial libraries: OK
#> ✓ Mapping capabilities: OK
#> ✓ Network analysis: OK
#> ✓ Cache directory: OK
#> -----------------------------------
#> Health Score:6/6
#> 
#> Detailed Information:
#> R version:R version 4.5.2 (2025-10-31)
#> Package version:0.1.1
#> Install path:/home/runner/work/_temp/Library/manureshed
#> OSF repository:https://osf.io/g39xa/
#> Cache location:/home/runner/.cache/R/manureshed/data
#> Spatial versions:
#>   GEOS:3.12.1
#>   GDAL:3.8.4
#>   proj.4:9.4.0
#>   GDAL_with_GEOS:true
#>   USE_PROJ_H:true
#>   PROJ:9.4.0
#> 
#> ✓ All systems ready! Package is fully functional.
# }
```
