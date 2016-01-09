#Loading the data
mydata <- read.table ("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
sset <- subset(mydata, as.Date(mydata$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(mydata$Date, "%d/%m/%Y") <= "2007-02-02")

#Making Plots
png (file="plot1.png", width=480, height=480)
hist (sset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
