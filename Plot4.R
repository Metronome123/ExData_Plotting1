# exploratory-data-analysis
# Peer graded assignment: Course Project 1
# Plot4.R
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
        par(mfrow = c(2, 2)) 
        with(data, {
                plot(DateTime,type="l",Global_active_power)
                plot(DateTime,type="l",Voltage,xlab="datetime")
        
                plot(DateTime,Sub_metering_1, col="black",type="l", xlab="", ylab="Energy sub metering")
                points(DateTime,Sub_metering_2, col="red",type="l")
                points(DateTime,Sub_metering_3, col="blue",type="l")
                legend("topright",pch="_",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5,cex=0.5,bty="n")
                
                plot(DateTime,Global_reactive_power,type="l",xlab="datetime")
        
        })
                
        dev.copy(png,'plot4.png')
        dev.off()
#}