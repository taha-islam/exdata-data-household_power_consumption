path <- "F://Coursera/Johns Hopkins Data Science Specialization//4. Exploratory Data Analysis//Project//exdata-data-household_power_consumption"
setwd(path)
full.data <- read.table("household_power_consumption.txt", na.strings="?"
                        , sep=";", header=TRUE)
data <- full.data[(full.data$Date=="1/2/2007") | (full.data$Date=="2/2/2007"),,drop=FALSE]
rm(full.data)
data$Date <- strptime(data$Date,"%d/%m/%Y")

plot(data$Sub_metering_1, ylab="Energy sub metering", type="l", col="black"
     , xlab="", xaxt="n")
lines(data$Sub_metering_2, ylab="", type="l", col="red"
      , xlab="", xaxt="n", yaxt="n")
lines(data$Sub_metering_3, ylab="", type="l",col="blue"
      , xlab="", xaxt="n", yaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), las=1)
legend('topright', names(data)[7:9], lty=1, col=c("black","red","blue"), cex=.75)
dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()