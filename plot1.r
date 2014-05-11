##--------------------------------------------------------------------------------------------------------------------------##
##  Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.     ##
##  Plot1                                                                                                                   ##
##--------------------------------------------------------------------------------------------------------------------------##

raw_data <- read.csv("C:/Users/GopalanS/Documents/Adi/DataScience/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE) ## Reading Electric power consumption dataset

data <- subset(raw_data,as.Date(strptime(raw_data$Date, format='%d/%m/%Y')) >= as.Date("2007-02-01") & 
                        as.Date(strptime(raw_data$Date, format='%d/%m/%Y'))<= as.Date("2007-02-02"))    ## As per project, data from the dates 2007-02-01 and 2007-02-02

png(file="plot1.png", bg="transparent",width=480,height=480) ## PNG Graphics device

hist(as.numeric(data$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)") ## Histograms plot
axis(1,at=c("0","2","4","6"),labels=c("0","2","4","6"))
dev.off() ## close the device and returns the number and name of the new active device

## OUTPUT - "plot1.png" file will be generated in current working directory.

