#'@title extraction
#'@description to extract a value in the roll
#'@param x the roll
#'@param i the index of which roll to be selected
#'@return the ith index number
#' @export
"[.roll"<- function (x,i){
  x$roll[i]
}

#'@title replacemnt
#'@description to replace a value in the roll
#'@param x the roll
#'@param i the index of which roll to be replaces
#'@param value the value that is replaced
#'@return the ith index number with the replacement
#' @export
"[<-.roll" <- function(x, i, value) {
  if (value != summary(x)$freqs$side[1]
      & value != summary(x)$freqs$side[2]
      & value != summary(x)$freqs$side[3]
      & value != summary(x)$freqs$side[4]
      & value != summary(x)$freqs$side[5]
      & value != summary(x)$freqs$side[6]
      ) {
    stop(sprintf('\nreplacing value must be %s or %s or %s or %s or %s or %s',
                 summary(x)$freqs$side[1],
                 summary(x)$freqs$side[2],
                 summary(x)$freqs$side[3],
                 summary(x)$freqs$side[4],
                 summary(x)$freqs$side[5],
    summary(x)$freqs$side[6]))}
  if (i > sum(summary(x)$freqs$count)) {
    stop("\nindex out of bounds")
  }
  x$rolls[i] <- value
  return(x)
}

#'@title addition
#'@description to make addition to the roll
#'@param x the roll
#'@param incr the number of increasing toss
#'@return roll with the incr numbers of toss
#' @export
"+.roll"<- function(x,incr){
  if (length(incr)!=1 | incr<=0){
    stop("\ninvallid increament (must be positive)")
  }
  a<- roll(die(x$sides, x$prob), 600)
  a
}




