Workout 1
================
Jeonghyeon Dang
3/13/2019

Five GSW players : Iguodala, Green, Durant, Thompson, and Curry. Who has the best shooting accuracy?
====================================================================================================

![GSW](https://cdn.nba.net/nba-drupal-prod/styles/landscape_2090w/s3/2017-12/GettyImages-684463444.jpg?itok=CMilmuEa)

Data
----

Andre Iguodala has the most shooting accuracy for 2-point His shooting success shooting rate is above 63%

### 2PT Effective Shooting % by Player

``` r
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
datafile <- "../data/shots-data.csv"
dat <- read.csv(
  datafile
)

two_eff <- summarise(
  group_by(dat,name),
  total = length(shot_type[shot_type 
                 == "2PT Field Goal"]),
  made = length(shot_made_flag[shot_made_flag == 'shot_yes' & shot_type =='2PT Field Goal']),
  perc_made = made/total*100
  )

two_eff <- arrange(two_eff,-perc_made)

two_eff
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134      63.8
    ## 2 Kevin Durant     643   390      60.7
    ## 3 Stephen Curry    563   304      54.0
    ## 4 Klay Thompson    640   329      51.4
    ## 5 Graymond Green   346   171      49.4

Klay Thompson has the most shooting accuracy for 3-point His shooting success shooting rate is above 42%

#### 3PT Effective Shooting % by Player

``` r
three_eff <- summarise(
  group_by(dat,name),
  total = length(shot_type[shot_type 
                 == "3PT Field Goal"]),
  made = length(shot_made_flag[shot_made_flag == 'shot_yes' & shot_type =='3PT Field Goal']),
  perc_made = made/total*100
  )

three_eff <- arrange(three_eff,-perc_made)

three_eff
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246      42.4
    ## 2 Stephen Curry    687   280      40.8
    ## 3 Kevin Durant     272   105      38.6
    ## 4 Andre Iguodala   161    58      36.0
    ## 5 Graymond Green   232    74      31.9

#### Total Effective Shooting % by Player

``` r
total_eff <- summarise(
  group_by(dat,name),
  total = length(shot_made_flag),
  made = length(shot_made_flag[shot_made_flag == "shot_yes"]),
  perc_made = made/total*100
  )

total_eff <- arrange(total_eff,-perc_made)
total_eff
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495      54.1
    ## 2 Andre Iguodala   371   192      51.8
    ## 3 Klay Thompson   1220   575      47.1
    ## 4 Stephen Curry   1250   584      46.7
    ## 5 Graymond Green   578   245      42.4

Klay Thompson has more 3-points accuracy than Stephen Curry. Most of people thinks that Curry is the best 3-points player in GSW but by the stat, it is not true.

#### GSW shooting charts

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />
