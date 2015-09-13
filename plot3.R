## reading the data and filtering the data for the date dates 2007-02-01 and 2007-02-02
powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = c("?"))
powerdata$newdate <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$newtime <- strptime(powerdata$Time, format = "%H:%M:%S")
powerdata$datetime <- paste(powerdata$Date,powerdata$Time)
powerdata$datetime <- strptime(powerdata$datetime, format="%d/%m/%Y %H:%M:%S")
febpowerdata <- powerdata[powerdata$newdate %in% as.Date(c('2007-02-01', '2007-02-02')),]

## creating plot 3
plot (febpowerdata$datetime, febpowerdata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")
points(febpowerdata$datetime,  febpowerdata$Sub_metering_1, col = "black", type = "l")
points(febpowerdata$datetime,  febpowerdata$Sub_metering_2, col = "red", type = "l")
points(febpowerdata$datetime,  febpowerdata$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col =c("black", "red", "blue"))

## creating plot on png graphics device
dev.copy(png, file = "plot3.png")
dev.off()