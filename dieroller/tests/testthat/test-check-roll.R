context("Check roll arguments")

test_that("check_time with ok value",{
  expect_true(check_times(1))
  expect_true(check_times(5))
  expect_true(check_times(8))
})

test_that("check_time fails with invalid number",{
  expect_error(check_times(8.6))
  expect_error(check_times(-8.6))
  expect_error(check_times("a"))
})

test_that("roll work with the right class",{
fair_die <- die()
set.seed(123)
expect_equal(class(roll(fair_die, times = 50)), "roll")
})

test_that("names of the class 'roll'",{
  fair_die <- die()
  expect_equal(names(roll(fair_die, times = 50)), c("rolls", "sides","prob", "total"))
})

test_that("total of the fair50 die has total of 50",{
  fair_die <- die()
  expect_equal(roll(fair_die, times = 50)$total, 50)
})




