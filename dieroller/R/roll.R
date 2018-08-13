##title: roll.R
##description:Create an object of roll
##input:  die, times
##output: Dataframe with sides and probability


#' @title check times validity
#' @description Creates an function to check if the times input is validity
#' @param  times how many times of the dice is rolled
#' @return True
#' @return error message if certain conditions meet
#' @export
check_times <- function(times) {
  if (times <= 0) {
    stop("\nargument 'times' must be positive")
  }
  if (times%%1 != 0){
    stop("\narugument 'times' must be integer")
  }
  if (is.numeric(times) != TRUE){
    stop("\nargument 'times' must be numeric")
  }
  TRUE
}


#' @title roll
#' @description Creates an function to generate random samples
#' @param die (after passing through die())
#' @param times how many times the dice is rolled
#' @return a list contains rolls, sides, prob, and total
#' @export
roll<- function(die, times = 1){
  check_times(times)
  samples<- sample(die$side, size= times, replace= TRUE, prob=die$prob)
  output <- list(rolls = c(samples), sides = c(die$side), prob = die$prob, total = times)
  class(output)<- "roll"
  return(output)
}

#' @title print.roll
#' @description Creates an function to print the organized data of roll()
#' @param x function that is passed in after die()
#' @return a list contains rolls
#' @export
print.roll <- function(x) {
  cat('object "roll"\n\n')
  rolls= list(rolls = x$rolls)
  print(rolls)
  invisible(x)
}

fair_die <- die()
set.seed(123)
fair50 <- roll(fair_die, times = 50)
fair50


#' @title summary.roll
#' @description Creates an function to generate summary for roll
#' @param object list of variables
#' @return a data frame contains column of side, count, and prop
#' @export
summary.roll <- function(object) {
  side = object$sides
  count = as.vector(unname(table(object$rolls)))
  prop = as.vector(unname(table(object$rolls)))/object$total
  freqs<- data.frame(side= side, count=count, prop=prop)
  output <- list(freqs = freqs)
  class(output)<-"summary.roll"
  return(output)
}

#' @title print.summary.roll
#' @description Creates an function to print summary for roll
#' @param x an organized data frame
#' @return a data frame contains column of side, count, and prop
#' @export
print.summary.roll <- function(x) {
  cat('summary "roll"\n\n')
  freqs<- data.frame(side= x[[1]]$side, count=x[[1]]$count, prop=x[[1]]$prop)
  print(freqs)
  invisible(x)
}


