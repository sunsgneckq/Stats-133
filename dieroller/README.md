
Overview
========

"dieroller"" is a minimal R package that provides functions to simulate rolloing a die. \* die() creates a die object (of class "die") \* roll() roll a die object producing a "roll" object. \* plot() method for a "roll" object to plot frequencies of sides. \* summary() method for a "roll" object.

Motivation
==========

This package has been developed to illustrate some of the concepts behind the creation of an R package

Installation
============

Install the development version from GitHub via the package "devtools":

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "dieroller" (without vignettes)
devtools::install_github("sunsgne0211/dieroller")
#> Downloading GitHub repo sunsgne0211/dieroller@master
#> from URL https://api.github.com/repos/sunsgne0211/dieroller/zipball/master
#> Installation failed: stop(github_error(request)) : Not Found (404)

# install "dieroller" (with vignettes)
devtools::install_github("sunsgne0211/dieroller", build_vignettes = TRUE)
#> Downloading GitHub repo sunsgne0211/dieroller@master
#> from URL https://api.github.com/repos/sunsgne0211/dieroller/zipball/master
#> Installation failed: stop(github_error(request)) : Not Found (404)
```

Usage
=====

``` r
library(dieroller)

#default dice
die1 <- die()
die1
#> object "die"
#> 
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667

# 1 roll of die1
roll(die1)
#> object "roll"
#> 
#> $rolls
#> [1] 4

#6 rolls of die1
roll60 <- roll(die1, times = 60)
roll60
#> object "roll"
#> 
#> $rolls
#>  [1] 4 4 1 4 6 2 2 5 4 3 1 6 2 6 6 3 6 2 5 5 3 1 6 3 2 3 3 4 6 2 5 4 4 4 2
#> [36] 1 2 1 6 3 5 4 4 2 3 6 2 3 4 3 6 5 5 2 4 5 1 3 5 5

#summary
summary(roll60)
#> summary "roll"
#> 
#>   side count      prop
#> 1    1     6 0.1000000
#> 2    2    11 0.1833333
#> 3    3    11 0.1833333
#> 4    4    12 0.2000000
#> 5    5    10 0.1666667
#> 6    6    10 0.1666667

#100 rolls
roll100<- roll(die1, times=100)
roll100
#> object "roll"
#> 
#> $rolls
#>   [1] 1 6 6 6 4 1 3 3 4 4 4 3 5 4 5 5 6 4 1 3 5 3 4 3 3 3 6 3 5 6 1 1 1 5 6
#>  [36] 5 5 5 5 5 5 4 2 3 5 6 4 6 5 2 6 1 1 3 2 6 3 3 4 6 4 3 5 6 3 3 6 4 6 3
#>  [71] 2 1 4 2 1 6 6 3 5 4 2 4 4 3 4 6 4 4 4 3 6 3 3 3 2 4 1 1 2 4

#summary
summary(roll100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    12 0.12
#> 2    2     8 0.08
#> 3    3    23 0.23
#> 4    4    22 0.22
#> 5    5    16 0.16
#> 6    6    19 0.19
```
