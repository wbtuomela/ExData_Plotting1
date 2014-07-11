library(data.table)
full_dt <- fread("household_power_consumption.txt", na.strings=c("?", "NA"))
dt <- subset(full_dt, subset=(Date=='1/2/2007'|Date=='2/2/2007'))
dt$Global_active_power <- as.numeric(dt$Global_active_power)
png(filename='plot1.png', width=504, height=504, pointsize=12)
hist(dt$Global_active_power, xlab='Global Active Power (kilowatts)',
     main='Global Active Power', col='red')
dev.off()
