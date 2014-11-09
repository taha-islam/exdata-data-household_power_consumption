path <- "F://Coursera/Johns Hopkins Data Science Specialization//4. Exploratory Data Analysis//Project//exdata-data-household_power_consumption"
setwd(path)
full.data <- read.table("household_power_consumption.txt", na.strings="?"
                        , sep=";", header=TRUE)
data <- full.data[(full.data$Date=="1/2/2007") | (full.data$Date=="2/2/2007"),,drop=FALSE]
rm(full.data)
data$Date <- strptime(data$Date,"%d/%m/%Y")

par(mfrow=c(2,2))
with(data,{
  plot(Global_active_power, ylab="Global Active Power", type="l"
       , xlab="", xaxt="n")
  axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), las=2)
  
  plot(Voltage, ylab="Voltage", xlab="datetime", type="l",xaxt="n")
  axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), las=2)
  
  plot(Sub_metering_1, ylab="Energy sub metering", type="l", col="black"
       , xlab="", xaxt="n")
  lines(Sub_metering_2, ylab="", type="l", col="red"
        , xlab="", xaxt="n", yaxt="n")
  lines(Sub_metering_3, ylab="", type="l",col="blue"
        , xlab="", xaxt="n", yaxt="n")
  axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), las=2)
  legend('topright', names(data)[7:9], lty=1, col=c("black","red","blue"), bty='n', cex=.25)
  
  plot(Global_reactive_power, ylab="Global_reactive_power", type="l"
       , xlab="datetime", xaxt="n")
  axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), las=2)
})

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()