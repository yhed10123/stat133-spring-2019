
Overview
--------

\`"binomial" is an R package that provides basic tools for simulating and analyzing binomial random variables.

Important package members include:

-   `bin_variable()` constructs an object that represents a binomial random variable.
-   `bin_probability()` returns the probability that a binomial random variable with the specified shape parameters take on a particular value.
-   `bin_distribution()` returns the probability mass function of a binomal random variable with the specified shape parameters
-   `bin_cumulative()` returns the cumulative distribution function of a binomal random variable with the specified shape parameters
-   `summary()` method of `binvar` objects
-   `plot()` method of `bindis` and `cumdis` objects

Motivation
----------

The purpose of the `"binomial"` package is to provide minimal tools for simulating and analyzing binomial random variables.

Installation
------------

Install the `"binomial"` package from GitHub with the following commands:

``` r
install.packages("devtools") 
devtools::install_github("stat133-spring-2019/binomial")
```

Usage
-----

``` r
library(binomial)

bernoulli <- bin_variable(1, 0.5)
bernoulli
#> "Binomial Variable" 
#> 
#> Parameters 
#> - number of trials: 1 
#> - prob of success : 0.5
#> "Binomial Variable" 
#>
#> Parameters 
#> - number of trials: 1 
#> - prob of success : 0.5

bin_distribution(bernoulli$trials, bernoulli$prob)
#>   success probability
#> 1       0         0.5
#> 2       1         0.5
#>   success probability
#> 1       0         0.5
#> 2       1         0.5

bin_probability(1, bernoulli$trials, bernoulli$prob)
#> [1] 0.5
#> [1] 0.5

summary(bernoulli)
#> "Binomial Variable" 
#> 
#> Parameters 
#> - number of trials: 1 
#> - prob of success : 0.5 
#> 
#> Measures 
#> - mean    : 0.5 
#> - variance: 0.25 
#> - mode    : 0 
#> - skewness: 0 
#> - kurtosis: -2
#> "Binomial Variable" 
#>
#> Parameters 
#> - number of trials: 1 
#> - prob of success : 0.5 
#>
#> Measures 
#> - mean    : 0.5 
#> - variance: 0.25 
#> - mode    : 0 
#> - skewness: 0 
#> - kurtosis: -2
```
