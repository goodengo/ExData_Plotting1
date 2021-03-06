data <- read.csv("household_power_consumption.txt", stringsAsFactors=FALSE, header=TRUE, sep=';')
data <- data[which(data$Date %in% c("1/2/2007","2/2/2007")),]
Datetime <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
data <- cbind(Datetime,data)
colnames(data)[1] <- 'Datetime'
data <- data[,!(names(data) %in% c('Date','Time'))]
png('plot1.png', width = 480, height = 480, unit = "px")
hist(as.numeric(data$Global_active_power),
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)',
     col='red')
dev.off()