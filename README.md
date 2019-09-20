
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <img src="https://i.imgur.com/3jITMq8.png" align="right" height=40 /> Use multiple r2dii packages at once

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

Features:

  - Functions to access raw or lightly-prepared data. This allows you to
    access “live” data from 2dii’s dropbox folder and to take a snapshot
    of it.

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

## Examples

These examples provide a high level overview of the main features. For
more details see [this
article](https://2degreesinvesting.github.io/r2dii/articles/r2dii.dataraw.html).

Attaching r2dii automatically attaches other r2dii packages.

``` r
library(r2dii)
#> Loading required package: r2dii.dataprep
#> Loading required package: r2dii.dataraw
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
#> [1] "C:/Users/Mauro/Documents/R/win-library/3.6/r2dii.dataraw/config-toy.yml"

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
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/RtmpMnVb8j/config-toy.yml'.
#> Wrote `DebtMarketClimate` to 'C:/Users/Mauro/AppData/Local/Temp/RtmpMnVb8j/DebtMarketClimate.csv.gz'.
```

  - `options(r2dii.dataraw_config = <custom_config>)` does the same but
    affects your R session globally.

<!-- end list -->

``` r
restore <- options(r2dii.dataraw_config = custom_config)

"DebtMarketClimate" %>% 
  take_snapshot(destdir = tempdir(), overwrite = TRUE)
#> Wrote 'config-toy.yml' to 'C:/Users/Mauro/AppData/Local/Temp/RtmpMnVb8j/config-toy.yml'.
#> Wrote `DebtMarketClimate` to 'C:/Users/Mauro/AppData/Local/Temp/RtmpMnVb8j/DebtMarketClimate.csv.gz'.
get_config()
#> [1] "C:/Users/Mauro/Documents/R/win-library/3.6/r2dii.dataraw/config-toy.yml"

options(restore)
get_config()
#> [1] "C:/Users/Mauro/Documents/R/win-library/3.6/r2dii.dataraw/config.yml"
```

See also:

  - `?edit_config()` to edit the default configuration file.
  - `?set_version()` to set a new version once you created a meaningful
    data snapshot; then commit, push to GitHub and create a [GitHub
    release](https://help.github.com/en/articles/creating-releases).

### Using snapshots

Install the snapshot associated to the latest commit on the master
branch of the r2dii.dataraw package.

``` r
devtools::install_github("2DegreesInvesting/r2dii.dataraw")
```

Install a specific release with something of the form:

``` r
devtools::install_github("2DegreesInvesting/r2dii.dataraw@major.minor.dev.yy-mm-dd.yy-mm-dd")
```

See:

  - [available GitHub
    releases](https://github.com/2DegreesInvesting/r2dii.dataraw/releases).
  - available local snapshots:

<!-- end list -->

``` r
path_snapshot()
#>  [1] "ALD.BV.csv.gz"             "ALD.CB.csv.gz"            
#>  [3] "ALD.CC.csv.gz"             "ALD.Company.csv.gz"       
#>  [5] "ALD.EQ.csv.gz"             "ALD.SPV.csv.gz"           
#>  [7] "BALANCE.SHEET.DATA.csv.gz" "BENCH.REGIONS.csv"        
#>  [9] "BicsSectorBridge.csv"      "CB_OG.csv.gz"             
#> [11] "config.yml"                "config_2019Q2.yml"        
#> [13] "DebtMarket.csv.gz"         "DebtMarketClimate.csv.gz" 
#> [15] "EQ_OG.csv.gz"              "EQMarket.Size.csv"        
#> [17] "FIN.DATA.csv.gz"           "Fund.Data.csv.gz"         
#> [19] "FundsTrusts.csv.gz"        "GROUPS.GOVT.txt"          
#> [21] "INDEX.REGIONS.csv"         "Indices.csv"              
#> [23] "LoanMarket.csv.gz"         "LoanMarketClimate.csv.gz" 
#> [25] "PHYSICAL.RISK.CB.csv.gz"   "PHYSICAL.RISK.EQ.csv.gz"  
#> [27] "Receipts.csv"              "RevenueSplit.csv"         
#> [29] "SCEN.csv"                  "SCENLong.csv.gz"          
#> [31] "SEC.TYPE.BONDS.txt"        "sector.bridge.csv"        
#> [33] "SectorBridge.csv"          "TYPE.BONDS.txt"           
#> [35] "TYPE.EQUITY.txt"           "TYPE.OTHERS.txt"          
#> [37] "TYPE.RECEIPTS.csv"
```

Read specific snapshots:

``` r
path_snapshot("ALD.BV.csv.gz") %>% 
  readr::read_csv()
#> # A tibble: 119,821 x 11
#>    ALD.ID ALD.Location DomicileCountry Sector Technology  Year
#>     <dbl> <chr>        <chr>           <chr>  <chr>      <dbl>
#>  1 1.24e7 US           DE              Power  Renewable~  2013
#>  2 1.24e7 US           DE              Power  Renewable~  2014
#>  3 1.24e7 US           DE              Power  Renewable~  2015
#>  4 1.24e7 US           DE              Power  Renewable~  2016
#>  5 1.24e7 US           DE              Power  Renewable~  2017
#>  6 1.24e7 US           DE              Power  Renewable~  2018
#>  7 1.24e7 US           DE              Power  Renewable~  2019
#>  8 1.24e7 US           DE              Power  Renewable~  2020
#>  9 1.24e7 US           DE              Power  Renewable~  2021
#> 10 1.24e7 US           DE              Power  Renewable~  2022
#> # ... with 119,811 more rows, and 5 more variables: ALD.Production <dbl>,
#> #   ALD.ProductionUnits <chr>, ALD.EmissionsFactor <dbl>,
#> #   ALD.link.Level <chr>, CompanyName <chr>

path_snapshot("TYPE.BONDS.txt") %>% 
  readr::read_lines()
#> [1] "Corporate Bonds"                   "Corporate inflation linked Bonds" 
#> [3] "Convertible Bonds"                 "Government inflation linked Bonds"
#> [5] "Government Non-Mort. Debt"         "Mortgage Debt"                    
#> [7] "Other Collateralized Debt"
```
