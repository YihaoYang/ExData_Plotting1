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
# plotting
hist(df$Global_active_power,
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# save to png file
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()
