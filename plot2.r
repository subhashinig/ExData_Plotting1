##--------------------------------------------------------------------------------------------------------------------------##
##  Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.     ##
##  Plot2                                                                                                                   ##
##--------------------------------------------------------------------------------------------------------------------------##

raw_data <- read.csv("C:/Users/GopalanS/Documents/Adi/DataScience/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE) ## Reading Electric power consumption dataset

data <- subset(raw_data,as.Date(strptime(raw_data$Date, format='%d/%m/%Y')) >= as.Date("2007-02-01") & 
                 as.Date(strptime(raw_data$Date, format='%d/%m/%Y'))<= as.Date("2007-02-02"))    ## As per project, data from the dates 2007-02-01 and 2007-02-02

data$Sub_metering_3<-as.character(data$Sub_metering_3) ## converting to character format

png(file="plot2.png", bg="transparent",width=480,height=480) ## PNG Graphics device

wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S') ## Concatenating date and time

plot(wDays, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)",yaxt="n") ## Plotting

axis(2,at=c("0","2","4","6"),labels=c("0","2","4","6")) ## scaling Y axis

dev.off() ## close the device and returns the number and name of the new active device

## OUTPUT - "plot2.png" file will be generated in current working directory.