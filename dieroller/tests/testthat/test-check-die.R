context("Check die argument")

test_that("check_sides with ok vectors",{
  expect_true(check_sides(c("a","b","c","d","e","f")))
  expect_true(check_sides(c(1,2,3,4,5,6)))
})


test_that("check_sides fails with invalid length",{
  expect_error(check_sides(c(1,2,3,4,5)))
  expect_error(check_sides(1))
})

test_that("check_sides fails with invalid type",{
  expect_error(check_sides(c(TRUE, FALSE,TRUE, FALSE,TRUE, FALSE)))
})

test_that("check_prob with ok probability",{
  expect_true(check_prob(c(1/6,1/6,1/6,1/6,1/6,1/6)))
  expect_true(check_prob(c(0.1,0.1,0.1,0.1,0.1,0.5)))
})


test_that("check_prob fails with invalid sum",{
  expect_error(check_prob(c(0.2,0.1,0.1,0.1,0.5,0.1)))
  expect_error(check_prob(c(0.2,0.1,0.1,0.1,0.5,0.8)))
})

test_that("check_prob fails with invalid type",{
  expect_error(check_prob(c("one","two","three","four","five","six")))
})

test_that("check_prob fails with invalid number",{
  expect_error(check_prob(c(-0.1,-0.2,-0,3,-0.4,-0.5,-0.6)))
})

test_that("die work under correct class",{
  expect_equal(class(die()), "die")
})

test_that("the first column vector of die() is sides of a fair die",{
  expect_equal(die()$side, c(1,2,3,4,5,6))
})

test_that("the second column vector of die() is the probabilities for a fair die",{
  expect_equal(die()$prob, c(1/6,1/6,1/6,1/6,1/6,1/6))
})
