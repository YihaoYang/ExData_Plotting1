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
plot(df$Time,df$Global_active_power,
     xlab = "", 
     ylab = "Global Active Power (kilowatts)",
     type='l')
# save to png file
dev.copy(png, file = "plot2.png",width=480,height=480)
dev.off()
