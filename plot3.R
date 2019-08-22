# plot 3
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
       lty = 1)
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off() #close the device