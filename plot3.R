
# Read data from the table, replace ? by NA
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# create date/time format
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# create subsample for obs for the two relevant days
sub <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-02-02") )

# remove (large) original data frame
rm(data)

# Plot Energy sub metering
windows()
plot(sub$DateTime, sub$Sub_metering_1,  type="l", 
     ylab="Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, col="red")
lines(sub$DateTime, sub$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(device = png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()
dev.off()
