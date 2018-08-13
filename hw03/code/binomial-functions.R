##title: binomial-functions.R
##description:This R script contains serveral functions I defined. The purpose of the script is to build up a binomial_distribution table
##input: some of the function has input x as a number, and some of the functions has multiple inputs
##output:  TRUE and False for functions testing is a number satisified a conditions. Numbers or distribution tables for binomial distributions.

#Function is_integer()
#' @title Integer
#' @description define a function to test whether a number is integer or not
#' @param x
#' @return TRUE if it is integer
#' @return FALSE if it is not integer
is_integer= function(x){
  if (x%%1==0){
    return (TRUE)}
  else{
    return (FALSE)
  }
}
is_integer(-1)
is_integer(0)
is_integer(2L)
is_integer(2)
is_integer(2.1)
is_integer(pi)
is_integer(0.01)

#Function is_positive()
#' @title positive
#' @description define a function to test whether a number is positive or not
#' @param x
#' @return TRUE if it is positive
#' @return FALSE if it is not positive
is_positive=function(x){
  if(x>0){
    return(TRUE)
  }
  else{
    return(FALSE)
  }
}
is_positive(0.01)
is_positive(2)
is_positive(-2)
is_positive(0)


#Function is_nonnegative()
#' @title nonnegative
#' @description define a function to test whether a number is non-negative or not
#' @param x
#' @return TRUE if it is non-negative
#' @return FALSE if it is not non-negative
is_nonnegative= function(x){
  if (x>=0){
    return(TRUE)
  }
  else{
    return(FALSE)
  }
}
is_nonnegative(0)
is_nonnegative(2)
is_nonnegative(-0.00001)
is_nonnegative(-2)

#Function is_positive_integer()
#' @title Positive integer
#' @description define a function to test whether a number is a positive integer or not
#' @param x
#' @return TRUE if it is a positive integer
#' @return FALSE if it is not a positive integer
is_positive_integer=function(x){
  if (is_positive(x)==TRUE & is_integer(x)==TRUE){
    return(TRUE)
  }
  else{
    return(FALSE)
  }
}
is_positive_integer(2)
is_positive_integer(2L)
is_positive_integer(0)
is_positive_integer(-2)


#Function is_nonneg_integer()
#' @title Nonnegative integer
#' @description define a function to test whether a number is a non-negative-integer or not
#' @param x
#' @return TRUE if it is a non-negative-integer
#' @return FALSE if it is not a non-negative-integer
is_nonneg_integer=function(x){
  if (is_nonnegative(x)== TRUE & is_integer(x)==TRUE){
    return(TRUE)
  }
  else{
    return(FALSE)
  }
}
is_nonneg_integer(0)
is_nonneg_integer(1)
is_nonneg_integer(-1)
is_nonneg_integer(-2.5)


#Function is_probability()
#' @title Probability
#' @description define a function to test whether a number is a probability (in range of 0 to 1)
#' @param p
#' @return TRUE if it is a probability (in proper range)
#' @return FALSE if it is not a probability (not in proper range)
is_probability=function(p){
  if (0<=p & p<=1){
    return(TRUE)
  }
  else{
    return(FALSE)
  }
}
is_probability(0)
is_probability(0.5)
is_probability(1)
is_probability(-1)
is_probability(1.0000001)

#Function bin_factorial()
#' @title binomial factorial (binomial distribution coefficient)
#' @description define a function to calculate the coefficient of binomial distribution 
#' @param x
#' @return the calculated binomial coefficient
 bin_factorial=function(n){
  if(n==0) {
    return(1)}
  else{
  y=1
  for(i in 1:n){
    y<- y*((1:n)[i])
  } 
  return (y)
}}
bin_factorial(5)
bin_factorial(4)
bin_factorial(0)
bin_factorial(8)

#Function bin_combinations()
#' @title binomial combinataions
#' @description define a function that calculate the number of combinations in which k successes can ouur in n trials
#' @param n
#' @param k
#' @return the number of combinations with n choose k
bin_combinations = function(n,k){
  return(bin_factorial(n)/(bin_factorial(k)*bin_factorial(n-k)))
}
bin_combinations(n = 5, k = 2)
bin_combinations(10, 3)
bin_combinations(4, 4)

#Function bin_probability()
#' @title binomial probability
#' @description define a function that calculate the probability of a binomial distribution
#' @param k
#' @param n
#' @param p
#' @return the binomial probability
bin_probability= function(trials,success,prob){
  if(is_nonneg_integer(trials)== FALSE){
    stop("trials cannot be negative or noninteger")
  }
  if(is_nonneg_integer(success)== FALSE){
    stop("success cannot be negative or noninteger")
  }
  if(is_probability(prob)==FALSE){
    stop("probability has to be in range 0 to 1")
  }
  else{
    return(bin_combinations(trials,success)*prob^success*(1-prob)^(trials-success))
  }
}
bin_probability(5,2,0.5)

#Function bin_distribution()
#' @title binomial distribution
#' @description define a function that return a data frame with the probability distribution
#' @param trials
#' @param prob
#' @return the binomial distribution


bin_distribution=function(trials, prob){
  df <- data.frame()
  for(i in 0:trials){
    probabilities<-bin_probability(trials, i, prob)
    newRow <- data.frame(success=i, probability=probabilities)
    df <- rbind(df,newRow)
  }
  return(df)
}


bin_distribution(5,0.5) 
 
