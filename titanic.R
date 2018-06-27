library(tidyr)
library(dplyr)
library(readxl)

#ORIGINAL LOADING CODE
titanic <- read_excel("C:/Users/jason/Desktop/Capstone/Titanic (Data Wrangling 2)/titanic3 (1).xls")

#CODE AFTER CHANGINT TO CSV FILE THAT DIDNT WORK WITH CODE BELOW
#titanic_original <- read.csv("C:/Users/jason/Desktop/Capstone/Titanic (Data Wrangling 2)/titanic_original.csv")
#titanic <- titanic_original

#-----------1 Port of embarkation -------------

for(r in 1:nrow(titanic[, 11])){
  if (is.na(titanic[r, 11])) {
    titanic[r, 11] <- "S"
  }
}



#-----------2 Age --------------------

avgAge <- mean(titanic$age, na.rm = TRUE) #29.88113

for(r in 1:nrow(titanic[, 5])){
  if (is.na(titanic[r, 5])) {
    titanic[r, 5] <- avgAge
  }
}

#Alternatively, you could find the average age assigned to each value of ticket (group by ticket)
#and use that to assign an age to any missing values since child tickets were less than an adult ticket
#etc, this might not work though, as variances with cabin would also result in lower fares, but could be
#option.

#-----------3 Lifeboat ---------------
#fill blank spots in the boat column with none
for (r in 1:nrow(titanic[, 12])){
  if (is.na(titanic[r, 12])) {
    titanic[r, 12] <- "None"
  }
}

#-----------4 Cabin ------------------

#Filling missing cabin numbers is a bad idea since each would need to be unique, or nearly unique. Missing
#values probably represent passengers that weren't saved from the sink.

titanic$has_cabin_number <- titanic$cabin

for (r in 1:nrow(titanic[,"has_cabin_number"])){
  if (is.na(titanic[r, "has_cabin_number"])) {
    titanic[r, "has_cabin_number"] <- 0
  } else {
    titanic[r, "has_cabin_number"] <- 1
  }
}

titanic_clean <- titanic

write.csv(titanic_clean, file = "C:/Users/jason/Desktop/Capstone/Titanic (Data Wrangling 2)/titanic_clean.csv")


