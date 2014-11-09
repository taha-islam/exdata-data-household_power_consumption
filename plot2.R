setwd(path)
full.data <- read.table("household_power_consumption.txt", na.strings="?"
                        , sep=";", header=TRUE)
data <- full.data[(full.data$Date=="1/2/2007") | (full.data$Date=="2/2/2007"),,drop=FALSE]
rm(full.data)
data$Date <- strptime(data$Date,"%d/%m/%Y")


plot(data$Global_active_power, ylab="Global Active Power (Kilowatts)", type="l"
     , xlab="", xaxt="n")
axis(1, at=c(1,nrow(data)/2,nrow(data)), labels=c("Thu","Fri","Sat"), las=2)
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()