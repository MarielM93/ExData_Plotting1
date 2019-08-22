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

# plotting the graphs
## plot 1
source("plot1.R")

## plot 2
source("plot2.R")

## plot 3
source("plot3.R")

## plot 4
source("plot4.R")