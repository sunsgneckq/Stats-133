##title: die.R
##description:Create an object of class
##input:  prob, sides
##output: Dataframe with sides and probability



#' @title check probability validity
#' @description Creates an function to check if the probability input is validity
#' @param prob vector of side probabilities
#' @return True
#' @return error message if certain conditions meet
#' @export
check_prob<- function(prob){
  if(length(prob)!=6|!is.numeric(prob)){
    stop("\n 'prob' must be numeric vector of length 6")
  }
  if (any(prob< 0)| any(prob > 1)){
    stop("\n 'prob' values must be between 0 and 1")
  }
  if (sum(prob) != 1){
    stop("\nelements in 'prob' must add up to 1")
  }
  TRUE
}

#' @title check sides validity
#' @description Creates an function to check if the sides input is validity
#' @param sides vector of sides
#' @return True
#' @return error message if certain conditions meet
#' @export
check_sides<- function(sides){
  if (length(sides)!=6){
    stop("\n 'sides' must be a vector of length 6")
  }
  if(is.logical(sides) == TRUE){
    stop("\n 'sides' must be non longical")
  }
  TRUE
}

#' @title die
#' @description Creates an function to return the die distribution
#' @param  sides a vector of sides
#' @param  prob a vector of probs
#' @return list of sides
#' @return list of prob
#' @export
die <- function(sides = c(1,2,3,4,5,6), prob = c(rep(1/6,6))){
  check_prob(prob)
  check_sides(sides)
  res<- list(sides = sides, prob=prob)
  class(res)<- "die"
  return(res)
}

#' @title print.die
#' @description Creates an function to print the organized die distribution
#' @param  x list from die()
#' @return organized data frame with sides and probability
#' @export
print.die <- function(x) {
  cat('object "die"\n\n')
  cd <- data.frame(
    side = x$sides, prob = x$prob
  )
  print(cd)
  invisible(x)
}
