# read and process data
df <- read.table("household_power_consumption.txt",
                 sep = ";",
                 header = TRUE,
                 na.strings = "?",
)
df$Date <- as.Date(df$Date,format = "%d/%m/%Y")
df <- subset(df,
             Date == "2007-02-01" |
                   Date == "2007-02-02")
df$Time <- paste(df$Date,df$Time)
df$Time <- strptime(df$Time,
                    format="%Y-%m-%d %H:%M:%S")
# plotting
par(mfrow = c(2,2),mar = c(4, 4, 2, 1))
# top left plot
plot(df$Time,df$Global_active_power,
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type='l')

# top right plot
plot(df$Time,df$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = 'l')

# bottom left plot
plot(df$Time,df$Sub_metering_1,
     xlab = "", 
     ylab = "Energy sub metering",
     type='l')
lines(df$Time,df$Sub_metering_2,col="red")
lines(df$Time,df$Sub_metering_3,col="blue")
legend("topright",
       lty = 1,
       col = c("black","red","blue"),
       legend = paste0("Sub_metering_",1:3))

# bottom right
plot(df$Time,df$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")


# save to png file
dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()
