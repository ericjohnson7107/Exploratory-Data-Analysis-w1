#reading and cleaning data

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data_time <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")

#further clean data

data_timev2 <- strptime(paste(data_time$Date, data_time$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data_m1 <- as.numeric(data_time$Sub_metering_1)
data_m2 <- as.numeric(data_time$Sub_metering_2)
data_m3 <- as.numeric(data_time$Sub_metering_3)

#create plot 3

png("plot3.png", width=480, height=480)
plot(data_timev2, data_m1, type="l", ylab="Energy Submetering", xlab="")
line(data_timev2,data_m2,type="l",col="red")
line(data_timev2,data_m3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()