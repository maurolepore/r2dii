
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r2dii <a href='https://github.com/2DegreesInvesting/r2dii'><img src='https://imgur.com/A5ASZPE.png' align='right' height='43' /></a>

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/r2dii)](https://CRAN.R-project.org/package=r2dii)
[![Travis build
status](https://travis-ci.org/2DegreesInvesting/r2dii.svg?branch=master)](https://travis-ci.org/2DegreesInvesting/r2dii)
[![Travis build
status](https://travis-ci.com/2degreesinvesting/r2dii.svg?branch=master)](https://travis-ci.com/2degreesinvesting/r2dii)
<!-- badges: end -->

[2 ° Investing Initiative](https://2degrees-investing.org/) maintains a
collection or R packages called r2dii. To help you install and use all
those packages at once, we also built the meta package r2dii. Run
`library(r2dii)` to see the name of all packages in r2dii. Learn more
about each package at “<https://2degreesinvesting.github.io/PACKAGE/>” –
for example, the website of the package r2dii.data is at
<https://2degreesinvesting.github.io/r2dii.data/>.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("2DegreesInvesting/r2dii")
```

[How to minimize installation
errors?](https://gist.github.com/maurolepore/a0187be9d40aee95a43f20a85f4caed6#installation)

## Example

These examples provide a high level overview of the main features. For
more details see [Get started](articles/r2dii.html).

Attaching r2dii automatically attaches other r2dii packages.

``` r
library(r2dii)
#> Loading required package: r2dii.data
#> Loading required package: r2dii.dataraw
#> Loading required package: r2dii.utils
#> Loading required package: r2dii.match
```

r2dii includes some utility functions.

``` r
degrees()
#> [1] "°"
sprintf("Welcome to 2%s Investing Initiative!", degrees())
#> [1] "Welcome to 2° Investing Initiative!"

clean_column_names(dplyr::group_by(tibble::tibble(x.x = 1), x.x))
#> # A tibble: 1 x 1
#> # Groups:   x_x [1]
#>     x_x
#>   <dbl>
#> 1     1

# Fails
check_crucial_names(c(x = 1), expected_names = c("x", "y"))
#> Error: Must have missing names:
#> y
```

It also includes datasets for examples and tests.

``` r
# Column definitions for all datasets
data_dictionary
#> # A tibble: 70 x 4
#>    dataset  column             typeof  definition                               
#>    <chr>    <chr>              <chr>   <chr>                                    
#>  1 ald_demo ald_timestamp      charac… Date at which asset data was pulled from…
#>  2 ald_demo country_of_domici… charac… Country where company is registered      
#>  3 ald_demo emission_factor    double  Company level emission factor of the tec…
#>  4 ald_demo is_ultimate_liste… logical Flag if company is the listed ultimate p…
#>  5 ald_demo is_ultimate_owner  logical Flag if company is the ultimate parent i…
#>  6 ald_demo name_company       charac… The name of the company owning the asset 
#>  7 ald_demo number_of_assets   integer Number of assets of a given technology o…
#>  8 ald_demo plant_location     charac… Country where asset is located           
#>  9 ald_demo production         double  Company level production of the technolo…
#> 10 ald_demo production_unit    charac… The units that production is measured in 
#> # … with 60 more rows

# Some example datasets
loanbook_demo
#> # A tibble: 320 x 19
#>    id_loan id_direct_loant… name_direct_loa… id_intermediate… name_intermedia…
#>    <chr>   <chr>            <chr>            <chr>            <chr>           
#>  1 L1      C294             Yuamen Xinneng … <NA>             <NA>            
#>  2 L2      C293             Yuamen Changyua… <NA>             <NA>            
#>  3 L3      C292             Yuama Ethanol L… IP5              Yuama Inc.      
#>  4 L4      C299             Yudaksel Holdin… <NA>             <NA>            
#>  5 L5      C305             Yukon Energy Co… <NA>             <NA>            
#>  6 L6      C304             Yukon Developme… <NA>             <NA>            
#>  7 L7      C227             Yaugoa-Zapadnay… <NA>             <NA>            
#>  8 L8      C303             Yueyang City Co… <NA>             <NA>            
#>  9 L9      C301             Yuedxiu Corp One IP10             Yuedxiu Group   
#> 10 L10     C302             Yuexi County AA… <NA>             <NA>            
#> # … with 310 more rows, and 14 more variables: id_ultimate_parent <chr>,
#> #   name_ultimate_parent <chr>, loan_size_outstanding <dbl>,
#> #   loan_size_outstanding_currency <chr>, loan_size_credit_limit <dbl>,
#> #   loan_size_credit_limit_currency <chr>, sector_classification_system <chr>,
#> #   sector_classification_input_type <chr>,
#> #   sector_classification_direct_loantaker <dbl>, fi_type <chr>,
#> #   flag_project_finance_loan <chr>, name_project <lgl>,
#> #   lei_direct_loantaker <lgl>, isin_direct_loantaker <lgl>
ald_demo
#> # A tibble: 17,368 x 13
#>    name_company sector technology production_unit  year production
#>    <chr>        <chr>  <chr>      <chr>           <dbl>      <dbl>
#>  1 aba hydropo… power  hydrocap   MW               2013    133340.
#>  2 aba hydropo… power  hydrocap   MW               2014    131582.
#>  3 aba hydropo… power  hydrocap   MW               2015    129824.
#>  4 aba hydropo… power  hydrocap   MW               2016    128065.
#>  5 aba hydropo… power  hydrocap   MW               2017    126307.
#>  6 aba hydropo… power  hydrocap   MW               2018    124549.
#>  7 aba hydropo… power  hydrocap   MW               2019    122790.
#>  8 aba hydropo… power  hydrocap   MW               2020    121032.
#>  9 aba hydropo… power  hydrocap   MW               2021    119274.
#> 10 aba hydropo… power  hydrocap   MW               2022    117515.
#> # … with 17,358 more rows, and 7 more variables: emission_factor <dbl>,
#> #   country_of_domicile <chr>, plant_location <chr>, number_of_assets <dbl>,
#> #   is_ultimate_owner <lgl>, is_ultimate_listed_owner <lgl>,
#> #   ald_timestamp <chr>
```

And it provides tools to match financial portfolios with climate data.

``` r
match_name(loanbook_demo, ald_demo) %>% 
  prioritize()
#> # A tibble: 267 x 27
#>    id_loan id_direct_loant… name_direct_loa… id_intermediate… name_intermedia…
#>    <chr>   <chr>            <chr>            <chr>            <chr>           
#>  1 L151    C168             Shaanxi Auto     <NA>             <NA>            
#>  2 L152    C169             Shandong Auto    <NA>             <NA>            
#>  3 L153    C170             Shandong Kama    <NA>             <NA>            
#>  4 L154    C171             Shandong Tangju… <NA>             <NA>            
#>  5 L155    C173             Shanghai Automo… <NA>             <NA>            
#>  6 L156    C176             Shanxi Dayun     <NA>             <NA>            
#>  7 L157    C178             Shenyang Polars… <NA>             <NA>            
#>  8 L158    C180             Shuanghuan Auto  <NA>             <NA>            
#>  9 L159    C182             Sichuan Auto     <NA>             <NA>            
#> 10 L160    C184             Singulato        <NA>             <NA>            
#> # … with 257 more rows, and 22 more variables: id_ultimate_parent <chr>,
#> #   name_ultimate_parent <chr>, loan_size_outstanding <dbl>,
#> #   loan_size_outstanding_currency <chr>, loan_size_credit_limit <dbl>,
#> #   loan_size_credit_limit_currency <chr>, sector_classification_system <chr>,
#> #   sector_classification_input_type <chr>,
#> #   sector_classification_direct_loantaker <dbl>, fi_type <chr>,
#> #   flag_project_finance_loan <chr>, name_project <lgl>,
#> #   lei_direct_loantaker <lgl>, isin_direct_loantaker <lgl>, id_2dii <chr>,
#> #   level <chr>, sector <chr>, sector_ald <chr>, name <chr>, name_ald <chr>,
#> #   score <dbl>, source <chr>
```
