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
#> ✓ Cache directory: writable
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
#> ✓ Cache directory: writable
#> -----------------------------------
#> Health Score:6/6
#> 
#> Detailed Information:
#> R version:R version 4.5.3 (2026-03-11)
#> Package version:0.1.5
#> Install path:/tmp/RtmpfOSkOI/temp_libpath3f4d7a641c0437/manureshed
#> OSF repository:https://osf.io/g39xa/
#> Cache location:/home/oda10/.cache/R/manureshed/data
#> Spatial versions:
#>   GEOS:3.10.2
#>   GDAL:3.4.1
#>   proj.4:8.2.1
#>   GDAL_with_GEOS:true
#>   USE_PROJ_H:true
#>   PROJ:8.2.1
#> 
#> ✓ All systems ready! Package is fully functional.
# }
```
