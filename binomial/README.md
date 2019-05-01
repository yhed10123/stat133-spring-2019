<!-- README.md is generated from README.Rmd. Please edit that file -->
binomial
========

<!-- badges: start -->
<!-- badges: end -->
The goal of the `"binomial"` package is to provide functions for calculating the properties of the binomial random variable, including:
- `bin_variable()` creates a binomial variable when given `n` trials and `p` probability

-   `bin_probability()` calculates the probability of getting `k` successes out of `n` trials with a probability `p`

-   `bin_distribution()` outputs a data frame of the binomial distribution of `n` trials given a probability of `p`

-   `bin_cumulative()` outputs a data frame of cumulative binomial distribution given a `n` trials and a probability of `p`

-   `bin_mode()`, `bin_mean()`, `bin_variance()`, `bin_skewness()`, `bin_kurtosis()` are summary measures

Installation
------------

You can install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat133-sp19/hw-stat133-yangluanne")
```

Example
-------

``` r
library(binomial)

# binomial random variable
X <- bin_variable(trials = 5, prob = 0.5)
X
#> "Binomial variable" 
#> 
#> Parameters
#> - number of trials: 5 
#> - prob of success: 0.5

# binomial probability
bin_probability(success = 2, trials = 5, prob = 0.5)
#> [1] 0.3125

# binomial distribution
dist <- bin_distribution(trials = 5, prob = 0.5)
dist
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125

# binomial ditribution plot
plot(dist)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

``` r

# binomial cumulative distribution
cumu <- bin_cumulative(trials = 5, prob = 0.5)
cumu
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000

# binomial cumulative distribution plot
plot(cumu)
```

<img src="man/figures/README-unnamed-chunk-2-2.png" width="100%" />

``` r

# binomial random variable summary statistics
summary(X)
#> "Summary Binomial" 
#> 
#> Parameters 
#> - number of trials: 5 
#> - prob of success: 0.5 
#> 
#> Measures 
#> - mean    : 2.5 
#> - variance: 1.25 
#> - mode    : 3 2 
#> - skewness: 0 
#> - kurtosis: -0.4

# summary measures
bin_mean(5, 0.5)
#> [1] 2.5
bin_variance(5, 0.5)
#> [1] 1.25
bin_mode(5, 0.5)
#> [1] 3 2
bin_skewness(5, 0.5)
#> [1] 0
bin_kurtosis(5, 0.5)
#> [1] -0.4
```
