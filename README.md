
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/3jITMq8.png" align="right" height=40 /> Install and use r2dii packages

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/r2dii)](https://CRAN.R-project.org/package=r2dii)
[![Travis build
status](https://travis-ci.org/2DegreesInvesting/r2dii.svg?branch=master)](https://travis-ci.org/2DegreesInvesting/r2dii)
<!-- badges: end -->

[2 ° Investing Initiative](https://2degrees-investing.org/) (2dii)
maintains a collection or R packages called r2dii. To help you install
and use all those packages at once, we also built the r2dii (meta)
package. The r2dii package is the only package most users need to know
about. Contact us if you need more details.

Currently, r2dii allows you to access raw or lightly-prepared data, to
create robust r2dii’s paths, and to handle configuration files.

## Installation

To minimize installation errors, ensure your R environment is as
follows:

  - R version is recent.
  - All packages are updated (run `update.packages()`; maybe use `ask =
    FALSE`).
  - No other R session is running.
  - Current R session is clean (click *Session \> Restart R*).

Install the development version of r2dii with:

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/r2dii")
```

## Example

These examples provide a high level overview of the main features. For
more details see [Get started](articles/r2dii.html).

Attaching r2dii automatically attaches other r2dii packages.

``` r
library(r2dii)
#> Loading required package: r2dii.dataprep
#> Loading required package: r2dii.dataraw
#> Loading required package: r2dii.utils
```

### Creating snapshots

`take_snapshot()` allows you to take snapshots of multiple datasets. Its
default behavior is sensible, but conservative and potentially slow (see
`take_snapshot()`). You may want to change the default arguments.

Use:

  - `datasets` to snapshot specific datasets.
  - Use `destdir` to customize the destination directory.
  - Use `config` to provide a custom configuration file to
    `take_snapshot()`.

<!-- end list -->

``` r
datasets <- c("RevenueSplit", "BENCH.REGIONS")
custom_destdir <- tempdir()
custom_config <- example_config("config-toy.yml")

take_snapshot(
  datasets,
  destdir = custom_destdir, 
  config = custom_config
)
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/config-toy.yml'.
#> Wrote `RevenueSplit` to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/RevenueSplit.csv'.
#> Wrote `BENCH.REGIONS` to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/BENCH.REGIONS.csv'.
```

Use:

  - `overwrite = TRUE` to overwrite existing snapshots.

<!-- end list -->

``` r
take_snapshot(
  datasets,
  destdir = custom_destdir, 
  config = custom_config
)
#> Skipping existing snapshot of 'config-toy.yml'.
#> Skipping existing snapshot of `RevenueSplit`.
#> Skipping existing snapshot of `BENCH.REGIONS`.

# Overwrite
take_snapshot(
  datasets,
  destdir = custom_destdir, 
  config = custom_config,
  overwrite = TRUE
)
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/config-toy.yml'.
#> Wrote `RevenueSplit` to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/RevenueSplit.csv'.
#> Wrote `BENCH.REGIONS` to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/BENCH.REGIONS.csv'.
```

  - `options(r2dii_config = <custom_config>)` replaces `config` and
    affects your R session globally.

<!-- end list -->

``` r
restore <- options(r2dii_config = custom_config)

take_snapshot(
  datasets,
  destdir = custom_destdir, 
  overwrite = TRUE
)
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/config-toy.yml'.
#> Wrote `RevenueSplit` to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/RevenueSplit.csv'.
#> Wrote `BENCH.REGIONS` to 'C:/Users/Mauro/AppData/Local/Temp/Rtmp6BIiCB/BENCH.REGIONS.csv'.

options(restore)
```

[Get
started](https://2degreesinvesting.github.io/r2dii/articles/r2dii.html)
