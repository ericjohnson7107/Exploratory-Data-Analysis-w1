#reading and cleaning data

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data_time <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

#create plot 2

data_timev2 <- strptime(paste(data_time$Date, data_time$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(data_timev2, data_globalactive, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
