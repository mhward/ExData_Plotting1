setwd("~/_Projects/Coursera Classes/EDA/EDA")


##Read in data frame to powerdf
powerdf <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                      colClasses=c("character","character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                      na.strings = "?", nrows = 2075259, 
                      comment.char = " ")

#change time vector to time format
powerdf$Time2 <- strptime(paste(powerdf$Date, powerdf$Time), format = "%d/%m/%Y %H:%M:%S")
#change character vector date to date format
powerdf$Date2 <- as.Date(powerdf$Date, format = "%d/%m/%Y")

##We will only be using data from the dates 2007-02-01 and 2007-02-02
powerdf_sub <- subset(powerdf, Date2 == "2007-02-01" | Date2 == "2007-02-02")

#Create plot 3
png("plot3.png", width = 480, height = 480)
ylim <- range(c(powerdf_sub$Sub_metering_1, powerdf_sub$Sub_metering_2, powerdf_sub$Sub_metering_3))
plot(powerdf_sub$Time2, powerdf_sub$Sub_metering_1, type = "l", col = "black",
     ylim = ylim, xlab = "", ylab = "Energy sub metering")
lines(powerdf_sub$Time2, powerdf_sub$Sub_metering_2, type = "l", col = "red")
lines(powerdf_sub$Time2, powerdf_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd=1)
dev.off()