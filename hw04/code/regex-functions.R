##title: regex-function.R
##description:This R script is a practice for manipulating strings 
##input:  String
##output: Strings after split and other conditions

library("tables")
setwd("~/Desktop/Stat133/hw-stat133/hw04/code")

#2.1 Splitting characters
#' @title Split characers
#' @description to split a string of characters 
#' @param string
#' @return splitted characters
split_chars<- function(cstring){
  unlist(strsplit(cstring, ""))
}
#2.2 Number of Vowels
#' @title count vowels
#' @description to count how many vowels in a string
#' @param string (individual letters)
#' @return a frequency table with vowels count
num_vowels<- function(splitstring){
  vowels <- c('a', 'e', 'i', 'o', 'u')
  data <- factor(splitstring, levels = c(vowels))
  table(data[data %in% vowels] )
}

#2.3 Counting vowels
#' @title count vowels
#' @description to count how many vowels in a sentence of a string ignoring case
#' @param string (sentence)
#' @return a frequency table with vowels count 
count_vowels<-function(spli){
  s<- c(split_chars(tolower(spli)))
  num_vowels(s)
}

# 2.4) Reversing Characters
#' @title reversing characters
#' @description function that reverses a string by characters
#' @param string
#' @return reversed string by characters

reverse_chars <- function(string)
{
  string_split = strsplit(as.character(string), split = "")
  reversed_split = string_split[[1]][nchar(string):1]
  paste(reversed_split, collapse="")
}
#2.5  Reversing Sentences by Words
#' @title reversing words
#' @description function that reverses a string by words
#' @param string
#' @return reversed string by words
reverse_words <- function(string)
{
  string_split = strsplit(as.character(string), split = " ")
  string_length = length(string_split[[1]])
  if (string_length == 1) {
    reversed_string = string_split[[1]]
  } else {
    reversed_split = string_split[[1]][string_length:1]
    reversed_string = paste(reversed_split, collapse = " ")
  }
  return(reversed_string)
}

