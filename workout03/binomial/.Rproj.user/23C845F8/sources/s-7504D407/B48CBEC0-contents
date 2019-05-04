#' @importFrom graphics barplot
#' @importFrom graphics plot
#' @importFrom graphics lines plot
#' @docType package


# private function to check that the input for prob values

check_prob <- function(prob){
  if(prob<=1 & prob >= 0){
    return(TRUE)
  }
  else{
    stop("\ninvalid probability value")
  }
}

# private function to check that the input for trials values
check_trials <- function(trials) {
  if (!is.numeric(trials)) {
    stop("\ninvalid trials value")
  } else if (trials >= 0 & trials %% 1 == 0) {
    return(TRUE)
  } else {
    stop("\ninvalid trials value")
  }
}

# test if an input success is a valid value for number of successes
check_success <- function(success, trials) {
  if (length(trials) != 1) {
    stop("\ninvalid trials value")
  } else if (!is.numeric(success))
    stop("\ninvalid success value")
  else if (any(success < 0)) {
    stop("\ninvalid success value")
  } else if (any(success %% 1 != 0)) {
    stop("\ninvalid success value")
  } else if (any(success > trials)) {
    stop("\nsuccess cannot be greater than trials")
  }
  return(TRUE)
}


# private to compute mean of a binomial distribution
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# private to compute vaiance of a binomial distribution
aux_variance <- function(trials, prob) {
  return(trials * prob * (1 - prob))
}

# private to compute mode of a binomial distribution
aux_mode <- function(trials, prob){
  return(as.integer(trials*prob+prob))
}


# private to compute skewness of a binomial distribution
aux_skewness <- function(trials, prob){
  return((1 - 2 * prob) / sqrt(trials * prob * (1 - prob)))
}

# private to compute kurtosis of a binomial distribution
aux_kurtosis <- function(trials, prob) {
  return((1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob)))
}

#' @title Combinations
#' @description Compute number of combinations
#' @param n number of trials
#' @param k number of successes
#' @return number of combinations
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(n, k) {
  if (any(k > n)) {
    stop("k cannot be greater than n")
  } else {
    return(factorial(n) / (factorial(k) * factorial(n - k)))
  }
}

#' @title Binomial Probability
#' @description Computes the binomial probability
#' @param trials number of trials
#' @param success number of successes
#' @param prob probability
#' @return probability value
#' @export
#' @examples
#' bin_probability(2, 5, 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob) {
  n <- trials
  k <- success
  p <- prob

  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  bin_choose(n, k) * p^k * ((1-p)^(n-k))
}

#' @title Binomial Distribution
#' @description Computes binomial distribution
#' @param trials number of trials
#' @param prob probability
#' @return Data frame with the Probability Value
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#' dis1 <- bin_distribution(5, 0.5)
#' plot(dis1)
bin_distribution <- function(trials, prob) {
  success_vector <- 0:trials
  prob_vector <- bin_probability(success_vector, trials, prob)
  df <- data.frame(success = success_vector, probability = prob_vector)
  class(df) <- append("bindis", class(df))
  return(df)

}

#' @export
plot.bindis <- function(x, ...) {
  barplot(x$probability, names.arg = x$success, xlab = "Success", ylab = "Probability")
}


#' @title Cumulated Distribution
#' @description Computes Cumulated distribution
#' @param trials number of trials
#' @param prob probability
#' @return Data frame with the Probability Value and Cumulated Value
#' @export
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)

bin_cumulative <- function(trials, prob) {
  prob_dist <- bin_probability(0:trials, trials, prob)
  output <- data.frame(

    success = 0:trials,

    probability = prob_dist,

    cumulative = cumsum(prob_dist)
  )

  class(output) <- c('bincum', 'data.frame')
  return(output)
}

#' @export
plot.bincum <- function(x, ...) {
  plot(x = x$success, y = x$cumulative, type = "o", xlab = "Success", ylab = "Probability")
}


#' @title Binomial Variable
#' @description Compute Binomial Variable
#' @param trials number of trials
#' @param prob probability
#' @return A Binomial Random Variable
#' @export
#' @examples
#' bin1 <- bin_variable(trials = 5, prob = 0.5)
#' summary(bin1)
#'
bin_variable <- function(trials, prob) {
  check_trials(trials)

  check_prob(prob)

  lst <- list(trials = trials,
             prob = prob)

  class(lst) <- c('binvar')
  lst
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable" \n\n')

  cat('Parameters\n')
  cat('- number of trials:', x$trials, '\n')
  cat('- prob of success:', x$prob)
  invisible(x)
}

#' @export
summary.binvar <- function(object, ...) {
  lst <- list(trials = object$trials,
              prob = object$prob,
              mean = aux_mean(object$trials, object$prob),
              variance = aux_variance(object$trials, object$prob),
              mode = aux_mode(object$trials, object$prob),
              skewness = aux_skewness(object$trials, object$prob),
              kurtosis = aux_kurtosis(object$trials, object$prob))
  class(lst) <- 'summary.binvar'
  lst
}

#' @export
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial" \n\n')
  cat('Parameters \n')
  cat('- number of trials:', x$trials, '\n')
  cat('- prob of success:', x$prob, '\n\n')
  cat('Measures \n')
  cat('- mean    :', x$mean, '\n')
  cat('- variance:', x$variance, '\n')
  cat('- mode    :', x$mode, '\n')
  cat('- skewness:', x$skewness, '\n')
  cat('- kurtosis:', x$kurtosis)
  invisible(x)
}

#' @title Binomial Mean
#' @description Compute Binomial Mean Value
#' @param trials number of trials
#' @param prob probability
#' @return The Mean Value
#' @export
#' @examples
#' bin_mean(trials = 10, prob = 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials, prob))
}

#' @title Binomial Variance
#' @description Compute Binomial Variance Value
#' @param trials number of trials; numeric vector
#' @param prob probability
#' @return The Variance Value
#' @export
#' @examples
#' bin_variance(trials = 10, prob = 0.3)

bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials, prob))
}

#' @title Binomial Mode
#' @description Compute Binomial Mode Value
#' @param trials number of trials
#' @param prob probability
#' @return The Mode
#' @export
#' @examples
#' bin_mode(trials = 10, prob = 0.3)

bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness
#' @description Compute Binomial Skewness Value
#' @param trials number of trials
#' @param prob probability
#' @return The Skewness
#' @export
#' @examples
#' bin_skewness(trials = 10, prob = 0.3)

bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis
#' @description Compute Binomial Kurtosis Value
#' @param trials number of trials
#' @param prob probability
#' @return The kurtosis
#' @export
#' @examples
#' bin_kurtosis(trials = 10, prob = 0.3)

bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials, prob))
}

