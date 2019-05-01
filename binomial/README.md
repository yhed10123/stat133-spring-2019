
## Binomial Distribution

The package `"binomial"` is a minimal implementation for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance.

## Function bin_choose()

Function bin_choose() that calculates the number of combinations in which k successes can occur in n trials.

```r

bin_choose(n = 5, k = 2)
```

```
## [1] 10
```

```r
bin_choose(5, 0)
```

```
## [1] 1
```

```r
bin_choose(5, 1:3)
```

```
## [1]  5 10 10
```

---

## Function bin_probability()

Function bin_probability() that calculates the probability of getting k successes in n trials with specific probability of success.


```r
# probability of getting 2 successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(success = 2, trials = 5, prob = 0.5)
```

```
## [1] 0.3125
```

```r
# probabilities of getting 2 or less successes in 5 trials
# (assuming prob of success = 0.5)
bin_probability(success = 0:2, trials = 5, prob = 0.5)
```

```
## [1] 0.03125 0.15625 0.31250
```

```r
# 55 heads in 100 tosses of a loaded coin with 45% chance of heads
bin_probability(success = 55, trials = 100, prob = 0.45)
```

```
## [1] 0.01075277
```

---

## Function bin_distribution()

Function bin_distribution() that returns a data frame with the probability distribution: sucesses in the first column, probability in the second column.


```r
# binomial probability distribution
bin_distribution(trials = 5, prob = 0.5)
```

```
##   success probability
## 1       0     0.03125
## 2       1     0.15625
## 3       2     0.31250
## 4       3     0.31250
## 5       4     0.15625
## 6       5     0.03125
```

### Function plot.bindis()
plot.bindis() that graphs a barplot to display the probability histogram of a binomial distribution object "bindis".


```r
# plotting binomial probability distribution
dis1 <- bin_distribution(trials = 5, prob = 0.5)
plot(dis1)
```

![](unnamed-chunk-4-1)<!-- -->

---

## Function bin_cumulative()

Function bin_cumulative() that returns a data frame with both the probability distribution and the cumulative probabilities: sucesses in the first column, probability in the second column, and cumulative in the third column.


```r
# binomial cumulative distribution
bin_cumulative(trials = 5, prob = 0.5)
```

```
##   success probability cumulative
## 1       0     0.03125    0.03125
## 2       1     0.15625    0.18750
## 3       2     0.31250    0.50000
## 4       3     0.31250    0.81250
## 5       4     0.15625    0.96875
## 6       5     0.03125    1.00000
```

### Function plot.bincum()
plot.bincum() that graphs the cumulative distribution in ab object "bincum".


```r
# plotting binomial cumulative distribution
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
plot(dis2)
```

![](unnamed-chunk-6-1.png)<!-- -->

---


## Function bin_variable()

Function bin_variable() returns an object of class "binvar", that is, a binomial random variable object.

### Method print.binvar()

Method function print.binvar() to be able to nicely print the content of an object "binvar".


```r
bin1 <- bin_variable(trials = 10, p = 0.3)
bin1
```

```
## "Binomial variable" 
## 
## Parameters
## - number of trials: 10 
## - prob of success: 0.3
```


### Methods summary.binvar() and print.summary.binvar()

Methods summary.binvar() returns a list of class "summary.binvar" containing named elements:

* – trials: number of trials
* – prob: probability of success
* – mean: mean or expected value
* – variance: variance
* – mode: mode
* – skewness: skewness
* – kurtosis: kurtosis

Methods print.summary.binvar() to nicely print the contents of an object "summary.binvar".


```r
binsum1 <- summary(bin1)
binsum1
```

```
## "Summary Binomial" 
## 
## Parameters 
## - number of trials: 10 
## - prob of success: 0.3 
## 
## Measures 
## - mean    : 3 
## - variance: 2.1 
## - mode    : 3 
## - skewness: 0.2760262 
## - kurtosis: -0.1238095
```
