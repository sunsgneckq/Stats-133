#'@title Plot of object roll
#'@description Plots of the relative frequencies
#'@param x the die()
#'@param side the sides of the dice
#'@return barplot
#'@export
plot.roll<- function(x, side = c(1,2,3,4,5,6)){
  summaries<- summary(x)$freqs
  barplot(summaries$prop,xlab = "sides of die", ylab = "relative frequencies",  names.arg=summaries$side, main = paste0(paste("frequencies in a series of", sum(summaries$count), seq= "" ),"die rolls"))
}

