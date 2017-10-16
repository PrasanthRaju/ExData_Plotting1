library(sqldf)
library(ggplot2)


#Read only rows that have Date equals to 2007-02-01 and 2007-02-02
dfPowerConsumption <- read.csv.sql("C:\\Coursera\\4. Exploratory Data Analysis\\Week 1\\HouseHoldPowerConsumption\\household_power_consumption.txt", sql = "select * from file where Date IN('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

#Add a Day of the Week + Time Series Object
dfPowerConsumption <- mutate(dfPowerConsumption, DateTime = as.POSIXct(paste(dfPowerConsumption$Date,dfPowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S"))

#Open PNG device
png(file = "plot3.png")

#Plot 3: Plot for Sub Metering 1 only
with(dfPowerConsumption, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))

#Plot for Sub metering 2 and 3 with Red and Blue colors respectively
points(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_2, type = "l", col = "red")
points(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_3, type = "l", col = "blue")

#Add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 6)


#Close PNG device
dev.off()