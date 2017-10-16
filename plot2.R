library(sqldf)
library(ggplot2)


#Read only rows that have Date equals to 2007-02-01 and 2007-02-02
dfPowerConsumption <- read.csv.sql("C:\\Coursera\\4. Exploratory Data Analysis\\Week 1\\HouseHoldPowerConsumption\\household_power_consumption.txt", sql = "select * from file where Date IN('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

#Add a Day of the Week + Time Series Object
dfPowerConsumption <- mutate(dfPowerConsumption, DateTime = as.POSIXct(paste(dfPowerConsumption$Date,dfPowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S"))

#Open PNG device
png(file = "plot2.png")

#Plot 2: Plot line graph
with(dfPowerConsumption, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

#Close PNG device
dev.off()