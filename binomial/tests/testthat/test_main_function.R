context("test-test-main-function")

test_that("bin_choose works correctly", {
  expect_equal(bin_choose(5, 2), 10)
  expect_equal(bin_choose(5, 0), 1)
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_length(bin_choose(5, 1:3), 3)
  expect_error(bin_choose(5, 6), "k cannot be greater than n")
  expect_error(bin_choose(5, c(1, 2, 6)), "k cannot be greater than n")
})

test_that("bin_probability works correctly", {
  expect_equal(bin_probability(success = 2, trials = 5, prob = 0.5), 0.3125)
  expect_length(bin_probability(success = 0:2, trials = 5, prob = 0.5), 3)
  expect_error(bin_probability(2, -1, 0.5))
  expect_equal(bin_probability(2, 5, 0.5), 0.3125)
  expect_error(bin_probability(2, 3, 1.5))
  expect_error(bin_probability(c(), 3, 0.5))
})

test_that("bin_distribution works as expected",{
  expect_is(bin_distribution(trials = 5, prob = 0.5), c('bindis', 'data.frame'))
  expect_length(bin_distribution(trials = 5, prob = 0.5), 2)
  expect_length(bin_distribution(trials = 5, prob = 0.5)[[1]], 6)
  expect_equal(length(bin_distribution(5, 0.5)$success), 6)
  expect_equal(bin_distribution(trials = 5, prob = 0.5)[[2]][1], 0.03125)
})

test_that("bin_cumulative works as expected", {
  expect_length(bin_cumulative(trials = 5, prob = 0.5), 3)
  expect_length(bin_cumulative(trials = 5, prob = 0.5)[[1]], 6)
  expect_equal(bin_cumulative(trials = 5, prob = 0.5)[[3]][2], 0.18750)
  expect_equal(ncol(bin_cumulative(5, 0.5)), 3)
})
