# exploratory-data-analysis
# Peer graded assignment: Course Project 1
# Plot1.R
# Author: Lars Hulzebos

# 0. Init
#{
        rm(list = ls())
        setwd("/Users/Lars2016/MyR")
        setwd("ExploratoryWeek1/data")
#}

# 1. Load data
# {
        FileName<-"household_power_consumption.txt"
        #get the colnames of the dataset forcing them to be as.character
        data_header<-read.table(FileName,sep=";",nrows=1,header=FALSE,colClasses=c(rep("character",9)))
        #read only the relevant part of the datset
        data_raw<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";",header=FALSE)
        #assign the colnames to the dataset
        colnames(data_raw)<-data_header[1,]
# }


#2. Plot the data
#{
        with(data_raw,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
        dev.copy(png,'plot1.png')
        dev.off()
#}