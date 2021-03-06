##Reading data
data <- read.csv("household_power_consumption.txt",header=T, sep=';',na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

##Subsetting required data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plotting graph
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##saving the plot in "png" format with required pixels
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
