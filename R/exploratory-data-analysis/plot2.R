library(lubridate)
library(dplyr)
setwd("/Users/AmirKh/Documents/R/exploratory-data-analysis")
elect<- read.table("household_power_consumption.txt",sep=";",header = TRUE)
elect<- tbl_df(elect)
elect<- as.data.frame(elect)
elect<-elect[elect$Date %in% c("1/2/2007","2/2/2007"),]
elect$Global_active_power<-as.numeric(as.character(elect$Global_active_power))

elect$Date<-dmy(elect$Date)

elect$datetime<-paste(elect$Date,elect$Time,sep=" ")
elect$datetime<- parse_date_time(elect$datetime,"%Y %m %d %H%M%S")

png("plot2.png", width = 480, height = 480)
plot(elect$datetime,elect$Global_active_power,type="l",xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()
