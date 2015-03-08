#The goal of this script is providing a solution to second part of Assigment no.1

#Downloading data
file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075259, na.strings = "?")
file2 <- file[file$Date == "1/2/2007" | file$Date == "2/2/2007",]
file2$Date <- strptime(file2$Date, "%d/%m/%Y")
file2$DateTime <- as.POSIXct(paste(file2$Date, file2$Time), format="%Y-%m-%d %H:%M:%S")

#Plot
library("datasets")

plot(file2$DateTime,file2$Global_active_power
     , type = "l"
     , ylab = "Global Active Power (kilowatts)"
     , xlab = "")

#Saving results
dev.copy(png, file = "chart2.png")
dev.off()
