# Read data from the table, replace ? by NA
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

# create date/time format
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

# create subsample for obs for the two relevant days
sub <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date, "%d/%m/%Y") <= as.Date("2007-02-02") )

# remove (large) original data frame
rm(data)

# create histogram for Global Active Power
windows()
hist(sub$Global_active_power, col="red", main= "Global Active Power",
       xlab = "Global Active Power (kilowats)")
dev.copy(device = png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()
dev.off()