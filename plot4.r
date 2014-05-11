##--------------------------------------------------------------------------------------------------------------------------##
##  Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007.     ##
##  Plot4                                                                                                                   ##
##--------------------------------------------------------------------------------------------------------------------------##

raw_data <- read.csv("C:/Users/GopalanS/Documents/Adi/DataScience/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";",stringsAsFactors=FALSE) ## Reading Electric power consumption dataset

data <- subset(raw_data,as.Date(strptime(raw_data$Date, format='%d/%m/%Y')) >= as.Date("2007-02-01") & 
                 as.Date(strptime(raw_data$Date, format='%d/%m/%Y'))<= as.Date("2007-02-02"))    ## As per project, data from the dates 2007-02-01 and 2007-02-02

data$Sub_metering_3<-as.character(data$Sub_metering_3) ## converting to charater format

png(file="plot4.png", bg="transparent",width=480,height=480) ## PNG Graphics device

wDays <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

par(mfcol=c(2,2)) ## Splitting the screen

plot(wDays, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power",yaxt="n") ## plotting
axis(2,at=c("0","2","4","6"),labels=c("0","2","4","6")) ## sclaing y axis

plot(wDays, as.numeric(data$Sub_metering_1),type='n',xlab="",ylab="Energy Sub metering",yaxt="n") ## plotting
axis(2,at=c("0","10","20","30"),labels=c("0","10","20","30")) ## scaling y axis

points(wDays, as.numeric(data$Sub_metering_1),type="l",col="black")
points(wDays, as.numeric(data$Sub_metering_2),type="l",col="red")
points(wDays, as.numeric(data$Sub_metering_3),type="l",col="blue")
legend("topright",bty="n",lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(wDays, as.numeric(data$Voltage), type="l", xlab="datetime", ylab="Voltage") ## plotting

plot(wDays, as.numeric(data$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power") ##plotting

dev.off() ## close the device and returns the number and name of the new active device

## OUTPUT - "plot4.png" file will be generated in current working directory.