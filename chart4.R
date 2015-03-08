
#The goal of this script is providing a solution to 4th part of Assigment no.1

#Downloading data
file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075259, na.strings = "?")
file2 <- file[file$Date == "1/2/2007" | file$Date == "2/2/2007",]
file2$Date <- strptime(file2$Date, "%d/%m/%Y")
file2$DateTime <- as.POSIXct(paste(file2$Date, file2$Time), format="%Y-%m-%d %H:%M:%S")

#Chart plot
library("datasets")

par(mfcol = c(2,2))

plot(file2$DateTime,file2$Global_active_power
     , type = "l"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = "")

plot(file2$DateTime,file2$Sub_metering_1
     , type = "l"
     , ylab = "Energy sub metering"
     , xlab = "")

lines(file2$DateTime,file2$Sub_metering_2, col = "red")
lines(file2$DateTime, file2$Sub_metering_3 , col = "blue")
legend("topright"
       ,legend  = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" )
       ,lty = 1
       ,col = c("black", "red", "blue"))

plot(file2$DateTime, file2$Voltage
     ,type = "l"
     ,ylab = "Voltage"
     ,xlab = "datetime")

plot(file2$DateTime, file2$Global_reactive_power
     ,type = "l"
     ,ylab = "Global_reactive_power"
     ,xlab = "datetime")

#Saving results
dev.copy(png, file = "chart4.png")
dev.off()
