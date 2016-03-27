library(lubridate)
library(dplyr)
setwd("/Users/AmirKh/Documents/R/exploratory-data-analysis")
elect<- read.table("household_power_consumption.txt",sep=";",header = TRUE)
elect<- tbl_df(elect)
elect<- as.data.frame(elect)
elect<-elect[elect$Date %in% c("1/2/2007","2/2/2007"),]
elect$Global_active_power<-as.numeric(as.character(elect$Global_active_power))

elect$Date<-dmy(elect$Date)
View(elect)
elect$datetime<-paste(elect$Date,elect$Time,sep=" ")
elect$datetime<- parse_date_time(elect$datetime,"%Y %m %d %H%M%S")


elect$Sub_metering_1<-as.numeric(as.character(elect$Sub_metering_1))
elect$Sub_metering_2<-as.numeric(as.character(elect$Sub_metering_2))
elect$Sub_metering_3<-as.numeric(as.character(elect$Sub_metering_3))


png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

elect$Voltage<-as.numeric(as.character(elect$Voltage))
elect$Global_reactive_power <-as.numeric(as.character(elect$Global_reactive_power))
plot(elect$datetime,elect$Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")
plot(elect$datetime,elect$Sub_metering_1,type="l",xlab = "",ylab="Energy sub metering",col="black")
lines(elect$datetime,elect$Sub_metering_2,col="red")
lines(elect$datetime,elect$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),
       col=c('black','red','blue'),cex=0.8,bty="n")
plot(elect$datetime, elect$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(elect$datetime, elect$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
