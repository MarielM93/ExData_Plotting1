# plot 4
par(mfcol = c(2,2))

## plot 4a
with(tidydata, plot(DateTime, 
                    Global_active_power, 
                    type = "l", 
                    ylab = "Global Active Power (kilowatts)"))

## plot 4b
with(tidydata, plot(DateTime, 
                    Sub_metering_1, 
                    type = "l", 
                    xlab = "", 
                    ylab = "Energy sub metering"))
lines(tidydata$DateTime, tidydata$Sub_metering_2, col = "red")
lines(tidydata$DateTime, tidydata$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1,
       cex = 0.5, bty = "n")

## plot 4c
with(tidydata, plot(DateTime, 
                    Voltage, 
                    type = "l", 
                    ylab = "Voltage", 
                    xlab = "datetime"))

## plot 4d
with(tidydata, plot(DateTime,
                    Global_reactive_power,
                    type = "l",
                    ylab = "Global_reactive_power",
                    xlab = "datetime"))

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off() #close the device