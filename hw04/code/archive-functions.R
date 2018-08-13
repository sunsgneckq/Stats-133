##title: archive-functions.R
##description:This R script contains serveral functions that mainly to write a clean table for the archive data for package
##input:  HTMLTable of a specific package
##output: stringr-archive.csv,ggplot2-archive.csv,knitr-archive.csv,xml-archive.csv,dplyr-archive.csv

setwd("~/Desktop/Stat133/hw-stat133/hw04/code")
library("XML")
library("stringr")
library("ggplot2")
#1.1 Read Archive Data Table
read_archive <- function(package_name){
  readHTMLTable(paste0('http://cran.r-project.org/src/contrib/Archive/', package_name))
}
raw_data<- read_archive("stringr")
#1.2 Data cleaning 
#' @title version_name
#' @description to show package name
#' @param col 'version' of the raw data 
#' @return package name
#' @use extract the name of the package
version_names <- function(names){
  gsub("_.*","",names)
}

#' @title version_numbers
#' @description delete the tar.gz and package name, remain with the pure version number
#' @param col 'version' of the raw data 
#' @return pure version number     
version_numbers<- function(series){
  r<-sub(".*_", "", series)
  str_replace(r, ".tar.gz", "")
}

#' @title version_date
#' @description to show package date in form yyyy-mm-dd
#' @param col 'date' of the raw data 
#' @return date in form yyyy-mm-dd
#' @use extract the date of the version
version_date<- function(dates){
  as.Date(gsub(" .*","",dates))
}

#' @title version_size
#' @description convert the size into same units (KB)
#' @param col 'size' of the raw data 
#' @return size of the verision in KB
#' @use extract the size of the version
version_size<-function(sizes){
  lst=strsplit(as.character(sizes),split= "(K)|(M)")
  siz= as.numeric(sapply(lst,"[",1))
  vec<- grep("M", as.character(sizes))
  siz[vec]<-siz[vec]*1000
  return(siz)
}

#' @title clean_archive
#' @description to clean up the data
#' @param raw_data (before clean up )
#' @return a clean data (table)
#' @use extract the number of the version
clean_archive <- function(HTMLtable){
  a <- as.data.frame(HTMLtable)
  names(a) <- c("name", "version", "date", "size", "vers")
  a$vers <- NULL
  a<-a[-2,]
  rownames(a) <- seq(0,length=nrow(a),by=1) 
  a<- na.omit(a)
  a[1]<-as.character(version_names(a$version)[2])
  a[2]<-as.character(version_numbers(a$version))
  a[3]<- as.Date(version_date(a$date))
  a[4]<- as.numeric(version_size(a$size))
  return(a)
}
clean_data<- clean_archive(raw_data)


#export csv file
raw_data <- read_archive('stringr')
clean_data<- clean_archive(raw_data)
write.csv(clean_data, file = "../data/stringr-archive.csv")



#1.3 Timeline Plot
plot_archive<- function(cleandata){
  ggplot(cleandata)+geom_point(mapping=aes(x=date, y=size), color= "dodgerblue2", size= 1.5)+geom_step(mapping=aes(x=date, y=size),color='deepskyblue',size=0.6)+xlab('date')+ylab('Size(Kilobytes)')+ggtitle(paste0(cleandata$name[1],": timeline of version sizes"))+theme_minimal()
}
plot_archive(clean_data)

#1.5)
raw_dataggplot <- read_archive('ggplot2')
clean_dataggplot<- clean_archive(raw_dataggplot)
write.csv(clean_dataggplot, file = "../data/ggplot2-archive.csv")

raw_dataXLM <- read_archive('XML')
clean_dataXLM<- clean_archive(raw_dataXLM)
write.csv(clean_dataXLM, file = "../data/xml-archive.csv")

raw_dataknitr<- read_archive('knitr')
clean_dataknitr<- clean_archive(raw_dataknitr)
write.csv(clean_dataknitr, file = "../data/knitr-archive.csv")

raw_datadplyr<- read_archive('dplyr')
clean_datadplyr<- clean_archive(raw_datadplyr)
write.csv(clean_datadplyr, file = "../data/dplyr-archive.csv")
 