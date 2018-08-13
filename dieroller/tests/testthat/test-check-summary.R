context("Check summary arguments")

test_that("the class of the summary",{
set.seed(123)
fair50die<- roll(fair_die, times = 50)
expect_equal(class(summary(fair50die)), "summary.roll")
})

test_that("the name of the summart",{
  set.seed(123)
  fair50die<- roll(fair_die, times = 50)
  expect_equal(names(summary(fair50die)), "freqs")
})


test_that("the name of the summart",{
  set.seed(123)
  fair50die<- roll(fair_die, times = 50)
  expect_equal(summary(fair50die)$freqs, data.frame(side= c(1,2,3,4,5,6), count= c(11,8,9,8,7,7), prop = c(0.22,0.16,0.18,0.16,0.14,0.14)))
})
