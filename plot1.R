path <- "F://Coursera/Johns Hopkins Data Science Specialization//4. Exploratory Data Analysis//Project//exdata-data-household_power_consumption"
setwd(path)
full.data <- read.table("household_power_consumption.txt", na.strings="?"
                        , sep=";", header=TRUE)
data <- full.data[(full.data$Date=="1/2/2007") | (full.data$Date=="2/2/2007"),,drop=FALSE]
rm(full.data)
data$Date <- strptime(data$Date,"%d/%m/%Y")

hist(data$Global_active_power, col="red", xlab="Global Active Power (Kilowatts)",
     main="Global Active Power")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()