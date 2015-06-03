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

#Create plot 2
png("plot2.png", width = 480, height = 480)
plot(powerdf_sub$Time2, powerdf_sub$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()