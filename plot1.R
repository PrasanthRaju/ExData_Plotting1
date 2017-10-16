library(sqldf)

#Read only rows that have Date equals to 2007-02-01 and 2007-02-02
dfPowerConsumption <- read.csv.sql("C:\\Coursera\\4. Exploratory Data Analysis\\Week 1\\HouseHoldPowerConsumption\\household_power_consumption.txt", sql = "select * from file where Date IN('02/01/2007','02/02/2007')", header = TRUE, sep = ";")

#Open PNG device
png(file = "plot1.png")

#Plot 1: Histogram of Global Active Power
hist(dfPowerConsumption$Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close PNG device
dev.off()