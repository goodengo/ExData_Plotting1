data <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=';')
data <- data[which(data$Date %in% c("1/2/2007","2/2/2007")),]
Datetime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data <- cbind(Datetime,data)
colnames(data)[1] <- 'Datetime'
data <- data[,!(names(data) %in% c('Date','Time'))]
png('plot3.png', width = 480, height = 480, unit = "px")
plot(data$Datetime, data$Sub_metering_1,
     type = 'l',
     col = 'black',
     xlab = '',
     ylab='Energy sub metering')
lines(data$Datetime, data$Sub_metering_2,
     type = 'l',
     col = 'red',
     xlab = '',
     ylab='')
lines(data$Datetime, data$Sub_metering_3,
     type = 'l',
     col = 'blue',
     xlab = '',
     ylab='')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),lty=c(1,1,1))
dev.off()