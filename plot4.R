library(data.table)
full_dt <- fread("household_power_consumption.txt", na.strings=c("?", "NA"))
dt <- subset(full_dt, subset=(Date=='1/2/2007'|Date=='2/2/2007'))
dt$Global_active_power <- as.numeric(dt$Global_active_power)
dt$Date <- as.Date(dt$Date, format='%d/%m/%Y')
times <- strptime(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")
# 2 by 2 plot matrix
png(filename="plot4.png", width=504, height=504)
par(mfrow=c(2,2), mar=c(4,4,3,2), oma=c(1,0,1,0))
# row 1, left plot
plot(times, dt$Global_active_power, type='l', xlab="",
     ylab="Global Active Power (kilowatts)")
# row 1, right plot
plot(times, dt$Voltage, type='l', xlab="datetime", ylab="Voltage")

#row 2, left plot
plot(times, dt$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(times, dt$Sub_metering_2, col="red")
lines(times, dt$Sub_metering_3, col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#row 2, right plot
plot(times, dt$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")

dev.off()

