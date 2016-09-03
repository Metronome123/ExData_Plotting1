# exploratory-data-analysis
# Peer graded assignment: Course Project 1
# Plot2.R
# Author: Lars Hulzebos

# 0. Init
#{
        rm(list = ls())
        setwd("/Users/Lars2016/MyR")
        setwd("ExploratoryWeek1/data")
#}

# 1. Load data
#{
        FileName<-"household_power_consumption.txt"
        
        #get the colnames of the dataset forcing them to be as.character
        data_header<-read.table(FileName,sep=";",nrows=1,header=FALSE,colClasses=c(rep("character",9)))
        #read only the relevant part of the datset
        data<-read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep=";",header=FALSE) 
        #assign the colnames to the dataset
        colnames(data)<-data_header[1,]

        #merge Date and Time in DateTime in handy format
        data <- transform(data,DateTime=strptime(paste(data$Date,data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")) 
#}

#2. Plot the data
#{
        plot.new()
        with(data,plot(DateTime,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
        dev.copy(png,'plot2.png')
        dev.off()
#}