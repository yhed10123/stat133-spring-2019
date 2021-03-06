% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_probability}
\alias{bin_probability}
\title{Binomial Probability}
\usage{
bin_probability(success, trials, prob)
}
\arguments{
\item{success}{number of successes}

\item{trials}{number of trials}

\item{prob}{probability}
}
\value{
probability value
}
\description{
Computes the binomial probability
}
\examples{
bin_probability(2, 5, 0.5)
bin_probability(success = 0:2, trials = 5, prob = 0.5)
bin_probability(success = 55, trials = 100, prob = 0.45)
}
