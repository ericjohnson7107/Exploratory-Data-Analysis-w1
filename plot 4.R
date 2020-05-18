#reading and cleaning data

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data_time <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
data_timev2 <- strptime(paste(data_time$Date, data_time$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#further clearn data

data_globalactive <- as.numeric(data_time$Global_active_power)
data_globalreactive <- as.numeric(data_time$Global_reactive_power)
data_volt <- as.numeric(data_time$Voltage)
data_m1 <- as.numeric(data_time$Sub_metering_1)
data_m2 <- as.numeric(data_time$Sub_metering_2)
data_m3 <- as.numeric(data_time$Sub_metering_3)

#create plot 4

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data_timev2,data_globalactive,type="l",xlab="", ylab="Global Active Power",cex=0.2)

plot(data_timev2, data_volt, type="l", xlab="datetime", ylab="Voltage")

plot(data_timev2, data_m1, type="l", ylab="Energy Submetering", xlab="")
lines(data_timev2, data_m2, type="l", col="red")
lines(data_timev2, data_m3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data_timev2, data_globalreactive, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()