#Loading the data
mydata <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

mydata$Time <- paste(mydata$Date, mydata$Time,sep = " ")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format = "%d/%m/%Y %H:%M:%S")

sset <- subset(mydata, as.Date(mydata$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(mydata$Date, "%d/%m/%Y") <= "2007-02-02")

#Making Plots - #4
png (file="plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

with(sset, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

plot(sset$Time, sset$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(sset$Time, sset$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(sset$Time, sset$Sub_metering_2, type="l", col="red")
lines(sset$Time, sset$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(sset$Time, sset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
