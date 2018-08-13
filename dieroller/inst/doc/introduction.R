## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(dieroller)

## ------------------------------------------------------------------------
mydie<- die()
mydie

## ------------------------------------------------------------------------
loaded<- die(sides = c(1,2,3,4,5,6), prob = c(0.1,0.1,0.1,0.1,0.1,0.5))
loaded

## ------------------------------------------------------------------------
roll100<- roll(mydie, times = 100)
roll100

## ------------------------------------------------------------------------
summary(roll100)

## ---- fig.show="hold"----------------------------------------------------
plot(roll100)

## ------------------------------------------------------------------------
# roll fair die
set.seed(123)
fair_die <- die()
fair500 <- roll(fair_die, times = 500)
# summary method
summary(fair500)
# extracting roll in position 500
fair500[500]
# replacing last roll
fair500[500] <- 1
fair500[500]
summary(fair500)
# adding 100 rolls
set.seed(123)
fair600 <- fair500 + 100
fair600[500] <- 1
summary(fair600)

