context("test-private-function")

test_that("aux_mean works as expected", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(15, 0.5), 7.5)
  expect_equal(aux_mean(30, 0.8), 24)
  expect_type(aux_mean(10, 0.3), 'double')
  expect_length(aux_mean(10, 0.3), 1)
})

test_that("aux_variance works as expected", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(15, 0.5), 3.75)
  expect_equal(aux_variance(30, 0.8), 4.8)
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that("aux_mode works as expected", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(30, 0.8), 24)
  expect_type(aux_variance(10, 0.3), 'double')
  expect_length(aux_variance(10, 0.3), 1)
})

test_that('aux_skewness works as expected', {
  expect_equal(round(aux_skewness(10, 0.3), 2), 0.28)
  expect_equal(aux_skewness(15, 0.5), 0)
  expect_type(aux_skewness(10, 0.3), 'double')
  expect_length(aux_skewness(10, 0.3), 1)
})

test_that('aux_kurtosis works as expected', {
  expect_equal(round(aux_kurtosis(10, 0.3), 2), -0.12)
  expect_type(aux_kurtosis(20, 0.3), 'double')
  expect_length(aux_kurtosis(20, 0.3), 1)
})
