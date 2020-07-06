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
# save to png file
dev.copy(png, file = "plot3.png",width=480,height=480)
dev.off()
