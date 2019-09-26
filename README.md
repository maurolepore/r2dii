
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

`take_snapshot()` snapshots all possible datasets, using a default
configuration file, a default destination directory, and does not
overwrite existing snapshots.

``` r
take_snapshot()
#> Skipping existing snapshot of 'config.yml'.
#> Skipping existing snapshot of `ALD.BV`.
#> Skipping existing snapshot of `ALD.CB`.
#> Skipping existing snapshot of `ALD.CC`.
#> Skipping existing snapshot of `ALD.Company`.
#> Skipping existing snapshot of `ALD.EQ`.
#> Skipping existing snapshot of `ALD.SPV`.
#> Skipping existing snapshot of `BALANCE.SHEET.DATA`.
#> Skipping existing snapshot of `BENCH.REGIONS`.
#> Skipping existing snapshot of `BicsSectorBridge`.
#> Skipping existing snapshot of `CB_OG`.
#> Skipping existing snapshot of `DebtMarket`.
#> Skipping existing snapshot of `DebtMarketClimate`.
#> Skipping existing snapshot of `EQMarket.Size`.
#> Skipping existing snapshot of `EQ_OG`.
#> Skipping existing snapshot of `FIN.DATA`.
#> Skipping existing snapshot of `Fund.Data`.
#> Skipping existing snapshot of `FundsTrusts`.
#> Skipping existing snapshot of `GROUPS.GOVT`.
#> Skipping existing snapshot of `INDEX.REGIONS`.
#> Skipping existing snapshot of `Indices`.
#> Skipping existing snapshot of `PHYSICAL.RISK.CB`.
#> Skipping existing snapshot of `PHYSICAL.RISK.EQ`.
#> Skipping existing snapshot of `Receipts`.
#> Skipping existing snapshot of `RevenueSplit`.
#> Skipping existing snapshot of `SCEN`.
#> Skipping existing snapshot of `SCENLong`.
#> Skipping existing snapshot of `SEC.TYPE.BONDS`.
#> Skipping existing snapshot of `SectorBridge`.
#> Skipping existing snapshot of `TYPE.BONDS`.
#> Skipping existing snapshot of `TYPE.EQUITY`.
#> Skipping existing snapshot of `TYPE.OTHERS`.
#> Skipping existing snapshot of `TYPE.RECEIPTS`.
#> Skipping existing snapshot of `sector.bridge`.
#> Warning: Can't write the following datasets:
#> LoanMarket, LoanMarketClimate
```

Use:

  - `datasets` to snapshot specific datasets.
  - `overwrite = TRUE` to overwrite existing snapshots.

<!-- end list -->

``` r
datasets <- c("RevenueSplit", "EQMarket.Size")

datasets %>% 
  take_snapshot(overwrite = TRUE)
#> Wrote 'config.yml' to 'C:/Users/Mauro/git/r2dii/inst/extdata/config.yml'.
#> Wrote `RevenueSplit` to 'C:/Users/Mauro/git/r2dii/inst/extdata/RevenueSplit.csv'.
#> Wrote `EQMarket.Size` to 'C:/Users/Mauro/git/r2dii/inst/extdata/EQMarket.Size.csv'.
```

Use `destdir` to customize the destination directory.

``` r
datasets %>% 
  take_snapshot(overwrite = TRUE)
#> Wrote 'config.yml' to 'C:/Users/Mauro/git/r2dii/inst/extdata/config.yml'.
#> Wrote `RevenueSplit` to 'C:/Users/Mauro/git/r2dii/inst/extdata/RevenueSplit.csv'.
#> Wrote `EQMarket.Size` to 'C:/Users/Mauro/git/r2dii/inst/extdata/EQMarket.Size.csv'.
```

Use `config` to provide a custom configuration file to
`take_snapshot()`.

``` r
custom_config <- example_config("config-toy.yml")
custom_config
#> [1] "C:/Users/Mauro/Documents/R/win-library/3.6/r2dii.utils/config-toy.yml"

custom_config %>% 
  show_config()
#> Registered S3 methods overwritten by 'readr':
#>   method           from 
#>   format.col_spec  vroom
#>   print.col_spec   vroom
#>   print.collector  vroom
#>   print.date_names vroom
#>   print.locale     vroom
#>   str.col_spec     vroom
#> default:
#>   Expect:
#>    param_a: a
#>    param_1: 1
#>    param_true: TRUE
#>    param_false: FALSE
#>    param_unset:
#>   TimeStamps:
#>     ALD.Timestamp: 3333
#>     FinancialData.Timestamp: 2018Q3

"DebtMarketClimate" %>% 
  take_snapshot(destdir = tempdir(), overwrite = TRUE, config = custom_config)
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/RtmpOiSXGD/config-toy.yml'.
#> Wrote `DebtMarketClimate` to 'C:/Users/Mauro/AppData/Local/Temp/RtmpOiSXGD/DebtMarketClimate.csv.gz'.
```

  - `options(r2dii_config = <custom_config>)` does the same but affects
    your R session globally.

<!-- end list -->

``` r
restore <- options(r2dii_config = custom_config)

"DebtMarketClimate" %>% 
  take_snapshot(destdir = tempdir(), overwrite = TRUE)
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/RtmpOiSXGD/config-toy.yml'.
#> Wrote `DebtMarketClimate` to 'C:/Users/Mauro/AppData/Local/Temp/RtmpOiSXGD/DebtMarketClimate.csv.gz'.
get_config()
#> [1] "C:/Users/Mauro/Documents/R/win-library/3.6/r2dii.utils/config-toy.yml"

options(restore)
get_config()
#> [1] "C:/Users/Mauro/Documents/R/win-library/3.6/r2dii.utils/config.yml"
```

See also `?edit_config()` to edit the default configuration file.
