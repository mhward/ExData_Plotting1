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

#Create plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2)) 

plot(powerdf_sub$Time2, powerdf_sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power",
     cex.axis = .9, cex.lab = .9)

plot(powerdf_sub$Time2, powerdf_sub$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage",
     cex.axis = .9, cex.lab = .9)

ylim <- range(c(powerdf_sub$Sub_metering_1, powerdf_sub$Sub_metering_2, powerdf_sub$Sub_metering_3))
plot(powerdf_sub$Time2, powerdf_sub$Sub_metering_1, type = "l", col = "black",
     ylim = ylim, xlab = "", ylab = "Energy sub metering", 
     cex.axis = .9, cex.lab = .9)
lines(powerdf_sub$Time2, powerdf_sub$Sub_metering_2, type = "l", col = "red")
lines(powerdf_sub$Time2, powerdf_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lwd=1,
       bty = "n", cex = .8)

plot(powerdf_sub$Time2, powerdf_sub$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power",
     cex.axis = .9, cex.lab = .9)
dev.off()