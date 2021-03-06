% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/binomial.R
\name{bin_choose}
\alias{bin_choose}
\title{Combinations}
\usage{
bin_choose(n, k)
}
\arguments{
\item{n}{number of trials}

\item{k}{number of successes}
}
\value{
number of combinations
}
\description{
Compute number of combinations
}
\examples{
bin_choose(n = 5, k = 2)
bin_choose(5, 0)
bin_choose(5, 1:3)
}
