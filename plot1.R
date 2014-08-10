# Load a dataset
q1 <- read.csv('~/Documents/coursera/R_computing/DS spec/Exploratory DA/Project 1//household_power_consumption.txt', sep=';', header=T, na.strings='?', stringsAsFactors=F)

q1$Date <- as.Date(q1$Date, '%d/%m/%Y')
ds <- subset(q1, '2007-02-01'<=q1$Date & q1$Date<= '2007-02-02')

rm(q1)

datetime <- paste(ds$Date, ds$Time)
ds$Datetime <- as.POSIXct(datetime)

# Plot 1
hist(ds$Global_active_power, col='red', xlab='Global Active Power (kilowattes)', ylab='Frequency', main='Global Active Power')
dev.copy(png, width=480, height=480, file='plot1.png')
dev.off()
