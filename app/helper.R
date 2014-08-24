# helper.R

# Use Baltimore Police Department victim based crime data
crime <- read.csv("BPD_Part_1_Victim_Based_Crime_Data.csv",
                  na.strings="")

# Remove data points with no coordinate
crime <- crime[!is.na(crime$Location.1), ]

# Format lattitude and longitude
reformat_loc <- function(loc) {
    gsub(",", ":", gsub("[() ]", "", as.character(loc)))
}

crime$locationvar <- reformat_loc(crime$Location.1)

crime$detail <- paste(tolower(crime$description), " on ",
                      as.character(crime$crimeDate), " at ",
                      as.character(crime$crimeTime), " ",
                      "weapon: ", as.character(crime$weapon))