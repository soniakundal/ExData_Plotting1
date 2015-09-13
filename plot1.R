## reading the data and filtering the data for the date dates 2007-02-01 and 2007-02-02
powerdata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, na.strings = c("?"))
powerdata$newdate <- as.Date(powerdata$Date, format = "%d/%m/%Y")
powerdata$newtime <- strptime(powerdata$Time, format = "%H:%M:%S")
powerdata$datetime <- paste(powerdata$Date,powerdata$Time)
powerdata$datetime <- strptime(powerdata$datetime, format="%d/%m/%Y %H:%M:%S")
febpowerdata <- powerdata[powerdata$newdate %in% as.Date(c('2007-02-01', '2007-02-02')),]

## creating plot 1
hist(febpowerdata$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

## creating plot on png graphics device
dev.copy(png, file = "plot1.png")
dev.off()
