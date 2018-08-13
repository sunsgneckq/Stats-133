##title: data preparation
##description:Create a csv data files that will contain the required variable to be used in the visualization phase. In this R script, we import the data, organize the data and rearrange it in a way that we want to see.
##input: andre-iguodala.csv,draymond-green.csv,kevin-durant.csv,klay-thompson.csv,stephen-curry.csv
##output:shots-data.csv

#2.1 Data
setwd('/Users/sunsgne/Desktop/Stat133/hw-stat133/hw02')
rename_col <- c(
    'team_name',
    'game_date',
    'season',
    'period',
    'minutes_remaining',
    'seconds_remaining',
    'shot_made_flag',
    'action_type',
    'shot_type',
    'shot_distance',
    'opponent',
    'x',
    'y'
)
column_types <- c(
    'character',
    'character',
    'integer',
    'integer',
    'integer',
    'integer',
    'character',
    'character',
    'character',
    'integer',
    'character',
    'integer',
    'integer'
    )
durant <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE, na.strings = "?", col.names = rename_col, colClasses = column_types)
curry <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE, na.strings = "?", col.names = rename_col, colClasses = column_types )
green <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE, na.strings = "?", col.names = rename_col, colClasses = column_types)
andre <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE, na.strings = "?", col.names = rename_col, colClasses = column_types )
thompson <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE, na.strings = "?", col.names = rename_col, colClasses = column_types)
###Add a column name to each imported data frame, that contains the name of the corresponding player
durant$name <-'Kevin Durant' 
curry$name <- 'Stephen Curry'
green$name <- 'Draymond Green'
andre$name <- 'Andre Iguodala'
thompson$name <- 'Klay Thompson'
###3)Change the original values of shot_made_flag to more descriptive values: replace "n" with "missed shot", and "y" with "made shot". 
levels(durant$shot_made_flag) <- c(levels(durant$shot_made_flag), "missed shot")
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "missed shot"
levels(durant$shot_made_flag) <- c(levels(durant$shot_made_flag), "made shot")
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "made shot"

levels(curry$shot_made_flag) <- c(levels(curry$shot_made_flag), "missed shot")
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "missed shot"
levels(curry$shot_made_flag) <- c(levels(curry$shot_made_flag), "made shot")
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "made shot"

levels(green$shot_made_flag) <- c(levels(green$shot_made_flag), "missed shot")
green$shot_made_flag[green$shot_made_flag == "n"] <- "missed shot"
levels(green$shot_made_flag) <- c(levels(green$shot_made_flag), "made shot")
green$shot_made_flag[green$shot_made_flag == "y"] <- "made shot"

levels(andre$shot_made_flag) <- c(levels(andre$shot_made_flag), "missed shot")
andre$shot_made_flag[andre$shot_made_flag == "n"] <- "missed shot"
levels(andre$shot_made_flag) <- c(levels(andre$shot_made_flag), "made shot")
andre$shot_made_flag[andre$shot_made_flag == "y"] <- "made shot"

levels(thompson$shot_made_flag) <- c(levels(thompson$shot_made_flag), "missed shot")
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "missed shot"
levels(thompson$shot_made_flag) <- c(levels(thompson$shot_made_flag), "made shot")
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "made shot"

# Add a column minute
durant$minute <- durant$period*12-durant$minutes_remaining
curry$minute <- curry$period*12-curry$minutes_remaining
green$minute <- green$period*12-green$minutes_remaining
andre$minute <- andre$period*12-andre$minutes_remaining
thompson$minute <-thompson$period*12-thompson$minutes_remaining

# Use sink() to send the summary() output of each imported data frame into individuals text files:
sink(file ="output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file ="output/stephen-curry-summary.txt")
summary(curry)
sink()

sink(file ="output/graymond-green-summary.txt")
summary(green)
sink()

sink(file ="output/andre-iguodala-summary.txt")
summary(andre)
sink()

sink(file ="output/klay-thompson-summary.txt")
summary(thompson)
sink()
 
#Use the row binding function rbind() to stack the tables into one single data frame (or tibble object).

shots_data<- rbind(curry, andre, durant, green, thompson)
write.csv(shots_data, file = "data/shots-data.csv")

#Use sink() to send the summary() output of the assembled table. Send this output to a text file named shots-data-summary.txt inside the output/ folder.  
combine <- rbind(curry, andre, durant, green, thompson)
sink(file ="output/shots-summary.txt")
summary(combine)
sink()
