# plot 2
with(tidydata, plot(DateTime, 
                    Global_active_power, 
                    type = "l", 
                    ylab = "Global Active Power (kilowatts)"))

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off() #close the device