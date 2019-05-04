context("test-check-function")

test_that("check_prob works correctly", {
  expect_true(check_prob(0.5))
  expect_type(check_prob(0.5), 'logical')
  expect_length(check_prob(0.5), 1)

  expect_error(check_prob(-1), '\ninvalid probability value')
  expect_error(check_prob(2), '\ninvalid probability value')
})

test_that("check_trials works correctly", {
  expect_true(check_trials(1))
  expect_type(check_trials(1), 'logical')

  expect_error(check_trials(-1), '\ninvalid trials value')
})

test_that("check_success works correctly", {
  expect_true(check_success(c(1, 2, 3), 4))
  expect_type(check_success(c(1, 2, 3), 4), 'logical')

  expect_error(check_success(c(TRUE, FALSE), 2), '\ninvalid success value')
  expect_error(check_success(c(), 2), '\ninvalid success value')
  expect_error(check_success(c(1, 2, 3), -1), '\nsuccess cannot be greater than trials')
})
