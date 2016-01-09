#Loading the data
mydata <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

mydata$Time <- paste(mydata$Date, mydata$Time,sep = " ")

mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(mydata$Time, format = "%d/%m/%Y %H:%M:%S")

sset <- subset(mydata, as.Date(mydata$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(mydata$Date, "%d/%m/%Y") <= "2007-02-02")

#Making Plots - #3
png (file="plot3.png", width=480, height=480)

with(sset, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()
