# Load a dataset
q1 <- read.csv('~/Documents/coursera/R_computing/DS spec/Exploratory DA/Project 1//household_power_consumption.txt', sep=';', header=T, na.strings='?', stringsAsFactors=F)

q1$Date <- as.Date(q1$Date, '%d/%m/%Y')
ds <- subset(q1, '2007-02-01'<=q1$Date & q1$Date<= '2007-02-02')

rm(q1)

datetime <- paste(ds$Date, ds$Time)
ds$Datetime <- as.POSIXct(datetime)

# Plot 4
par(mfrow=c(2,2))
with(ds, {
  plot(Global_active_power~Datetime, type='l', xlab='', ylab='Global Active Power')
  plot(Voltage~Datetime, type='l', xlab='datetime', ylab='Voltage')
  with(ds, {
    plot(Sub_metering_1~Datetime, type='l', xlab='', ylab='Energy sub metering')
    lines(Sub_metering_2~Datetime, col='Red')
    lines(Sub_metering_3~Datetime, col="Blue")
  })
  plot(Global_reactive_power~Datetime, type='l', xlab='datetime', ylab='Global_reactive_power')
})
dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()