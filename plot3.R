library(dplyr)

# download file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datafile <- "data.zip"

download.file(url, datafile, method = "curl")

# unzip
unzip(datafile)

# read file
data <- read.table("household_power_consumption.txt", 
                   sep = ";", 
                   header = TRUE,
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# filter out relevant dates
tidydata <- filter(data, Date > "2007-01-31" & Date < "2007-02-03")

tidydata <- tidydata %>%
        mutate(DateTime = as.POSIXct(paste(tidydata$Date, tidydata$Time),
                                     format = "%Y-%m-%d %H:%M:%S")) %>%
        select(-Time)

# convert columns to numeric
tidydata$Global_active_power <- as.numeric(tidydata$Global_active_power)
tidydata$Global_reactive_power <- as.numeric(tidydata$Global_reactive_power)
tidydata$Voltage <- as.numeric(tidydata$Voltage)
tidydata$Global_intensity <- as.numeric(tidydata$Global_intensity)
tidydata$Sub_metering_1 <- as.numeric(tidydata$Sub_metering_1)
tidydata$Sub_metering_2 <- as.numeric(tidydata$Sub_metering_2)
tidydata$Sub_metering_3 <- as.numeric(tidydata$Sub_metering_3)

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