# The goal of this script is to provide first part of solution of Assigment no.1

#Downloading data
file <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 2075259, na.strings = "?")
file2 <- file[file$Date == "1/2/2007" | file$Date == "2/2/2007",]
file2$Date <- strptime(file2$Date, "%d/%m/%Y")
file2$Time <- strptime(file2$Time, "%H:%M:%S")

#Chart plot
library("datasets")

hist(file2$Global_active_power
     ,main = "Global Active Power" 
     ,xlab = "Global Active Power (kilowatts)"
     ,col = "red")

#Save results
dev.copy(png, file = "chart1.png")
dev.off()
